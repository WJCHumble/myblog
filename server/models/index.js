const db = require("../db/index")

// 简单定义一个sql
const sql = 'SELECT * FROM category'

// 创建查询
db.query(sql, (err, res) => {
    if (err) {
        console.log(`[SELECT ERROR] - `, err.message)
        return
    }
    console.log(res[0]['category_name'])
})

db.end()

// module.exports = sqlRes
