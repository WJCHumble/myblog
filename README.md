## 前言

学 Node 和 Vue 也有一段时间了，但是 Vue 用的很多，Node 就用的很少，记忆点有点模糊了...所以打算捣鼓一下 Vue SSR，重温一下 Node，以及掌握 Vue SSR，利用 Express + Vue SSR 做一个个人博客网站。目前项目已经搭建完成，已经可以对路由页面的 header 进行 SEO 相关的配置（具体配置方法，可以看我代码中的 Demo，meta标签借助的是 vue-meta-info这个插件）。后续项目应该会上线，有兴趣的同学可以先 star，用这个空项目自己先进行开发也行。

## 技术栈

Vue SSR + Express + MySQL + iView + Stylus

## 问题解决

1. 路由配置，不需要单独为App.vue配置一个最高级的路由/，在app.js中就已经渲染了它

2. 引入iview，webpack报错不能解析字体，在webpack.base.config中添加字体文件如下配置
    ,{
        test: /\.(woff2?|eot|ttf|otf)(\?.*)?$/,
        loader: 'url-loader',
        options: {
        limit: 10000,
        name: 'fonts/[name].[hash:7].[ext]'
        }
    }

3. 摘要文本溢出处理
    .abstract 
        color #34495e
        display -webkit-box
        overflow hidden
        -webkit-line-clamp 2
        -webkit-box-orient vertical

4. mysql数据库连接问题
    由于我每一次访问controller都会引用数据库连接，所以会导致我多次访问多次连接，然后崩溃...
    所以，我需要用 MySQL 连接池来管理数据库连接
```javascript
const mysql = require('mysql')
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'myblog',
    port: 3306
})

const query = function (sql, callback) {
    pool.getConnection(function(err, conn) {
        if (err) {
            callback(err, null, null)
        } else {
            conn.query(sql, function(qerr, vals, fields) {
                // 释放链接
                conn.release()
                callback(qerr, vals. fields)
            })
        }
    })
}
```

5. 解决mapState不能被解析的问题
```javascript
    "presets": [
        "stage-2"
    ],
```

6. 需要注意的是在 action、asyncData 中都需要return 一个Promise

