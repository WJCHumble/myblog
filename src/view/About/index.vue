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
                自己，曾经对自己的薄弱的技术水平产生过深深的无耐，但是我一直都坚信着只要我坚持下去，将来的我可以
                用技术改变我身边的事物、朋友。并且，接下来还有很多个一年，就如我现在的座右铭一般“坚持，时间会给你
                答案”，所以，如果此时看到这的你也是一个初入，又或者是一个前端技术小白，希望你和我一样能一直
                坚持走在这条路上，莫问收获，但问耕耘，前端的路上我与你同在。
            </div>
        </div>
        <div class="concat">
           联系我 
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
.about 
    margin-top 20px
    padding 20px
    min-height 630px
    background #fff
    word-spacing 4px
.title, .concat
    position relative
    width 100%
    font-size 20px
    margin-bottom 20px
    &:after
        position absolute
        top 18px
        left 94px
        content ''
        width 86%
        height 1px
        background #494949
.concat
    margin-top 20px
    &:after
        width 90%
        left 70px
.avatar
    float left
    margin-right 14px
    img
        width 120px
</style>