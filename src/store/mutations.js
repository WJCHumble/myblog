import {
    GET_CATEGORY_LIST
} from './mutation-types'

export default {
   [GET_CATEGORY_LIST](state, categoryList) {
        state.categoryList = categoryList
   }
}
