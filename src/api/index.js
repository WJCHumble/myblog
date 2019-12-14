import ajax from "./ajax"

// 基础格式
// export const reqTest = () => ajax('getTest')
// 获取博客分类
export const reqCategoryList = () => ajax('/category')

// 获取banner图片资源
export const reqBannerList = () => ajax('/banner')

// 获取文章列表 默认10条
export const reqArticleList = (query) => ajax('/articleList', query)