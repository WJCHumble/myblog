<template>
    <div>
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
.view
  margin 0 auto
  padding-top 14px
  width 1200px
  position relative
</style>