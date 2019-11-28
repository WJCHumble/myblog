<template>
    <div class="article">
        <div class="header">
            <div class="title">谈谈自学编程这件事</div>
            <div class="article-info">
                <div>2019-11-26 23:24</div>
                <div>吴敬昌</div>
                <div>阅读数&nbsp;100</div>
            </div>
        </div>
        <div class="content">
            正如巴金先生所说：“时光如水，光阴似金”，从我真正主动去接触编程，至今已经1年2个月了。不可否认，去年大二下只是普通本科学校的我才开始学习编程，已落后同一届的人太多了…这一路，踩了很多坑，也曾质疑过自己，想过走编程这条路会不会太晚了？是不是要选择考个研缓冲一下？磕磕绊绊…最终我还是坚定的选择了编程和准备就业。
            <br/>2018年，可以说是我接下来的人生中的一个转折点或者起点，那个时期的我反复地在问自己：“我现在在做什么？我现在会什么？谈情说爱是否真的有意义？”，于是我抱着一个比小白还小白的心态，咨询了大我两届的一位做 Java 后端开发的学长。那时他给我提了几个建议：“学 Java Web 开发，买书或者看视频，有问题去博客园”。印象很深的是学长问我：“打算学前端还是后端？”，我说：“前端是什么？后端是什么？”，这句可以听出那时候的我对于编程而言确实是一张白纸。那天之后，我在淘宝买了一套Java书籍，了解过Java的朋友应该都听过这三本书《Java从入门到精通》、《Java高级编程》、《Java编程思想》。于是乎，在大二下的那个学期，我开始了没日没夜地撸 Java 代码，由于菜还是菜的因故，光是《Java从入门到精通》这本书的代码我就撸了三个月多，印象很深，那本书啥都有…写过多线程、绘图、数据库连接、聊天室等等。
            <br/>到了2018年的5月份，我跟了我可能一辈子都不会忘记的导师…因为跟老师竞赛的缘故，我强行改了技术路线，从 Java Web 转到了PHP，从后端又转到了现在的前端，并且因为写程序的时间非常多的原因，我放弃了曾经天真并且一无是处的我对考研所抱有的梦想。从我现在的时间点到2018年3月这段时间，我自学了Java、C语言、PHP、JavaScript，以及各种前端和后端框架…杂乱的技术路线，曾一度让我很郁闷，因为我并没有精通的一个领域…
            <br/>2019年，也就是今年的4月份，我因为年轻的一份冲动和热血，选择了前端。从选择前端到现在，可以说是狠狠地打脸…有句话说得好“台上一分钟，台下十年功”，没有深入了解前端的人永远都存在着这样的观点前端只是做页面效果、简单等等。再后来，也就是2019年到现在，我勉强只能算一个前端的入门者…仍然在不断地探寻和吸取前端的知识，例如 React 全栈、NuxtJS 服务端渲染、前端的中间层、Three.js 3D 效果等等。
        </div>
        <div class="footer"></div>
    </div>
</template>

<script>
export default {
    title: "文章详情",
    metaInfo: {
        meta: []
    }
}
</script>

<style lang="stylus" scoped>
.article
    margin-top 20px
    width 100%
    padding 20px
    background #fff
    .title
        font-size 24px
    .article-info
        display flex
        color: #cc5
        div 
            margin-top 10px
            margin-right 50px
    .content
        margin-top 20px
        margin-bottom 20px
        line-height 28px
</style>