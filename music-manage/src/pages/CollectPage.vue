<template>
    <div class="table">
        <div class="crumbs">
            <i class="el-icon-tickets" style="font-size: 18px; padding-top: 18px">{{this.consumerName}}-收藏列表</i>
        </div>
        <div class="container">
            <div class="handle-box">
                快速搜索：
                <el-input v-model="select_word" size="mini" placeholder="请输入歌曲名" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="delBatch">批量删除</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="680px" :data="tableData" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="40"></el-table-column>            
            <el-table-column prop="songName" label="歌名" align="center"></el-table-column>  
            <el-table-column prop="singerName" label="歌手" align="center"></el-table-column>            
            <el-table-column label="操作" width="150" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" type="danger" @click="handleDelete(scope.row)">删除</el-button> 
                </template>
            </el-table-column>
        </el-table>
        
        <el-dialog title="删除歌曲" :visible.sync="delVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="delVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>                
            </span>
        </el-dialog>
    </div>
</template>

<script>
import { mixin } from '../mixins/index';
import {songOfSongIdAlias,getCollectOfUserId,deleteCollection} from '../api/index';

export default {
    mixins: [mixin],
    props: ['id'],
    data(){
        return{
            delVisible: false,          //删除弹窗是否显示
            tableData: [],
            tempData: [],
            select_word: '',
            songName: '',   //搜索框
            idx: -1,          //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            consumerName: '',        //用户管理页面传过来的用户名
            consumerId: null,           //用户管理页面传过来的用户id
        }
    },
    watch:{
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
        this.consumerName = this.$route.query.name;
        this.consumerId = this.$route.query.id;
        this.getData();
    },
    methods:{
        //查询该用户所有收藏的歌曲
        getData(){
            this.tempData = [];
            this.tableData = [];
            getCollectOfUserId(this.consumerId).then(res => {
                for(let item of res.data){
                    this.getSong(item.songId);
                }
            })
        },
        //根据歌曲id查询歌曲对象，放到tempData和tableData里面
        getSong(songId){
            songOfSongIdAlias(songId)
            .then(res => {
                for(let i of res.data){
                    this.tempData.push(i);
                    this.tableData.push(i);
                }
            })
            .catch(err => {
                console.log(err);
            });
        },
        //删除一条歌曲
        deleteRow(){
            deleteCollection(this.consumerId,this.idx.songId)
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
            this.delVisible = false;
        },
        //批量删除已经选择的项
        delBatch(){
            for(let item of this.multipleSelection){
                this.handleDelete(item);
                this.deleteRow();
            }
            this.multipleSelection = [];
        }
    }   
}
</script>

<style scoped>
    .handle-box{
        margin-bottom: 20px;
    }
    .handle-input{
        width: 300px;
        display: inline-block;
    }
</style>