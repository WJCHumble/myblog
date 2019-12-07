const express = require('express')
const route = express.Router()
const blog = require('../controllers/index')

route.get('/api/category', blog.getCategory)

module.exports = route