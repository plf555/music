<template>
    <div class="desc">
        <div :style="{backgroundImage: 'url('+ backgroundImg + ')'}" id="bkg" class="bkg"></div>
            <img :src="backgroundImg" id="songImgInLyric">
            <div class="song-lyric">
                <h1 class="lyric-title">歌词</h1>
                <!-- 有歌词 -->
                <ul class="has-lyric" v-if="lyr.length" key="index">
                    <li v-for="(item,index) in lyr" v-bind:key="index">
                        {{item[1]}}
                    </li>
                </ul>
                <!-- 没有歌词 -->
                <div v-else class="no-lyric" key="no-lyric">
                    <span>暂无歌词</span>
                </div>
                <comment :playId="id" :type="0"></comment>
                
            </div>
    </div>  
</template>
<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import Comment from "../components/Comment";

export default {
    name: 'lyric',
    mixins: [mixin],
    components:{
        Comment
    },
    inject:['reload'],
    data(){
        return {
            lyr: [],         //当前歌曲的歌词
            // lyric111: []  //在歌词页面上下曲切换传递的歌词
            // songId: '',    //前面传来的歌曲id
            backgroundImg: null,
            isReloadData: true,   //刷新标识
            isScroll: false,      //鼠标是否被滚动
        }
    },
    computed: {
        ...mapGetters([
            'curTime',      //当前歌曲播放到的位置
            'id',           //当前播放的歌曲id
            'lyric',        //歌词
            'listIndex',    //当前歌曲在歌单中的位置
            'listOfSongs',  //当前歌单列表
            'picUrl',       //正在播放的音乐的图片
        ])
    },
    created(){
        // this.songId = this.$route.params.id;
        this.lyr = this.lyric; 
        this.backgroundImg = this.picUrl;       
    },
    watch:{
        id:function(){
            this.lyr = this.parseLyric(this.listOfSongs[this.listIndex].songLyric);
            this.backgroundImg = this.listOfSongs[this.listIndex].songPic
            this.reload();
        },
        curTime: function(){
            if(this.lyr.length>0){
                for(let i=0;i<this.lyr.length;i++){
                    if(this.curTime>=this.lyr[i][0]){
                        for(let j=0;j<this.lyr.length;j++){
                            document.querySelectorAll('.has-lyric li')[j].style.color = '#FFFFFF';
                            document.querySelectorAll('.has-lyric li')[j].style.fontSize = '18px';
                        }
                        if(i>=0){
                            document.querySelectorAll('.has-lyric li')[i].style.color = '#FFFF00';
                            document.querySelectorAll('.has-lyric li')[i].style.fontSize = '25px';
                            if(!this.isScroll){
                                this.lyricScroll(i)
                            }
                        }
                    }
                }
            }
        },
    },
    methods:{
        lyricScroll(i){
            window.scrollTo(0,(i-3)*40); //40为每一句歌词的高度，-3是为了将歌词保持在中间
        },
    }
    // 刷新当前页面，在修改数据之后 this.reload 一下就可以完成刷新当前这个指定标签的刷新
    // 已经写在App.vue里面了，此处注释掉
    // reload () {
    //   this.isReloadData = false;
    //   this.$nextTick(() => {
    //     this.isReloadData = true;
    //   })
    // }
}

</script>
<style lang="scss" scoped>
@import '../assets/css/lyric.scss';
</style>