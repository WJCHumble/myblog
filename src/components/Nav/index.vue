<template>
    <div>
        <header class="header">
            <nav class="inner">
                <router-link to="/home" exact>
                <img class="logo" src="~public/blog.png" alt="logo">
                </router-link>
                <router-link v-for="category in categories" :to="category.path" :key="category.id">{{category.title}}</router-link>
                <a class="blog-name" href="/home" rel="noopener">
                    吴敬昌的技术博客
                </a>
            </nav>
        </header>
    </div>
</template>

<script>
export default {
    data() {
        return {
            categories: [
                {
                    id: 1, path: '/home', title: '首页'
                },
                {
                    id: 2, path: '/blog', title: '博客'
                },
                {
                    id: 3, path: '/about', title: '关于我'
                },
            ]
        }
    }
}
</script>

<style lang="stylus" scoped>
.header
  background transparent
  background rgba(13,13,13,0.45)
  position fixed
  z-index 999
  height 77px
  top 0
  left 0
  right 0
  .inner
    max-width 1200px
    box-sizing border-box
    margin 0px auto
    padding 15px 5px
  a
    flex 1
    color #fff
    line-height 40px
    transition color .15s ease
    display inline-block
    vertical-align middle
    font-weight 380
    letter-spacing .3em
    margin-right 3em
    text-decoration none
    &:hover
      color #6AC1FF
    &.router-link-active
      color #6AC1FF
      font-weight blod
  .blog-name
    color #fff
    font-size .9em
    margin 0
    float right

.logo
  width 24px
  margin-right 10px
  display inline-block
  vertical-align middle

.fade-enter-active, .fade-leave-active
  transition all .2s ease

.fade-enter, .fade-leave-active
  opacity 0

@media (max-width 860px)
  .header .inner
    padding 15px 30px

@media (max-width 600px)
  .header
    .inner
      padding 15px
    a
      margin-right 1em
    .github
      display none

</style>