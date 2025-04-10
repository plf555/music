<template>
    <div>
        <div class="comment">
            <h2>评论</h2>
            <div class="comment-msg">
                <div class="comment-img">
                    <img :src="attachImageUrl(avatar)">
                </div>
                <el-input class="comment-input" type="textarea" :rows="2" placeholder="可以在此发表评论" v-model="textarea">
                </el-input>
            </div>
            <el-button type="primary" class="sub-btn" @click="postComment">评论</el-button>
        </div>
        <p>精彩评论：共{{commentList.length}}条评论</p>
        <ul class="popular" v-for="(item,index) in commentList" :key="index">
            <li>
                <div class="popular-img">
                    <img :src="attachImageUrl(item.avatar)">
                </div>
                <div class="popular-msg">
                    <ul>
                        <li class="name">{{item.username}}</li>
                        <li class="time">{{item.createTime}}</li>
                        <li class="content">{{item.content}}</li>
                    </ul>
                </div>
                <div class="up" ref="up" @click="postUp(item.id,userId,index)">
                    <svg class="icon">
                        <use xlink:href="#icon-zan"></use>
                    </svg>
                    {{item.up}}
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {setComment,setLike,getAllComment,getUserOfId} from '../api/index';

export default {
    name: 'comment',
    mixins: [mixin],
    inject:['reload'],
    props: [
        'playId',       //歌曲或歌单id
        'type'          //0歌曲、1歌单
    ],
    computed:{
        ...mapGetters([
            'id',               //歌曲或歌单id
            'loginIn',          //用户是否已登录
            'userId',           //当前登录用户id
            'avatar',           //当前登录用户头像
        ])
    },
    data(){
        return{
            textarea: '',        //存放输入的评论内容
            commentList: [],    //存放评论列表
            userPic: [],        //用户的头像
            userName: [],       //用户的昵称
            comment: {},        //评论对象
            commentIndex: 0        //评论index
        }
    },
    mounted(){
        this.getComment();
    },
    methods: {
        //提交评论
        postComment(){
            if(this.loginIn){

                if(this.type == 0){
                    this.comment.songId = this.playId;
                }else{
                    this.comment.songListId = this.playId;
                }
                this.comment.consumerId = this.userId;
                this.comment.type = this.type;
                this.comment.content = this.textarea;
                var comment1 = this.comment;

                setComment(comment1)
                    .then(res => {
                        if(res.code == 1){
                            this.notify(res.message,'success');
                            this.textarea='';
                            // this.getComment();
                            this.reload();
                        }else{
                            this.notify(res.message,'error');
                        }
                    })
                    .catch(err =>{
                        this.notify('评论失败','error');
                    })
            }else{
                this.rank = null;
                 this.notify('请先登录','warning');
            }
        },
        //评论列表
        getComment(){
            getAllComment(this.type,this.playId)
                .then(res => {
                        this.commentList = res.data;                      
                    })
                    .catch(err =>{
                        this.notify('评论加载失败','error');
                    })
        },
        //获取用户的头像和昵称
        // getUsers(id){
        //     getUserOfId(id)
        //         .then(res => {
        //             this.userPic.push(res.data.avatar);
        //             this.userName.push(res.data.username);
        //             })
        //             .catch(err =>{
        //                 this.notify('出错了','error');
        //             })
        // },
        //给某一个评论点赞
        postUp(id,userId,index){
            if(this.loginIn){
                setLike(id, userId)
                    .then(res => {
                        if(res.code == 1){
                            this.$refs.up[index].children[0].style.color = '#2796cd';
                            this.getComment();
                        }else{
                            this.notify(res.message,'error');
                        }
                    })
                    .catch(err =>{
                        this.notify('点赞失败','error');
                    })
            }else{
                this.rank = null;
                 this.notify('请先登录','warning');
            }
        }
    }
}
</script>
<style lang="scss" scoped>
@import '../assets/css/comment.scss';
</style>
