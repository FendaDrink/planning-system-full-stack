const express = require('express');
const router = express.Router();
const pool = require('../config');
const auth = require('../middleware/auth');
const uuid = require('uuid');



/* 通过key获取详细公共信息列表 */
const getDetailByKey = (req, res) =>{
    const key = req.params.key;
    const query = 'SELECT * FROM public_detail WHERE `key` = ?';
    const queryTitle = 'SELECT * FROM public_title';
    const resultQuery = {};
    pool.query(queryTitle,(err,result)=>{
        if(err){
            res.json({
                msg: 'Database error',
                code:500,
                data:err
            })
        }
        result = JSON.parse(JSON.stringify(result))
        result.forEach((item)=>{
            resultQuery[item.dataIndex] = item.title
        })
    })
    pool.query(query,[key],(err, result) =>{
        if(err){
            res.json({
                msg: 'Database error',
                code:500,
                data:err
            })
        }
        const obj = JSON.parse(JSON.stringify(result))[0];
        const resultArr = [];
        const itemArr = Object.keys(obj);
        itemArr.shift();
        for(let key of itemArr){
            resultArr.push({
                title:resultQuery[key],
                value:obj[key]
            })
        }
        res.json({
            msg: '操作成功',
            code:200,
            data:resultArr
        })
    })
}

/* 增加详细公共信息记录 */
const addRecord = async (req,res) =>{
    const {code,type,name,classes,speed,efficiency,group,flow,simple} = req.body;
    const key = uuid.v1();
    const query = 'INSERT INTO public_detail(`key`,`code`,`type`,`name`,`classes`,`speed`,`efficiency`,`group`,`flow`,`simple`) VALUES(?,?,?,?,?,?,?,?,?,?)';
    try{
        const rows = await pool.query(query,[key,code,type,name,classes,speed,efficiency,group,flow,simple]);
        // 返回成功响应
        res.json({
            msg: '操作成功',
            code:200,
            data:""
        })
    }catch (err){
        // 返回错误响应
        res.json({
            msg: 'Database error',
            code:500,
            data:err
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

/* 删除详细公共信息记录 */
router.delete('/getDetail/:key',auth,deleteRecord);

module.exports = router;
