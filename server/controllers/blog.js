const query = require("../db/index")

function getCategory(req, res, next) {

    // 连接查询
    const sql = 'SELECT category.category_name, category_detail.tech_name FROM category INNER JOIN category_detail ON category.id=category_detail.category_id'

    query(sql, (err, result) => {
        if (err) {
            console.log(`[SELECT ERROR] - `, err.message)
            return
        }
        let categoryList = []
        result.map((value) => {
            if (categoryList.length === 0) {
                categoryList[0] = {
                    category: value.category_name,
                    list: [value.tech_name]
                }
            }
            categoryList.map((categoryItem, index) => {
                if (categoryItem['category'] === value.category_name && !categoryItem.list.includes(value.tech_name)) {
                    categoryItem.list.push(value.tech_name)
                }
                if (categoryItem['category'] !== value.category_name && index === categoryList.length - 1) {
                    value = {
                        category: value.category_name,
                        list: [value.tech_name]
                    }
                    categoryList.push(value)
                }
            })
        })
        console.log(categoryList)
        // 返回数据给前端
        let data = {
            status: 1001,
            message: 'success',
            data: {
                categoryList
            }
        }

        res.json(data)
    })
}

function getArticleList(req, res, next) {
    // 获取前端传的技术类别ID
    const techId = req.query.techId
    console.log(techId)
    // 默认取前10条
    const sql = `SELECT article_id, article_title, article_abstract, create_date, read_count FROM article WHERE tech_id = '${techId}' LIMIT 10`

    query(sql, (err, result) => {
        if (err) {
            console.log(`[SELECT ERROR] - `, err.message)
            return
        }
        console.log(result)
        let data = {
            status: 1001,
            message: 'success',
            data: {
                articleList: result
            }
        } 
        res.json(data)
    })
}

module.exports = {
    getCategory,
    getArticleList
}
