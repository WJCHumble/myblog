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
          component: () => import("page/Home/index.vue")
        },
        {
          path: "/blog",
          name: 'Blog',
          component: () => import ("page/Blog/index.vue"),
          children: [
            {
              path: "article",
              component: () => import("page/Blog/Article/index.vue"),
              children:[
                
              ]
            },
            {
              path: "detail/:id",
              component: () => import("page/Blog/Detail/index.vue")
            },
            {
              path: '',
              redirect: 'article'
            }
          ]
        },
        {
          path: "/about",
          name: "About",
          component: () => import("page/About/index.vue")
        }
      ]
    });
}
