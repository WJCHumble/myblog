<template>
    <div>
        <List item-layout="vertical" :border="true">
            <ListItem v-for="item in list" :key="item.title">
                <ListItemMeta :avatar="item.avatar" :description="item.description" >
                    <template slot="title">
                        <div  @click="$router.push('/article/0')">
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
    data() {
        return {
            list: [
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
    }
}
</script>

<style lang="stylus" scoped>
div /deep/ .ivu-list-item-meta-title
    &:hover
        cursor pointer
        color #ff6600

div /deep/ .ivu-list-items
    background #fff

.abstract 
    color #34495e
    display -webkit-box
    overflow hidden
    -webkit-line-clamp 2
    -webkit-box-orient vertical
</style>