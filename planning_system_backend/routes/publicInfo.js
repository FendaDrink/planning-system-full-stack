const express = require('express');
const router = express.Router();
const pool = require('../config');
const auth = require('../middleware/auth');
const uuid = require('uuid');

/* 获取详细公共信息标题 */
const getTitle = async (req, res) =>{
    const query = 'SELECT title,dataIndex,width FROM public_title ORDER BY `key`';
    try{
        // 查询标题信息
        const rows = await pool.query(query);
        // 返回成功响应
        return res.status(200).json({
            msg:'操作成功',
            code:200,
            data:rows[0]
        })
    } catch (err){
        // 返回错误响应
        return res.status(500).json({
            msg:"数据库错误",
            code:500,
            data: err.message
        })
    }
}

/* 获取详细公共信息列表 */
const getDetail = async (req, res) =>{
    const query = 'SELECT * FROM public_detail';
    try{
        const rows = await pool.query(query);
        // 返回成功响应
        return res.status(200).json({
            msg:'操作成功',
            code:200,
            data:rows[0]
        })
    } catch (err){
        // 返回错误响应
        return res.status(500).json({
            msg:"数据库错误",
            code:500,
            data: err.message
        })
    }
}

/* 通过key获取详细公共信息列表 */
const getDetailByKey = async (req, res) =>{
    const key = req.params.key;
    const queryDetail = 'SELECT * FROM public_detail WHERE `key` = ?';
    const queryTitle = 'SELECT * FROM public_title';
    const resultQuery = {};
    try{
        // 查询标题信息
        const rows1 = await pool.query(queryTitle);
        const titles = JSON.parse(JSON.stringify(rows1[0]))
        titles.forEach((item)=>{
            resultQuery[item.dataIndex] = item.title
        })

        // 查询详情信息
        const rows2 = await pool.query(queryDetail,[key])
        const obj = JSON.parse(JSON.stringify(rows2[0]))[0];
        const resultArr = [];

        // 构造结果数组
        const itemArr = Object.keys(obj);
        itemArr.shift();
        for(let key of itemArr){
            resultArr.push({
                title:resultQuery[key],
                value:obj[key]
            })
        }

        // 返回成功响应
        return res.status(200).json({
            msg:'操作成功',
            code:200,
            data:resultArr
        })
    }catch (err){
        // 返回错误响应
        return res.status(500).json({
            msg:"数据库错误",
            code:500,
            data: err.message
        })
    }
}


/* 通过key获取生产线特殊信息 */
const getSpecialByKey = async (req,res) => {
    const key = req.params.key;
    const query = 'SELECT label,value FROM special WHERE `key` = ?'
    try{
        const rows = await pool.query(query,[key]);
        console.log(rows);
        // 返回成功响应
        return res.status(200).json({
            msg:'操作成功',
            code:200,
            data:rows[0]
        })
    }catch (err){
        // 返回错误响应
        return res.status(500).json({
            msg:"数据库错误",
            code:500,
            data: err.message
        })
    }
}

/* 修改生产线特殊信息 */
const updateSpecial = async (req,res) =>{
    const {key,value} = req.body;
    const query = 'UPDATE special SET value = ? WHERE `key` = ?';
    try{
        const rows = await pool.query(query,[value,key])
        // 返回成功响应
        return res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        })
    }catch (err){
        // 返回错误响应
        return res.status(500).json({
            msg:"数据库错误",
            code:500,
            data: err.message
        })
    }
}

/* 增加详细公共信息记录 */
const addRecord = async (req,res) =>{
    const {code,type,name,classes,speed,efficiency,group,flow,simple} = req.body;
    const key = uuid.v1();
    // 判断生产线编号是否重复
    const queryCode = 'SELECT * FROM public_detail WHERE `code` = ?';
    // 公共信息
    const queryPublic = 'INSERT INTO public_detail(`key`,`code`,`type`,`name`,`classes`,`speed`,`efficiency`,`group`,`flow`,`simple`) VALUES(?,?,?,?,?,?,?,?,?,?)';
    // 特殊信息
    const querySpecial = 'INSERT INTO special(`key`,`code`,`label`,`value`) VALUES(?,?,?,?)';
    try{
        // 判断生产线编号是否重复
        const rowsRepeat = await pool.query(queryCode,[code]);
        if(rowsRepeat[0].length>0) return res.status(400).json({
            msg:'生产编号已存在',
            code:400,
            data:""
        })

        const label = ['车身','总装'].includes(type) ? '白车身码':'颜色码';

        // 分别插入公共信息和特殊信息
        const insertResults = await Promise.allSettled([pool.query(queryPublic,[key,code.toUpperCase(),type,name,classes,speed,efficiency,group,flow,simple]),pool.query(querySpecial,[key,code,label,''])])

        const errors = insertResults.filter(result=>result.status==='rejected');

        // 如果有任何一个插入操作失败，返回错误
        if(errors.length>0) throw new Error(errors[0].reason.message || errors[1].reason.message);
        // 返回成功相响应
        return res.status(200).json({
            msg:'新增成功',
            code:200,
            data:""
        })
    }catch (err){
        // 返回错误响应
        res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
}

/* 修改详细公共信息记录 */
const updateRecord = async (req,res) =>{
    const {key,code,type,name,classes,speed,efficiency,group,flow,simple} = req.body;
    const query = 'UPDATE public_detail SET `code` = ?,`type` = ?,`name` = ?,`classes` = ?,`speed` = ?,`efficiency` = ?,`group` = ?,`flow` = ?,`simple` = ? WHERE `key` = ?';
    const queryType = 'SELECT * FROM public_detail WHERE `key` = ?';

    try{
        const row = await pool.query(queryType,[key]);
        const oldType = row[0][0].type;
        if(type!==oldType){
            if(type==='涂装'){
                const label = '颜色码';
                await pool.query('UPDATE special SET `label` = ?,`value` = ? WHERE `key` = ?',[label,"",key]);
            }else if(['车身','总装'].includes(type) && oldType === '涂装'){
                const label = '白车身码';
                await pool.query('UPDATE special SET `label` = ?,`value` = ? WHERE `key` = ?',[label,"",key]);
            }
        }

        await pool.query(query,[code,type,name,classes,speed,efficiency,group,flow,simple,key]);
        // 返回成功响应
        return res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        })
    }catch (err){
        console.log(err);
        // 返回错误响应
        return res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
}

/* 删除详细公共信息记录 */
const deleteRecord = async (req, res) =>{
    const key = req.params.key;
    const queryDetail = 'DELETE FROM public_detail WHERE `key` = ?';
    const querySpecial = 'DELETE FROM special WHERE `key` = ?';
    try{
        let deleteResults =  await Promise.allSettled([pool.query(queryDetail,[key]),pool.query(querySpecial,[key])]);

        const errors = deleteResults.filter(result=>result.status==='rejected');

        // 如果有任何一个插入操作失败，返回错误
        if(errors.length>0) return res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:errors.reason
        })

        // 返回成功相应
        return res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        })
    }catch (err){
        // 返回错误响应
        return res.status(500).json({
            msg:"数据库错误",
            code:500,
            data: err.message
        })
    }

}

/* 获取详细公共信息标题 */
router.get('/',auth,getTitle);

/* 获取详细公共信息列表 */
router.get('/getDetail',auth,getDetail);

/* 通过key获取详细公共信息列表 */
router.get('/getDetail/:key',auth, getDetailByKey);

/* 增加详细公共信息记录 */
router.post('/getDetail',auth,addRecord);

/* 修改详细公共信息记录 */
router.patch('/getDetail',auth,updateRecord);

/* 删除详细公共信息记录 */
router.delete('/getDetail/:key',auth,deleteRecord);

/* 通过key获取生产线特殊信息 */
router.get('/getDetail/special/:key',auth,getSpecialByKey);

/* 修改生产线特殊信息 */
router.patch('/getDetail/special',auth,updateSpecial);

module.exports = router;
