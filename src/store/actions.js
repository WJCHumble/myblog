import {
    GET_CATEGORY_LIST,
    GET_BANNER_LIST
} from './mutation-types'

import {
    reqCategoryList,
    reqBannerList
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
    },
    getBannerList({commit}) {
        return reqBannerList().then(res => {
            if (res.status === 1001) {
                // console.log(res.data.bannerList)
                commit(GET_BANNER_LIST, res.data.bannerList)
            } else {
                console.log(res.message)
            }
        })
    }
}
