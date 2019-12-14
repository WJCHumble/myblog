const blog = require('./blog')
const home = require('./home')

module.exports = function (app) {
    app.use(blog)
    app.use(home)
}
