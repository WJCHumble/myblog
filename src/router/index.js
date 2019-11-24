import Vue from 'vue'
import Router from 'vue-router'
import MetaInfo from 'vue-meta-info'

Vue.use(Router)
Vue.use(MetaInfo)

export function createRouter() {
    return new Router({
      mode: "history",
      fallback: false,
      scrollBehavior: () => ({ y: 0 }),
      routes: [
        {
          path: "/home",
          name: "Home",
          component: () => import("../view/Home/index.vue")
        },
        {
          path: "/about",
          name: "About",
          component: () => import("../view/About/index.vue")
        },
        {
          path: "/article/:id",
          component: () => import("../view/Article/index.vue")
        }
      ]
    });
}
