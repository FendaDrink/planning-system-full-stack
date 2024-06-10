const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors');
const pool = require('./config');
const bodyParser = require('body-parser');

const indexRouter = require('./routes/index');
const loginRouter = require('./routes/login');
const publicInfoRouter = require('./routes/publicInfo');
const engineRouter = require('./routes/engine');
const colorRouter = require('./routes/color');

const app = express();

app.use(cors());

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// 中间件：解析请求体
app.use(bodyParser.json());

// 中间件：操作记录
app.use((req, res, next) => {
  res.on('finish',async ()=>{
    const { statusCode } = res;
    const status = statusCode >= 400 ? '失败' : '成功';
    try {
      // 将请求信息保存到数据库中
      const [rows, fields] = await pool.execute('INSERT INTO operation_logs (method, user , url, requestBody, timestamp , status) VALUES (?, ? , ?, ?, ? , ?)', [
        req.method,
        decodeURI(req.headers.username),
        req.originalUrl,
        JSON.stringify(req.body),
        new Date(),
        status
      ]);
    } catch (error) {
      console.error('Failed to insert operation log:', error);
    }
  })


  next(); // 继续处理下一个中间件或路由处理程序
});


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/login', loginRouter);
app.use('/publicInfo', publicInfoRouter);
app.use('/engine',engineRouter);
app.use('/color',colorRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

//设置跨域访问（设置在所有的请求前面即可）
app.all("*", function (req, res, next) {
  //设置允许跨域的域名，*代表允许任意域名跨域
  res.header("Access-Control-Allow-Origin", "*");
  //允许的header类型
  res.header("Access-Control-Allow-Headers", "content-type");
  //跨域允许的请求方式
  res.header("Access-Control-Allow-Methods", "DELETE,PUT,POST,GET,OPTIONS");
  if (req.method === 'OPTIONS')
    res.sendStatus(200); //让options尝试请求快速结束
  else
    next();
});

module.exports = app;
