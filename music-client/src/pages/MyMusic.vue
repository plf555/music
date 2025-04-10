<template>
    <div class="my-music">
        <div class="album-slide">
            <div class="album-img">
                <img :src="attachImageUrl(avatar)">
            </div>
            <ul class="album-info">
                <li>昵称：{{username}}</li>
                <li>性别：{{userSex}}</li>
                <li>生日：{{birth}}</li>
                <li>地区：{{location}}</li>
                <li>曲风偏好：{{likeStyle}}</li>
            </ul>
        </div>
        <div class="album-content">
            <div class="introduction">
                签名：{{introduction}}
            </div>
            <div class="songs-body">
                <div class="leftCol">
                    <ul class="setting-aside">
                        <li v-for="(item,index) in slefList" :key="index" :class="{activeColor: activeName==item.name}"
                            @click="handleClick(item)">
                            {{item.name}}
                        </li>
                    </ul>
                </div>
                <div class="contentCol">
                    <component :is="componentSrc"></component>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {getUserOfId, selectStyleById} from '../api/index';
import AlbumContent from '../components/AlbumContent';
import Collect from '../components/Collect';
import History from '../components/History';
import DownloadHistory from '../components/DownloadHistory';

export default {
    name: 'my-music',
    mixins: [mixin],
    components:{
        AlbumContent,
        Collect,
        History,
        DownloadHistory
    },
    data(){
        return {
            avatar: '',       //用户头像
            username: '',     //昵称
            userSex: '',      //性别
            birth: '',        //生日
            location: '',     //故乡
            introduction: '', //签名
            likeStyle: '', //曲风偏好
            collection: [],     //收藏的歌曲列表
            collectList: [],    //收藏的歌曲列表（带歌曲详情）
            slefList: [
                {name: '我的收藏', path: 'Collect'},
                {name: '最近播放', path: 'History'},
                {name: '下载记录', path: 'downloadHistory'}
            ],
            activeName: '我的收藏',
            componentSrc: 'Collect'
        }
    },
    computed:{
        ...mapGetters([
            'listOfSongs',      //当前播放列表
            'userId',           //当前登录用户id
        ])
    },
    mounted(){
        this.getMsg(this.userId);
        this.getStyle(this.userId);
    },
    methods:{
        handleClick(item){
            this.activeName = item.name;
            this.componentSrc = item.path;
        },
        getMsg(userId){
            getUserOfId(userId)
                .then(res =>{
                    this.avatar = res.data.avatar;
                    this.username = res.data.username;
                    if(res.data.sex==0){
                        this.userSex = '女';
                    }else if (res.data.sex==1){
                        this.userSex = '男';
                    }
                    this.birth = this.attachBirth(res.data.birth);
                    this.location = res.data.location;
                    this.introduction = res.data.introduction;        
                })
                .catch(err => {
                    console.log(err);
                })
        },
        getStyle(userId){
            selectStyleById(userId)
                .then(res =>{
                    this.likeStyle = res.data;          
                })
                .catch(err => {
                    console.log(err);
                })
        }
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/my-music.scss';
</style>