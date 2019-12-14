const query = require("../db/index")

function getBanner(req, res, next) {
    const sql = "SELECT * FROM banner"

    query(sql, (err, result) => {
        if (err) {
            console.log(`[SELECT ERROR] - `, err.message)
            return
        }

        console.log(result)

        const data = {
            status: 1001,
            message: 'success',
            data: {
                bannerList: result
            }
        }

        res.json(data)
    })
}

module.exports = {
    getBanner
}
