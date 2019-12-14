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
                <ListItem v-for="article in articleList" :key="article.article_id">
                    <ListItemMeta 
                        avatar="https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/avatar.jpg" 
                        :title="article.article_title" 
                        :description="article.article_abstract"
                    />
                </ListItem>
                <!-- <ListItem>
                    <ListItemMeta avatar="https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar" title="This is title" description="This is description, this is description." />
                </ListItem>
                <ListItem>
                    <ListItemMeta avatar="https://dev-file.iviewui.com/userinfoPDvn9gKWYihR24SpgC319vXY8qniCqj4/avatar" title="This is title" description="This is description, this is description." />
                </ListItem> -->
            </List>
        </div>
        <div class="markdown-body">
        </div>
    </div>
</template>

<script>
import { mapState } from 'vuex'
import 'github-markdown-css/github-markdown.css'
export default {
    title: "博客",
    metaInfo: {
        meta: []
    },
    // 它会在组件实例化前调用，注意不要使用this!
    asyncData({store}) {
        return Promise.resolve().then(() => {
            store.dispatch('getCategoryList')
            store.dispatch('getArticleList', 3)
        })
    },
    data() {
        return {
            selected: 'HTML' // 记录当前选中项
        }
    },
    computed: {
        ...mapState(['categoryList', 'articleList'])
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
  padding-top 14px
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