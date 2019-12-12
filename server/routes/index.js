const category = require('./blog')
const banner = require('./home')

module.exports = function (app) {
    app.use(category)
    app.use(banner)
}
