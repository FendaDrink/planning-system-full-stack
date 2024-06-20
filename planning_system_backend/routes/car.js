const express = require('express');
const router = express.Router();
const pool = require('../config');
const auth = require('../middleware/auth');
const upload = require('../middleware/upload');
const xlsx = require('xlsx'); // 引入 xlsx 模块
const fs = require('fs');
/* 获取订单车标题和详情 */
const getTitleAndDetail = async (req, res) => {
    const queryTitle = `SELECT title,dataIndex,width FROM car_title`;
    const queryDetail = `SELECT * FROM car_detail`;
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

/* 通过orderId获取公共信息列表 */
const getDetailByOrderId = async (req, res) =>{
    const orderId = req.params.orderId;
    const queryDetail = 'SELECT * FROM car_detail WHERE `orderId` = ?';
    const queryTitle = 'SELECT * FROM car_title';
    const resultQuery = {};
    try{
        // 查询标题信息
        const rows1 = await pool.query(queryTitle);
        const titles = JSON.parse(JSON.stringify(rows1[0]))
        titles.forEach((item)=>{
            resultQuery[item.dataIndex] = item.title
        })

        // 查询详情信息
        const rows2 = await pool.query(queryDetail,[orderId])
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
        resultArr.unshift({
            title:'订单编号',
            value:orderId
        })
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

/* 新增订单车信息记录 */
const addDetail = async (req,res)=>{
    let {orderId, year, inTime, type, airCode, colorCode, batchNum, carNum, varietyCode, carCode, stall, engineCode, customer, orderBatchNum, requirements, remark,} = req.body;
    const queryRepeat = `SELECT * FROM car_detail WHERE orderId = ?`;
    try{
        const rows = await pool.query(queryRepeat,[orderId])
        if(rows[0].length>0){
            return res.status(400).json({
                msg:'订单编号重复',
                code:400,
                data:''
            })
        }
    }catch (err){
        return res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
    const query = `INSERT INTO car_detail (orderId, year, inTime, type, airCode, colorCode, batchNum, carNum, varietyCode, carCode, stall, engineCode, customer, orderBatchNum, requirements, remark) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?)`;
    try {
        await pool.query(query,[orderId.toUpperCase(), year, inTime, type, airCode.toUpperCase(), colorCode, batchNum.toUpperCase(), carNum, varietyCode.toUpperCase(), carCode.toUpperCase(), stall, engineCode.toUpperCase(), customer, orderBatchNum.toUpperCase(), requirements, remark])
        return res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        })
    }catch (err){
        return res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
}

/* 修改订单车信息记录 */
const updateDetail = async (req,res)=>{
    const {orderId, year, inTime, type, airCode, colorCode, batchNum, carNum, varietyCode, carCode, stall, engineCode, customer, orderBatchNum, requirements, remark} = req.body
    const query = `UPDATE car_detail SET orderId=?, year = ?, inTime = ?, type = ?, airCode = ?, colorCode = ?, batchNum = ?, carNum = ?, varietyCode = ?, carCode = ?, stall = ?, engineCode = ?, customer = ?, orderBatchNum = ?, requirements = ?, remark = ? WHERE orderId = ?`;
    let newOrderId = orderId
    if(orderId!=='0'+year+batchNum) newOrderId = '0'+year+batchNum
    try {
        await pool.query(query,[newOrderId.toUpperCase(),year, inTime, type, airCode.toUpperCase(), colorCode, batchNum.toUpperCase(), carNum, varietyCode.toUpperCase(), carCode.toUpperCase(), stall, engineCode.toUpperCase(), customer, orderBatchNum.toUpperCase(), requirements, remark, orderId])
        res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        })
    }catch (err){
        res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
}

/* 删除订单车信息记录 */
const deleteDetail = async (req,res)=>{
    const orderId = req.params.orderId
    const query = 'DELETE FROM car_detail WHERE `orderId` = ?';
    try {
        await pool.query(query,[orderId])
        res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        })
    }catch (err){
        res.status(500).json({
            msg:'数据库错误',
            code:500,
            data:err.message
        })
    }
}

/* 批量删除订单车信息记录 */
const deleteDetailBatch = async (req,res)=>{
    const orderIds = req.body.orderIds
    const query = 'DELETE FROM car_detail WHERE `orderId` IN (?)';
    try {
        await pool.query(query,[orderIds])
        res.status(200).json({
            msg:'操作成功',
            code:200,
            data:""
        })
    }catch (err){
        res.status(500).json({
            msg:'数据库错误',
            code:500,
        })
    }
}

/* 文件上传 */
const uploadFile = async (req, res) => {
    try{
        if (!req.file) {
            return res.status(400).json({
                msg: 'No file uploaded',
                code: 400,
                data: null
            });
        }

        // 读取上传的 xls 文件
        const filePath = req.file.path;
        const workbook = xlsx.readFile(filePath);
        const sheetName = workbook.SheetNames[0]; // 第一个工作表
        const worksheet = workbook.Sheets[sheetName];
        const tableData = xlsx.utils.sheet_to_json(worksheet,{
            raw:false,
            dateNF:'yyyy-mm-dd'
        });
        const year = tableData[0]['__EMPTY_3'];
        const orderBatchNum = tableData[0]['__EMPTY'];
        const result = [];
        for(let i = 2; i < tableData.length; i++){
            let item = tableData[i];
            const varietyCode = item['__EMPTY'].slice(0,4);
            const engineCode = item['__EMPTY'].slice(4,6);
            const stall = item['__EMPTY'].slice(6,7);
            const colorCode = item['__EMPTY'].slice(7,9);
            result.push({
                orderId:'0'+year+item['__EMPTY_4'],
                year:year,
                inTime:item['__EMPTY_5'],
                type:item['订单车计划模板'],
                airCode:item['__EMPTY_7'],
                colorCode:colorCode,
                batchNum:item['__EMPTY_4'],
                carNum:item['__EMPTY_1'],
                varietyCode:varietyCode,
                carCode:item['__EMPTY_8'],
                stall:stall,
                engineCode:engineCode,
                customer:item['__EMPTY_3'],
                orderBatchNum:orderBatchNum,
                requirements:item['__EMPTY_2'],
                remark:item['__EMPTY_6']
            })
        }

        const uniqueData = result.reduce((acc, current) => {
            // 使用一个 Set 来跟踪已处理的 orderId
            const seenOrderIds = acc.map(item => item.orderId);
            if (!seenOrderIds.includes(current.orderId)) {
                acc.push(current);
            }
            return acc;
        }, []);

        fs.unlinkSync(filePath); // 删除上传的文件

        return res.status(200).json({
            msg: '上传成功',
            code: 200,
            data: uniqueData
        });

    }catch (err){
        console.log(err);
    }
};

/* 获取计划用颜色配置标题和详情 */
router.get('/',auth,getTitleAndDetail);

/* 通过orderId获取公共信息列表 */
router.get('/:orderId',auth,getDetailByOrderId);

/* 新增订单车信息记录 */
router.post('/',auth,addDetail);

/* 修改订单车信息记录 */
router.patch('/',auth,updateDetail);

/* 删除订单车信息记录 */
router.delete('/:orderId',auth,deleteDetail);

/* 批量删除订单车信息记录 */
router.post('/deleteBatch',auth,deleteDetailBatch);

/* 文件上传 */
router.post('/upload',auth,upload.single('file'),uploadFile);

module.exports = router;
