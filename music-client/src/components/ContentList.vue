<template>
    <div class="content-list">
        <ul class="section-content">
            <li class="content-item" v-for="(item,index) in contentList" :key="index">
                <!-- 通过是否有album来判断是歌曲还是歌单或歌手 -->
                <div class="kuo" v-if="item.album" @click="toplay(item)">
                    <img class="item-img" :src="attachImageUrl(item.pic)">
                    <div class="mask">
                        <svg class="icon">
                            <use xlink:href="#icon-bofang"></use>
                        </svg>
                    </div>
                </div> 
                <div class="kuo" v-else @click="goAlbum(item,item.name,item.album,index)">
                    <img class="item-img" :src="attachImageUrl(item.pic)">
                    <div class="mask">
                        <svg class="icon">
                            <use xlink:href="#icon-bofang"></use>
                        </svg>
                    </div>
                </div> 
                <p class="item-name">{{item.name||item.title}}</p>               
            </li>
        </ul>
    </div>
</template>
<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
export default {
    name: 'content-list',
    mixins: [mixin],
    props: ['contentList'],
    computed: {
        ...mapGetters([
            'id',               //歌曲id
            'lyric',               //歌词
            'url',              //歌曲地址
            'isPlay',           //播放状态
            'playButtonUrl',   //播放状态的图标
            'picUrl',            //正在播放的音乐的图片
            'title',                  //歌名
            'artist',                 //歌手名
            'duration',                //音乐时长
            'curTime',                //当前音乐的播放位置
            'showAside',            //是否显示播放中的歌曲列表
            'listIndex',            //当前歌曲在歌单中的位置
            'listOfSongs',          //当前歌单列表
            'autoNext',             //自动播放下一首
            'loginIn',              //用户是否已登录
            'userId',               //当前登录用户的id
            'isActive',             //当前播放的歌曲是否已收藏
        ])
    },
    methods: {
        goAlbum(item,type){ //item目标，type判断是歌手还是歌曲还是歌单，实际上是把name字段看成type
            this.$store.commit("setTempList",item);
            if(type){    //type的值不为空，则为歌手或歌曲
                this.$router.push({path:`singer-album/${item.id}`});             
            }else{    //type的值为空，则为歌单
                this.$router.push({path:`song-list-album/${item.id}`});
            }
        },
        

        toplay: function(item){
            // id,url,pic,index,songName,singerName,lyric
            // item.songId, item.songUrl, item.songPic, index, item.songName, item.singerName, item.songLyric
            console.log(item)
            this.$store.commit('setId',item.id);
            this.$store.commit('setUrl',this.$store.state.configure.HOST+item.url);
            this.$store.commit('setPicUrl',this.$store.state.configure.HOST+item.pic);
            this.$store.commit('setTitle',item.singerName);
            this.$store.commit('setArtist',item.name);
            this.$store.commit('setLyric',this.parseLyric(item.lyric));
            this.$store.commit('setIsActive',false);
            //查询歌曲收藏状态
            this.getACollectStatus(item.id)
            //根据歌曲id, 将歌曲的播放量增加1
            this.increasePlayback(item.id);
            //生成播放记录
            this.addPlayHistory(item.id)
        },

        //解析歌词
        parseLyric(text){
            let lines = text.split("\n");                   //将歌词按行分解成数组
            let pattern = /\[\d{2}:\d{2}.(\d{3}|\d{2})\]/g; //时间格式的正则表达式
            let result = [];                                //返回值
            //对于歌词格式不对的直接返回
            if(!(/\[.+\]/.test(text))){
                return [[0,text]]
            }        
            //去掉前面格式不正确的行
            while(!pattern.test(lines[0])){
                lines = lines.slice(1);
            }
            //遍历每一行，形成一个每行带着俩元素的数组，第一个元素是以秒为计算单位的时间，第二个元素是歌词
            for(let item of lines){
                let time = item.match(pattern);  //存前面的时间段
                let value = item.replace(pattern,'');//存后面的歌词
                for(let item1 of time){
                    let t = item1.slice(1,-1).split(":");   //取出时间，换算成数组
                    if(value!=''){
                        result.push([parseInt(t[0],10)*60 + parseFloat(t[1]),value]);
                    }                    
                }                
            }
            //按照第一个元素--时间--排序
            result.sort(function(a,b){
                return a[0] - b[0];
            });
            return result;
        },
    }
}
</script>
<style lang="scss" scoped>
@import '../assets/css/content-list.scss';
</style>
