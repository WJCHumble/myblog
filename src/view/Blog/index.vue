<template>
    <div>
        <!-- 分类 -->
        <div class="category">
            <div class="category-item" v-for="(category, index) in categoryList" :key="index">
                <span class="item-name">{{category.category}}</span>
                <span v-for="(item, index) in category.list" :key="index">{{item}}</span>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    title: "博客",
    metaInfo: {
        meta: []
    },
    data() {
        return {
            categoryList: [
                {
                    category: '基础',
                    list: [
                        'HTML',
                        'CSS',
                        'JavaScript',
                        'ES6',
                        'TypeScript',
                    ]
                },
                {
                    category: '框架',
                    list: [
                        'Vue',
                        'React',
                        'Node',
                        'Nuxt',
                        'Express',
                        '微信小程序'
                    ]
                },
                {
                    category: '数据库',
                    list: [
                        'MySQL',
                        'Mongo'
                    ]
                },
                {
                    category: '其他',
                    list: [
                        'HTTP',
                        'Nginx',
                        'Redis'
                    ]
                },
            ]
        }
    }
}
</script>

<style lang="stylus" scoped>
.category
    div
        margin-bottom 10px
    .category-item
        span
            margin-right 60px
            font-size 12px
            &:hover
                cursor pointer
                color  #f60
        span:nth-child(2)
            margin-left 40px
        .item-name
            margin-right 0px
            width 100px
            font-size 15px
            font-weight bold
            &:hover
                cursor text
</style>