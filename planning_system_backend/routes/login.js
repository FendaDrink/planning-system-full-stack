const express = require('express');
const router = express.Router();
const pool = require('../config');
const jwt = require('jsonwebtoken');
const secretKey = 'myw love zw ^_^';
const bcrypt = require('bcrypt');

/* 登陆接口 */
const login =  async (req, res) => {
  const {username, password} = req.body;
  const query = 'SELECT * FROM user WHERE account = ?';
  try{
    const [rows] = await pool.query(query,[username]);

    if(rows.length === 0){
      return res.status(401).json({
        msg:'该用户名不存在',
        code:401,
        data:""
      })
    }
    const passwordHash = await bcrypt.compare(password, rows[0].password);
    if(passwordHash){
      const token = jwt.sign({
        username: username,
      }, secretKey, {
        expiresIn: '3600s'
      });
      return res.status(200).json({
        msg:'操作成功',
        code:200,
        data:{
          username:rows[0].username,
          token:token
        }
      });
    }else{
      return res.status(401).json({
        code: 401,
        msg:'密码错误'
      });
    }
  }catch (err){
    res.status(500).json({
      msg:'数据库错误',
      code:500,
      data:err.message
    })
  }

}

router.post('/',login);

module.exports = router;
