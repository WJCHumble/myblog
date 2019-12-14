const express = require('express')
const route = express.Router()
const blog = require('../controllers/blog')

route.get('/api/category', blog.getCategory)
route.get('/api/articleList', blog.getArticleList)

module.exports = route