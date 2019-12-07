const mysql = require('mysql')
var pool = mysql.createPool({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: '',
    database: 'myblog'
})

const query = function (sql, callback) {
    pool.getConnection(function(err, conn) {
        if (err) {
            callback(err, null, null)
        } else {
            conn.query(sql, function(qerr, vals, fields) {
                // 释放连接
                conn.release()
                callback(qerr, vals, fields)
            })
        }
    })
}

// 向外暴露连接数据库的db对象
module.exports = query