<template>
    <div class="my-music">
        <div class="album-slide">
            <div class="album-img">
                <img src="../assets/img/top50.jpg">
            </div>
            <div style="width: 80%; padding-left: 10%;">
                <h2>TOP 50榜单记录了播放量排名前50的歌曲。</h2>
            </div>
        </div>
        <div class="album-content">
            <div class="album-title">
                TOP1:&nbsp;&nbsp;{{topSongName}} - {{topSingerName}}, &nbsp;&nbsp;播放量：{{topSongPlayCount}}
            </div>
            <div class="songs-body">
                <rank-content :songList="rankList">
                    <template slot="title">热门排行 TOP 50</template>
                </rank-content>
            </div>
        </div>
    </div>
</template>

<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {getRankList,songOfSongIdAlias} from '../api/index';
import RankContent from "../components/RankContent";

export default {
    name: 'rank-list',
    mixins: [mixin],
    components:{
        RankContent
    },
    data(){
        return {
            rankList: [],     //收藏的歌曲列表
            rankListWithInfo: [],    //收藏的歌曲列表（带歌曲详情）
            topSongName: '',    //top1歌曲名
            topSingerName: '',  //top1歌手名
            topSongPlayCount: 0,    //top1播放量
        }
    },
    computed:{
        ...mapGetters([
            'listOfSongs',      //当前播放列表
        ])
    },
    mounted(){
        this.getRank();
    },
    methods:{
         //获取排行列表
        getRank(){
            getRankList()
                .then(res =>{
                        this.rankList = res.data;
                        //通过歌曲id获取歌曲信息   
                        // for(let item of this.rankList){
                        //     this.getSongsOfIds(item.songId);
                        // }
                        // for(let i=0; i<this.rankList.length; i++){
                        //     this.getSongsOfIds(this.rankList[i].songId);
                        // } 
                        this.$store.commit('setListOfSongs',this.rankList);
                        this.topSongName = this.rankList[0].songName;
                        this.topSingerName = this.rankList[0].singerName;
                        this.topSongPlayCount = this.rankList[0].songPlayCount;
                    })
                .catch(err => {
                    console.log(err);
                })
        },
        //通过歌曲id获取歌曲信息   
        // getSongsOfIds(id){
        //     songOfSongIdAlias(id)
        //         .then(res =>{
        //             for(let i of res.data){
        //                 this.rankListWithInfo.push(i);
        //             }
        //         })
        //         .catch(err => {
        //             console.log(err);
        //         })
        //         this.$store.commit('setListOfSongs',this.rankListWithInfo);
        // }
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/my-music.scss';
</style>