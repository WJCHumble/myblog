import {
    GET_CATEGORY_LIST
} from './mutation-types'

import {
    reqCategoryList
} from '../api/index'

export default {
    getCategoryList({commit}) {
        return reqCategoryList().then(res => {
            if (res.status === 1001) {
                commit(GET_CATEGORY_LIST, res.data.categoryList)
            } else {
                console.log(res.message)
            }
        })
    }
}
