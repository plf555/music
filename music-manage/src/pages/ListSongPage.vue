<template>
    <div class="table">
        <div class="crumbs">
            <i class="el-icon-tickets" style="font-size: 18px; padding-top: 18px">{{this.songListTitle}}-音乐列表</i>
        </div>
        <div class="container">
            <div class="handle-box">
                搜索当前歌单：
                <el-input v-model="select_word" size="mini" placeholder="请输入歌手或歌曲名" class="handle-input"></el-input>
                <br>
                <br>
                <el-button type="primary" size="mini" @click="getData">搜索</el-button>
                <el-button type="primary" size="mini" @click="delBatch">批量删除</el-button>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true">添加歌曲</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="680px" :data="tableData" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="40"></el-table-column>                       
            <el-table-column prop="singerName" label="歌手" align="center"></el-table-column>            
            <el-table-column prop="songName" label="歌名" align="center"></el-table-column> 
            <el-table-column prop="songAlbum" label="所属专辑" align="center"></el-table-column>           
            <el-table-column label="操作" width="150" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" type="danger" @click="handleDelete(scope.row.songId)">删除</el-button> 
                </template>
            </el-table-column>
        </el-table>
        <el-dialog title="添加歌曲" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerFormNode" action="" id="tf" label-width="70px">
                <el-form-item prop="singerName"  size="mini" label="歌手名:">
                    <el-select  v-model="registerForm.singerName" placeholder="请输入歌手名" 
                    :remote="true"
                    style="width: 100%;"
                    reserve-keyword
                    @change="singerChange"
                    :filterable="true">
                    <el-option v-for="item in allSingerTable" 
                        :key="item.id"
                        :label="item.name"
                        :value="item.id">
                    </el-option>
                    </el-select>
                </el-form-item>        
                <el-form-item prop="songName"  size="mini" label="歌曲名:">
                    <el-select
                    v-model="registerForm.songName" placeholder="请输入歌曲名"
                    :remote="true"
                    style="width: 100%;"
                    reserve-keyword
                    :filterable="true">
                    <el-option v-for="item in songTable" 
                        :key="item.id"
                        :label="item.name"
                        :value="item.id">
                    </el-option>
                    </el-select>
                </el-form-item> 
               
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addSong()">确定</el-button>                
            </span>
        </el-dialog>
        <el-dialog title="删除歌曲" :visible.sync="delVisible" width="300px" center>
            <div align="center">删除歌手同时会将该歌手所有歌曲删除，确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="delVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>                
            </span>
        </el-dialog>
    </div>
</template>

<script>
import { mixin } from '../mixins/index';
import {
    listSongDetail,
    listSongAdd,
    delListSong,
    allSinger,
    allSong
    } from '../api/index';

export default {
    mixins: [mixin],
    data(){
        return{
            centerDialogVisible: false, //添加弹窗是否显示
            delVisible: false,          //删除弹窗是否显示
            registerForm:{      //添加框
                singerName: '',     //歌手名字
                songName: ''        //歌曲名字
            },
            tableData: [],
            tempData: [],
            select_word: '',
            idx: -1,          //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            songListId: '',          //歌单id
            songListTitle: '',  //歌单标题
            songTable: [],   //根据歌手查出的歌名
            allSingerTable: [],   //所有歌手
            listSong: {}, //歌单中的歌曲对象
            }
    },
    watch:{ //监听搜索框
        //搜索框里面的内容发生变化的时候，搜索结果table列表的内容跟着它的内容发生变化
        select_word: function(){
            if(this.select_word == ''){
                this.tableData = this.tempData;
            }else{
                this.tableData = [];
                for(let item of this.tempData){
                    if(item.songName.includes(this.select_word) || item.singerName.includes(this.select_word)){
                        this.tableData.push(item);
                    }
                }
            }
        }
    },
    created(){
        this.songListId = this.$route.query.id;
        this.songListTitle = this.$route.query.title;
        this.getData();     
        this.getAllSinger();   
    },
    methods:{
        //查询歌单歌曲
        getData(){
            this.tempData = [];
            this.tableData = [];
            listSongDetail(this.songListId).then(res => {
                for(let i in res.data){
                    this.tempData.push(res.data[i]);
                    this.tableData.push(res.data[i]);
                }
            })
        },
        
        //查询所有歌手
        getAllSinger() {  
            this.allSingerTable = [];
            allSinger().then(res => {
                for(let i in res.data){
                    this.allSingerTable.push(res.data[i]);
                }
            })
        },
        singerChange(it){
            this.getSongNameBySingerId(it);
        },
        getSongNameBySingerId(singerId){
            this.songTable = [];
            allSong(singerId).then(res => {
                for(let i in res.data){
                    this.songTable.push(res.data[i]);
                }
                if(this.songTable.length == 0){
                    this.songTable.push("")
                }
            })
            
        },
        
        //添加歌曲
        addSong(){
            this.listSong.songId = this.registerForm.songName
            this.listSong.songListId = this.songListId
            var listSong1 = this.listSong
            //判存在，将tableData中的songId添加到数组
            var songIds = [];
            for(let i of this.tableData){
                songIds.push(i.songId)
            }
            for(let i=0; i<songIds.length; i++){
                if(songIds.includes(listSong1.songId)){
                    this.$refs.registerFormNode.resetFields()
                    this.centerDialogVisible = false
                    return this.notify("该歌曲已存在", "error");
                }
            }
            listSongAdd(listSong1)
            .then(res => {
                if(res.code == 1){
                    this.getData();
                    this.notify(res.message,"success");
                }else{
                    this.notify(res.message,"error");
                }
            })
            .catch(err => {
                console.log(err);
            });
            this.$refs.registerFormNode.resetFields()
            this.centerDialogVisible = false;
        },
        //删除一条歌曲
        deleteRow(){
            delListSong(this.songListId, this.idx)
            .then(res => {
                if(res){
                    this.getData();
                    this.notify(res.message,"success");
                }else{
                    this.notify(res.message,"error");
                }
            })
            .catch(err => {
                console.log(err);
            });
            this.delVisible = false;
        }
    }   
}
</script>

<style scoped>
    .handle-box{
        margin-bottom: 20px;
    }
    .song-img{
        width: 100%;
        height: 80px;
        border-radius: 5px;
        margin-bottom: 5px;
        overflow: hidden;
    }
    .handle-input{
        width: 300px;
        display: inline-block;
    }
    .pagination{
        display: flex;
        justify-content: center;
    }
    .play {
        position: absolute;
        z-index: 100;
        width: 80px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        top: 18px;
        left: 15px;
    }

    .icon {
        width: 2em;
        height: 2em;
        color: white;
        fill: currentColor;
        overflow: hidden;
    }
</style>