const express = require('express');
const router = express.Router();
const pool = require('../config');
const auth = require('../middleware/auth');


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/log',auth,async (req,res)=>{
  const query = 'SELECT * FROM operation_logs ORDER BY timestamp DESC';
  try{
    let rows = await pool.query(query);
    return res.status(200).json({
      msg:'操作成功',
      code:200,
      data:rows[0]
    })
  }catch (err){
    return res.status(500).json({
      msg:'数据库错误',
      code:500,
      data:err.message
    })
  }
})

module.exports = router;
