<template>
    <div>
        <div>
            <album-content :songList="collectList">
                <template slot="title">我的收藏</template>
            </album-content>
        </div>
    </div>
</template>

<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {getCollectOfUserId,songOfSongIdAlias} from '../api/index';
import AlbumContent from "../components/AlbumContent";

export default {
    name: 'collect',
    mixins: [mixin],
    components:{
        AlbumContent
    },
    data(){
        return {
            collection: [],     //收藏的歌曲列表
            collectList: [],    //收藏的歌曲列表（带歌曲详情）
        }
    },
    computed:{
        ...mapGetters([
            'listOfSongs',      //当前播放列表
            'userId',           //当前登录用户id
        ])
    },
    mounted(){
        this.getCollection(this.userId);
    },
    methods:{
        //获取我的收藏列表
        getCollection(userId){
            getCollectOfUserId(userId)
                .then(res =>{
                        this.collection = res.data;
                        //通过歌曲id获取歌曲信息   
                        for(let item of this.collection){
                            this.getSongsOfIds(item.songId);
                        }             
                    })
                .catch(err => {
                    console.log(err);
                })
        },
        //通过歌曲id获取歌曲信息   
        getSongsOfIds(id){
            songOfSongIdAlias(id)
                .then(res =>{
                    for(let i of res.data){
                        this.collectList.push(i);
                    }
                })
                .catch(err => {
                    console.log(err);
                })
                this.$store.commit('setListOfSongs',this.collectList);
        }
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/my-music.scss';
</style>