import {
    GET_CATEGORY_LIST,
    GET_BANNER_LIST,
    GET_ARTICLE_LIST
} from './mutation-types'

export default {
   [GET_CATEGORY_LIST](state, categoryList) {
        state.categoryList = categoryList
   },
   [GET_BANNER_LIST](state, bannerList) {
       state.bannerList = bannerList
   },
   [GET_ARTICLE_LIST](state, articleList) {
       state.articleList = articleList
   }
}
