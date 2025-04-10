<template>
    <div>
        <div>
            <album-content :songList="history">
                <template slot="title">下载记录</template>
            </album-content>
        </div>
    </div>
</template>

<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {getHistoryByUserId,getDownloadHistoryByUserId} from '../api/index';
import AlbumContent from "../components/AlbumContent";

export default {
    name: 'downloadHistory',
    mixins: [mixin],
    components:{
        AlbumContent
    },
    data(){
        return {
            history: [],     //下载记录的歌曲列表
        }
    },
    computed:{
        ...mapGetters([
            'listOfSongs',      //当前播放列表
            'userId',           //当前登录用户id
        ])
    },
    mounted(){
        this.getHistory(this.userId);
    },
    methods:{
        //获取我的播放历史
        getHistory(userId){
            getDownloadHistoryByUserId(userId)
                .then(res =>{
                        this.history = res.data;
                        this.$store.commit('setListOfSongs',this.history);            
                    })
                .catch(err => {
                    console.log(err);
                })
        },
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/my-music.scss';
</style>