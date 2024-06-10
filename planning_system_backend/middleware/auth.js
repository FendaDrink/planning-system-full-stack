const jwt = require('jsonwebtoken');
const auth = (req, res, next) => {
    const token = req.get('Authorization');
    try{
        const deCoded = jwt.verify(token, 'myw love zw ^_^');
        next();
    }catch (err){
        if(err.toString().includes('jwt expired'))
        res.status(405).json({
            code:405,
            msg:'身份认证失效，请重新登录'
        })

        res.status(401).json({
            code:401,
            msg:'认证失败，请先登录'
        })
    }
}

module.exports = auth;