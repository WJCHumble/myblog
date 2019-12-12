const express = require('express')
const route = express.Router()
const home = require('../controllers/home')

route.get('/api/banner', home.getBanner)

module.exports = route