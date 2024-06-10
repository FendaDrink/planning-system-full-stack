const mysql = require("mysql2/promise");
const pool = mysql.createPool({
    host:'localhost', // 唯一要修改的
    user:'root', // 账号
    password:'admin', // 密码
    database:'management',// 数据库名
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
})
module.exports = pool;
