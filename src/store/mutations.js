import {
    GET_CATEGORY_LIST,
    GET_BANNER_LIST
} from './mutation-types'

export default {
   [GET_CATEGORY_LIST](state, categoryList) {
        state.categoryList = categoryList
   },
   [GET_BANNER_LIST](state, bannerList) {
       state.bannerList = bannerList
   }
}
