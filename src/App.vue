<template>
  <div id="app">
    <Nav/>
    <transition name="fade" mode="out-in">
      <router-view class="view"></router-view>
    </transition>
  </div>
</template>
<script>
import Nav from './components/Nav/index.vue'

export default {
    mounted() {
    },
    data() {
        return {
          camera: null,
          scene: null,
          webGLRenderer: null,
          mesh: null,
          cloud: null,
          controls: null
        }
    },
    components: {
      Nav
    },
    methods: {}
}
</script>

<style lang="stylus">
body
  font-family -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
  font-size 15px
  background-color lighten(#eceef1, 30%)
  margin 0
  padding-top 100px
  color #34495e
  overflow-y scroll

.fade-enter-active, .fade-leave-active
  transition all .2s ease

.fade-enter, .fade-leave-active
  opacity 0

</style>
