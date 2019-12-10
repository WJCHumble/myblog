<template>
    <div class="about">
        <div class="profile">
            <div class="title">
                个人简介
            </div>
            <div class="content">
                <div class="avatar">
                    <img src="https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/avatar.jpg" alt="">
                </div>
                性别男，无名本科在校大四，自学编程一年，自学过Java、C语言、C#、PHP、JavaScript，目前深耕于前端
                （虽然刚刚起步）。这是我学习前端的第一年，从今年3月到现在转眼已经9个月了，这一路磕磕绊绊，质疑过
            自己，曾经对自己的薄弱的技术水平产生过深深的无耐，但是我一直都坚信着只要我坚持下去，将来的我可以用
                技术改变我身边的事物、朋友。并且，接下来还有很多个一年，就如我现在的座右铭一般“坚持，时间会给你
                答案”，所以，如果此时看到这的你也是一个初入，又或者是一个前端技术小白，希望你和我一样能一直
                坚持走在这条路上，莫问收获，但问耕耘，前端的路上我与你同在。
            </div>
        </div>
        <div class="concat">
            <div class="concat-me">
                联系我 
            </div>
            <div class="concat-way">
                <div class="github">
                    <Icon type="logo-github" size="24"/>
                    GitHub：<a href="https://github.com/WJCHumble" target="_blank">https://github.com/WJCHumble</a>
                </div>
                <div class="email">
                    <Icon type="ios-mail" size="30"/>
                    Email：1957503379@qq.com
                </div>
                <div class="csdn">
                    <Icon type="ios-git-branch" size="24"/>
                    CSDN：<a href="https://blog.csdn.net/qq_42049445" target="_blank">https://blog.csdn.net/qq_42049445</a>
                </div>
                <div class="weixin-gzh">
                    <div class="label-name"><Icon type="ios-chatbubbles" size="26"/>&nbsp;微信公众号：</div>
                    <img width="200px" src="https://img-blog.csdnimg.cn/201911160938356.png" alt="">
                </div>
            </div>
        </div>
        <!-- 标签、装饰 -->
        <div class="tag">
            <img src="https://wjchumble.oss-cn-hangzhou.aliyuncs.com/myblog/tag.png" alt="">
        </div>
    </div>
</template>

<script>
export default {
    title: "关于我",
    metaInfo: {
        meta: []
    },
    data() {
        return {
            linkArr: [
					{icon: 'icon-csdn', name: 'CSDN', address: 'https://blog.csdn.net/qq_42049445'},
					{icon: 'icon-GitHub', name: 'GitHub', address: 'https://github.com/WJCHumble'},
					{icon: 'icon-email', name: 'QQ邮箱', content: '1957503379@qq.com'},
					{icon: 'icon-weixin', name: '微信公众号', content: '微信搜索公众号Code center || 扫描下方二维码'},
				]
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

.about 
    margin-top 20px
    padding 30px
    min-height 610px
    background #fff
    word-spacing 4px
.content 
    color #657180
.avatar
    float left
    margin-right 14px
    img
        width 120px
.title, .concat-me
    position relative
    left 50%
    transform translate(-14%, 0)
    margin-bottom 50px
    width 50%
    letter-spacing 8px
    font-size 20px
    font-weight 400
    &:after
        position absolute
        top 18px
        left 120px
        content ''
        width 92%
        height 2px
        background #f2f3f5
    &:before
        position absolute
        top 18px
        right 590px
        content ''
        width 84%
        height 2px
        background #f2f3f5
.concat-me
    transform translate(-10%, 0)
    margin-top 40px
    &:after
        width 94%
        left 100px
    &:before 
       right 600px
       width 84% 
.concat-way 
    text-align center
    font-size 16px
    line-height 30px
    a
        color #657180
        &:hover
            color #4fe8da
    .weixin-gzh
        .label-name
            position relative
            left -94px
.tag
    position absolute
    top -8px
    right -25px

@media (max-width 600px)
    .title, .concat-me
        &:before, &:after
            display none
        margin-bottom 20px
    .title
        transform translate(-24%, 0)
    .concat-me
        transform translate(-20%, 0)
    .tag
        right 0px
    .concat-way
        font-size 14px
</style>