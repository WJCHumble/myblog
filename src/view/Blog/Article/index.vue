<template>
    <div class="page">
        <div class="left-content">
            <List item-layout="vertical">
                <ListItem v-for="(item, index) in articleList" :key="index">
                    <ListItemMeta avatar="https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/avatar.jpg">
                        <template slot="title">
                            <div  @click="$router.push('/blog/detail/0')">
                                {{item.article_title}}
                            </div>
                        </template>
                    </ListItemMeta>
                    <div class="abstract">
                        {{ item.article_abstract }}
                    </div>
                    <template slot="action">
                        <li>
                            <Icon type="ios-eye-outline" :size="20"/> {{item.read_count}}
                        </li>
                    </template>
                    <template slot="extra">
                        <img class="article-img" :src="item.article_img" style="width: 280px">
                    </template>
                </ListItem>
            </List>
        </div>
        <div class="right-content">
            <!-- 文章分类 -->
            <div class="category-list">
                <h1>文章分类</h1>
                <div class="category-item">
                    <Icon type="ios-paper" />
                    <a href="#" title="程序人生">程序人生</a>
                    （100）
                </div>
                <div class="category-item">
                    <Icon type="ios-paper" />
                    <a href="#" title="译文">译文</a>
                    （100）
                </div>
                <div class="category-item">
                    <Icon type="ios-paper" />
                    <a href="#" title="数据结构和算法">数据结构和算法</a>
                    （100）
                </div>
                <div class="category-item">
                    <Icon type="ios-paper" />
                    <a href="#" title="前端">前端</a>
                    （100）
                </div>
                <div class="category-item">
                    <Icon type="ios-paper" />
                    <a href="#" title="后端">后端</a>
                    （100）
                </div>
                <div class="category-item">
                    <Icon type="ios-paper" />
                    <a href="#" title="运维">运维</a>
                    （100）
                </div>
            </div>
            <!-- 个人信息 -->
            <div class="profile-info">

            </div>
        </div>
        <!-- <div class="markdown-body">
        </div> -->
        <router-view></router-view>
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
            selected: 'HTML', // 记录当前选中项
            exploreCount: null,
            commentCount: null,
        }
    },
    computed: {
        ...mapState(['categoryList', 'articleList'])
    },
    methods: {
        switchType(item) {
            this.selected = item.value
            this.$store.dispatch('getArticleList', item.id)
        }
    }
}
</script>

<style lang="stylus" scoped>
.page   
    min-height 400px
    width 100%
    display flex

.left-content
    flex 6
    padding 20px
    min-height 400px
    background #fff

.right-content
    margin-left 10px
    flex 2
    min-height 300px
    .category-list
        margin-bottom 10px
        padding 20px
        width 100%
        background #fff
        h1 
            padding-bottom 10px
            font-size 18px
            border-bottom 1px solid #e8eaec
        .category-item
            width 100%
            height 40px
            line-height 40px
            a
                margin-left 10px
                color #000
                text-decoration underline
    .profile-info
        width 100%
        height 200px
        background #fff
            

div /deep/ .ivu-list-item-meta-title
    &:hover
        cursor pointer
        color #4FE8DA

div /deep/ .ivu-list-items
    text-align left
    background #fff

.abstract 
    height 44px
    color #34495e
    display -webkit-box
    overflow hidden
    -webkit-line-clamp 2
    -webkit-box-orient vertical

.article-img
    height 140px
</style>