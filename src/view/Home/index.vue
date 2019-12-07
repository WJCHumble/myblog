<template>
    <div>
        <div class="banner">
          <div class="word">
            <div class="motto">
              <h1>坚持<br>时间会给你答案</h1>
              <p>自学编程的第&nbsp;<span>{{totalDays}}</span>&nbsp;天</p>
            </div>
          </div>
        </div>
    </div>
</template>

<script>
export default {
    title: "首页",
    metaInfo: {
        meta: [
            {
                name: "keywords",
                content: "吴敬昌, 技术博客, Vue SSR, 首页"
            }
        ]
    },
    created() {
        this.initDayCounts()
    },
    data() {
        return {
            totalDays: 0, //学习编程的总时间
        }
    },
    methods: {
        initDayCounts() {
            // 最早学编程的时间 2018年3月10号
            const date = new Date()
            
            const totalDays = (date.getFullYear()-2018)*365 + (date.getMonth() - 3)*30 + date.getDate() - 10

            for (let i = 0; i < totalDays; i++) {
                let timer = setTimeout(() => {
                    this.totalDays++
                    timer = null    
                }, 500)
            }
        }
    }
}
</script>

<style lang="stylus" scoped>
div /deep/ .ivu-list-item-meta-title
    &:hover
        cursor pointer
        color #4FE8DA

div /deep/ .ivu-list-items
    background #fff

.abstract 
    color #34495e
    display -webkit-box
    overflow hidden
    -webkit-line-clamp 2
    -webkit-box-orient vertical

.page 
    text-align center
    margin-top 16px
    margin-bottom 16px

.banner 
  position absolute
  top 0px
  width 100%
  height 100%;
  background url('https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/landscape2.jpeg') center center no-repeat
  background-size 100% 
  .word
    margin 0 auto
    width 1200px
    height 320px
    padding-top 200px
    letter-spacing .2em
    .motto
      margin-left 680px
      width 520px
      h1
        width 520px
        font-size 70px
        font-weight normal
        color #fff
      p 
        margin-top 60px
        font-size 22px
        color #465E20
        span
            width 80px
            font-size 34px
</style>