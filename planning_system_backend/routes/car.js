const express = require('express');
const router = express.Router();
const pool = require('../config');
const auth = require('../middleware/auth');

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

/* 新增订单车信息记录 */
const addDetail = async (req,res)=>{
    const {orderId, year, inTime, type, airCode, colorCode, batchNum, carNum, varietyCode, carCode, stall, engineCode, customer, orderBatchNum, requirements, remark,} = req.body
    const query = `INSERT INTO car_detail (orderId, year, inTime, type, airCode, colorCode, batchNum, carNum, varietyCode, carCode, stall, engineCode, customer, orderBatchNum, requirements, remark) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?)`;
    try {
        await pool.query(query,[orderId, year, inTime, type, airCode, colorCode, batchNum, carNum, varietyCode, carCode, stall, engineCode, customer, orderBatchNum, requirements, remark])
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
/* 获取计划用颜色配置标题和详情 */
router.get('/',auth,getTitleAndDetail);

/* 新增订单车信息记录 */
router.post('/',auth,addDetail);

/* 删除订单车信息记录 */
router.delete('/:orderId',auth,deleteDetail);
module.exports = router;
