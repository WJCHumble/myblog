const express = require('express')
const route = express.Router()
const blog = require('../controllers/blog')

route.get('/api/category', blog.getCategory)

module.exports = route