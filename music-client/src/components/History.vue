<template>
    <div>
        <div>
            <album-content :songList="history">
                <template slot="title">最近播放</template>
            </album-content>
        </div>
    </div>
</template>

<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {getHistoryByUserId} from '../api/index';
import AlbumContent from "../components/AlbumContent";

export default {
    name: 'history',
    mixins: [mixin],
    components:{
        AlbumContent
    },
    data(){
        return {
            history: [],     //播放历史的歌曲列表
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
            getHistoryByUserId(userId)
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