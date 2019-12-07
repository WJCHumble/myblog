<template>
    <div>
        <!-- 分类 -->
        <div class="category">
            <div class="category-item" v-for="(category, index) in categoryList" :key="index">
                <span class="item-name">{{category.category}}</span>
                <span v-for="(item, index) in category.list" :key="index" @click="switchType(item)" :class="{selected: item === selected}">{{item}}</span>
            </div>
        </div>
        <!-- 对应分类的内容 -->
        <div class="content">
            <List>
                <ListItem>
                    <ListItemMeta avatar="https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar" title="This is title" description="This is description, this is description." />
                </ListItem>
                <ListItem>
                    <ListItemMeta avatar="https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar" title="This is title" description="This is description, this is description." />
                </ListItem>
            </List>
        </div>
    </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
    title: "博客",
    metaInfo: {
        meta: []
    },
    // 它会在组件实例化前调用，注意不要使用this!
    asyncData({store}) {
        return store.dispatch('getCategoryList')
    },
    data() {
        return {
            // categoryList: [
            //     {
            //         category: '基础',
            //         list: [
            //             'HTML',
            //             'CSS',
            //             'JavaScript',
            //             'ES6',
            //             'TypeScript',
            //         ]
            //     },
            //     {
            //         category: '框架',
            //         list: [
            //             'Vue',
            //             'React',
            //             'Node',
            //             'Nuxt',
            //             'Express',
            //             '微信小程序'
            //         ]
            //     },
            //     {
            //         category: '数据库',
            //         list: [
            //             'MySQL',
            //             'Mongo'
            //         ]
            //     },
            //     {
            //         category: '其他',
            //         list: [
            //             'HTTP',
            //             'Nginx',
            //             'Redis'
            //         ]
            //     },
            // ],
            selected: 'HTML' // 记录当前选中项
        }
    },
    computed: {
        ...mapState(['categoryList'])
    },
    methods: {
        switchType(item) {
            this.selected = item
        }
    }
}
</script>

<style lang="stylus" scoped>
.view
  padding-top 70px
  max-width 1200px
  margin 0 auto
  position relative
  
.category
    padding 20px
    border-radius 4px
    background #fff
    div
        margin-bottom 10px
    .category-item
        span
            margin-right 40px
            padding 4px 8px
            border-radius 4px
            font-size 12px
            &:hover
                cursor pointer
                color  #4FE8DA
                background #F9FAFB
        span:nth-child(2)
            margin-left 40px
        .item-name
            margin-right 0px
            width 100px
            font-size 15px
            font-weight bold
            &:hover
                cursor text
                color #34495e
.content
    margin-top 10px
    min-height 400px
    padding 20px
    background #fff
.selected
    background #4FE8DA
    color #fff
@media (max-width 600px)
    .category
        padding 10px    
        .category-item
            span
                padding 2px 4px
                margin-right 14px
                font-size 10px
            span:nth-child(2)
                margin-left 10px
            span:last-child
                margin 0px
</style>