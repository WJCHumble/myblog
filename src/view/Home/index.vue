<template>
    <div class="page">
        <div class="left-content">
            <div class="motto">
              <h1>坚持<br>时间会给你答案</h1>
              <p>自学编程的第&nbsp;<span>{{totalDays || '---'}}</span>&nbsp;天</p>
            </div>
        </div>
        <div class="right-content">
            <!-- banner -->
             <Carousel v-model="value1" autoplay :height="360" loop>
                <CarouselItem v-for="(item, index) in bannerList" :key="index">
                    <img :src="item.banner_img"/>
                </CarouselItem>
            </Carousel>
            <br>
            <List item-layout="vertical" :border="true">
                <ListItem v-for="(item, index) in list" :key="index">
                    <ListItemMeta :avatar="item.avatar" :description="item.description" >
                        <template slot="title">
                            <div  @click="$router.push('/blog/detail/0')">
                                {{item.title}}
                            </div>
                        </template>
                    </ListItemMeta>
                    <div class="abstract">
                        {{ item.content }}
                    </div>
                    <template slot="action">
                        <li>
                            <Icon type="ios-eye-outline" :size="20"/> {{exploreCount}}
                        </li>
                        <li>
                            <Icon type="ios-chatbubbles-outline" /> {{commentCount}}
                        </li>
                    </template>
                    <template slot="extra">
                        <img src="https://dev-file.iviewui.com/5wxHCQMUyrauMCGSVEYVxHR5JmvS7DpH/large" style="width: 280px">
                    </template>
                </ListItem>
            </List>
        </div>
    </div>
</template>

<script>
import { mapState } from 'vuex'
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
    asyncData({store}) {
        return store.dispatch('getBannerList')
    },
    created() {
        this.initDayCounts()
    },
    computed: {
        ...mapState(['bannerList'])
    },
    data() {
        return {
            totalDays: 0, //学习编程的总时间
            value1: 0,
            list: [
                    {
                        title: '谈谈自学编程这件事',
                        description: '',
                        avatar: 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/avatar.jpg',
                        content: '依稀记得，以前高中很喜欢读的一个杂志上写的一句话：“老天总爱和人开玩笑，人生之不如意十之八九”'
                    },
                    {
                        title: '谈谈自学编程这件事',
                        description: '',
                        avatar: 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/avatar.jpg',
                        content: '依稀记得，以前高中很喜欢读的一个杂志上写的一句话：“老天总爱和人开玩笑，人生之不如意十之八九”'
                    },
                    {
                        title: '谈谈自学编程这件事',
                        description: '',
                        avatar: 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/avatar.jpg',
                        content: '依稀记得，以前高中很喜欢读的一个杂志上写的一句话：“老天总爱和人开玩笑，人生之不如意十之八九”'
                    },
                    {
                        title: '谈谈自学编程这件事',
                        description: '',
                        avatar: 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/avatar.jpg',
                        content: '依稀记得，以前高中很喜欢读的一个杂志上写的一句话：“老天总爱和人开玩笑，人生之不如意十之八九”'
                    },
                    {
                        title: '谈谈自学编程这件事',
                        description: '',
                        avatar: 'https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/avatar.jpg',
                        content: '依稀记得，以前高中很喜欢读的一个杂志上写的一句话：“老天总爱和人开玩笑，人生之不如意十之八九”'
                    },
                ],
            exploreCount: null,
            commentCount: null,
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
.page 
    margin 0 auto
    width 1200px
    min-height 580px
    display flex
    .left-content
        flex 2
        margin-right 30px
        height 400px
        background url('https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/time.png')
        background-size 100%
        box-shadow:0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)
        .motto
            position relative
            top 50%
            left 50%
            transform translate(-50%, -50%)
            width 240px
            height 130px
            text-align left
            letter-spacing 3px
            color #fff
            h1
                font-size 30px
                font-weight normal
            p 
                margin-top 20px
                font-size 18px
                span
                    width 80px
                    font-size 34px
    .right-content
        margin-bottom 20px
        flex 4
        max-width 780px
        img
            display block
            width 100%
     
div /deep/ .ivu-list-item-meta-title
    &:hover
        cursor pointer
        color #4FE8DA

div /deep/ .ivu-list-items
    text-align left
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

</style>