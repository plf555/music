<template>
    <div class="swiper">
        <el-carousel :interval="4000" type="card" height="280px">
            <el-carousel-item v-for="(item,index) in swiperList" :key="index">
                <!-- <img :src="item.picImg" @click="goAlbum(item.picImg)"/> -->
                <img :src="attachImageUrl(item.url)" @click="goAlbum(item.singerId)"/>
            </el-carousel-item>
        </el-carousel>
    </div>
</template>

<script>
// import {swiperList} from "../assets/data/swiper";
import {getSingerById,getSwiperInfo} from '../api/index';
export default {
    name: "swiper",
    data() {
        return {
            swiperList: [], //轮播图数组
        }
    },
    created () {
        // this.swiperList = swiperList;
        this.getSwiper();
    },
    methods: {
        //跳转
        goAlbum(singerId){
            //根据轮播图关键字查询对应的资源（歌手信息）
            getSingerById(singerId)
                .then(res =>{
                    this.$store.commit("setTempList", res.data);
                    this.$router.push({path:`singer-album/${res.data.id}`});
                })
        },
        //获取图片地址
        attachImageUrl (srcUrl) {
            return srcUrl? this.$store.state.configure.HOST+srcUrl : '../assets/img/user.jpg';
        },
        //获取轮播图资源
        getSwiper(){
            getSwiperInfo()
                .then(res =>{
                    for(let i of res.data){
                        this.swiperList.push(i);
                    }
                })
        }
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/swiper.scss';
</style>