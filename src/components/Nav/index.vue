<template>
    <div>
        <header class="header">
            <nav class="inner">
                <router-link to="/" exact>
                <img class="logo" src="~public/blog.png" alt="logo">
                </router-link>
                <router-link v-for="category in categories" :to="category.path" :key="category.id">{{category.title}}</router-link>
                <a class="github" href="/home" rel="noopener">
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
a
  color #34495e
  text-decoration none

.header
  background-color #ff6600
  position fixed
  z-index 999
  height 55px
  top 0
  left 0
  right 0
  .inner
    max-width 800px
    box-sizing border-box
    margin 0px auto
    padding 15px 5px
  a
    flex 1
    color rgba(255, 255, 255, .8)
    line-height 24px
    transition color .15s ease
    display inline-block
    vertical-align middle
    font-weight 300
    letter-spacing .075em
    margin-right 1em
    &:hover
      color #fff
    &.router-link-active
      color #fff
      font-weight 400
  .github
    color #fff
    font-size .9em
    margin 0
    float right

.logo
  width 24px
  margin-right 10px
  display inline-block
  vertical-align middle

.view
  max-width 800px
  margin 0 auto
  position relative

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