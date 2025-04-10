const files = require.context('@/assets/img/swiper', false, /.jpg$/).keys();
const files1 = []
for(let item of files){
    files1.push(item.slice(2))
}
//轮播图的数据
const swiperList = [
    {picImg: require('@/assets/img/swiper/' + files1[0])},
    {picImg: require('@/assets/img/swiper/' + files1[1])},
    {picImg: require('@/assets/img/swiper/' + files1[2])},
    {picImg: require('@/assets/img/swiper/' + files1[3])},
    {picImg: require('@/assets/img/swiper/' + files1[4])},
    {picImg: require('@/assets/img/swiper/' + files1[5])},
    {picImg: require('@/assets/img/swiper/' + files1[6])},
    {picImg: require('@/assets/img/swiper/' + files1[7])},
]

export {
    swiperList
}