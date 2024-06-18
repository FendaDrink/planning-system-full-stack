const express = require('express');
const router = express.Router();
const pool = require('../config');
const auth = require('../middleware/auth');
const uuid = require('uuid');

/* 获取特殊发动机标题和数据 */
const getTitleAndDetail = async (req, res) => {
    const queryTitle = `SELECT title,dataIndex,width FROM engine_title`;
    const queryDetail = `SELECT * FROM engine_detail`;
    try {
        const queryResults = await Promise.allSettled([pool.query(queryTitle),pool.query(queryDetail)])

        const errors = queryResults.filter(item => item.status === 'rejected');

        // 如果有任何一个插入操作失败，返回错误
        if(errors.length>0) return res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:errors.reason
        })

        const result = {
            title:queryResults[0].value[0],
            value:queryResults[1].value[0]
        }
        // 返回成功响应
        res.status(200).json({
            msg:'操作成功',
            code:200,
            data:result
        });
    } catch (err) {
        // 返回失败响应
        res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
}

/* 增加特殊发动机数据记录 */
const addDetail = async (req, res) => {
    const {code,stall,name} = req.body;
    const key = uuid.v1();
    // 插入语句
    const query = 'INSERT INTO engine_detail (`key`,code,stall,name) VALUES (?,?,?,?)';
    // 判断生产线编号是否重复
    const queryCode = 'SELECT * FROM engine_detail WHERE `code` = ?';
    try{
        let rowsRepeat = await pool.query(queryCode,[code]);
        if(rowsRepeat[0].length>0) throw new Error('生产线编号重复');
        await pool.query(query,[key,code,stall,name]);
        res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        });
    }catch (err){
        res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
}

/* 修改特殊发动机数据记录 */
const updateDetail = async (req, res) => {
    const {key,code,stall,name} = req.body;
    const query = 'UPDATE engine_detail SET `code` = ?,`stall` = ?,`name` = ? WHERE `key` = ?';
    try{
        const queryRepeat = 'SELECT * FROM engine_detail WHERE `code`=?';
        const rowsRepeat = await pool.query(queryRepeat,[code]);
        if (rowsRepeat[0].length>1){
            return res.status(400).json({
                msg:'特殊发动机代码重复',
                code:400,
                data:''
            })
        }
    }catch (err){
        res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
    try{
        await pool.query(query,[code,stall,name,key]);
        res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        });
    }catch (err){
        res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
}

/* 删除特殊发动机数据记录 */
const deleteDetail = async (req, res) => {
    const key = req.params.key;
    const queryDetail = 'DELETE FROM engine_detail WHERE `key` = ?';
    try{
        await pool.query(queryDetail,[key]);
        res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        });
    }catch (err){
        res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
}

/* 获取特殊发动机标题和数据 */
router.get('/',auth,getTitleAndDetail);

/* 添加特殊发动机数据记录 */
router.post('/',auth,addDetail);

/* 修改特殊发动机数据记录 */
router.patch('/',auth,updateDetail);

/* 删除特殊发动机数据记录 */
router.delete('/:key',auth,deleteDetail)

module.exports = router;
