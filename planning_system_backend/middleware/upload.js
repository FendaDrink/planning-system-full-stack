const fs = require('fs');
const path = require('path');

/* 上传文件相关 */
const multer = require('multer');

// 配置 multer 存储文件
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        const uploadPath = path.join(__dirname, '..', 'uploads');
        // 检查目录是否存在，如果不存在则创建
        fs.mkdirSync(uploadPath, { recursive: true });
        cb(null, uploadPath);
    },
    filename: function (req, file, cb) {
        cb(null, `${Date.now()}-${file.originalname}`); // 文件名
    }
});

module.exports =  upload = multer({ storage: storage });