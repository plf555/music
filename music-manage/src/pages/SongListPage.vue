<template>
    <div class="table">
        <div class="container">
            <div class="handle-box">
                在当前页搜索：
                <el-input v-model="select_word" size="mini" placeholder="筛选关键字" class="handle-input"></el-input>
                <br>
                <br>
                搜&nbsp;&nbsp;索&nbsp;&nbsp;全&nbsp;&nbsp;部&nbsp;：
                <el-input v-model="title" size="mini" placeholder="请输入歌单名" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="getData">搜索</el-button>
                <el-button type="primary" size="mini" @click="delBatch">批量删除</el-button>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true">添加歌单</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="680px" :data="tableData" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="40"></el-table-column>
            <el-table-column label="歌单图片" width="110" align="center">
                <template slot-scope="scope">
                    <div class="songList-img">
                        <img :src="getUrl(scope.row.pic)" style="width:100%"/>
                    </div>
                    <el-upload :action="uploadUrl(scope.row.id)" :before-upload="beforeAvatarUpload" 
                        :on-success="handleAvatarSuccess">
                        <el-button size="mini">更新图片</el-button>
                    </el-upload>
                </template>
            </el-table-column>
            <el-table-column prop="title" label="标题" width="120" align="center"></el-table-column>     
            <el-table-column label="简介" width="400" align="center">
                <template slot-scope="scope">
                    <p style="height:100px;overflow-y:scroll">{{scope.row.introduction}}</p>
                </template>
            </el-table-column>
            <el-table-column prop="style" label="风格" width="120" align="center"></el-table-column> 
            <el-table-column label="歌曲管理" width="110" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="songEdit(scope.row.id, scope.row.title)">歌曲管理</el-button>
                </template>
            </el-table-column>
            <el-table-column label="评论" width="80" align="center">
                <template slot-scope="scope">
                    <!-- <el-button size="mini" @click="getComment(data[scope.$index].id, data[scope.$index].title)">评论</el-button> -->
                    <el-button size="mini" @click="getComment(scope.row.id, scope.row.title)">评论</el-button>
                </template>    
            </el-table-column>  
            <el-table-column label="操作" width="150" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
                    <el-button size="mini" type="danger" @click="handleDelete(scope.row.id)">删除</el-button> 
                </template>
            </el-table-column>
        </el-table>
        <div class="pagination" style="text-align: right">
            <el-pagination
                v-show="total > 0"
                background
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :page.sync="pageNum"
                :page-sizes="[2, 10, 20, 50]"
                :limit.sync="pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total=this.total>
                
            </el-pagination>
        </div>

        <el-dialog title="添加歌单" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px">
                <el-form-item prop="title" label="标题" size="mini">
                    <el-input v-model="registerForm.title" placeholder="标题"></el-input>
                </el-form-item>
                <el-form-item prop="introduction" label="简介" size="mini">
                    <el-input v-model="registerForm.introduction" placeholder="简介" type="textarea"></el-input>
                </el-form-item>
                <el-form-item prop="style" label="风格" size="mini">
                    <!-- <el-input v-model="registerForm.style" placeholder="风格"></el-input> -->
                    <el-checkbox-group v-model="checkedStyles"  @change="handleCheckedCitiesChange1"
                        :min="1"
                        :max="3">
                        <el-checkbox v-for="it in styles" :label="it" :key="it">{{it}}</el-checkbox>
                    </el-checkbox-group>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addSongList">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="修改歌单" :visible.sync="editVisible" width="400px" center>
            <el-form :model="form" ref="form" label-width="80px">
                <el-form-item prop="title" label="标题" size="mini">
                    <el-input v-model="form.title" placeholder="标题"></el-input>
                </el-form-item>
                <el-form-item prop="introduction" label="简介" size="mini">
                    <el-input v-model="form.introduction" placeholder="简介" type="textarea"></el-input>
                </el-form-item>    
                <el-form-item prop="style" label="风格" size="mini">
                    <el-checkbox-group v-model="form.style"  @change="handleCheckedCitiesChange"
                        :min="1"
                        :max="3">
                        <el-checkbox v-for="it in styles" :label="it" :key="it">{{it}}</el-checkbox>
                    </el-checkbox-group>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="editSave">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="删除歌单" :visible.sync="delVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="delVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>                
            </span>
        </el-dialog>
    </div>
</template>

<script>
import {getAllSongListPage,setSongList,updateSongList,delSongList} from '../api/index';
import { mixin } from '../mixins/index';
export default {
    mixins: [mixin],
    data(){
        return{
            checkedStyles: ['流行', '华语'], //默认歌单风格
            styles: ['华语', '粤语', '欧美', '日韩', '摇滚', '民谣', '流行', '其他'], //所有歌单风格
            centerDialogVisible: false, //添加弹窗是否显示
            editVisible: false,         //编辑弹窗是否显示
            delVisible: false,          //删除弹窗是否显示
            registerForm:{      //添加框
                title: '',
                introduction: '',
                style: ''
            },
            form:{      //编辑框
                id: '',
                title: '',
                introduction: '',
                style: '',
            },
            tableData: [],
            tempData: [],
            select_word: '',
            pageSize: 10,    //分页每页大小
            pageNum: 1,  //当前页
            total: 0, //查询总数
            idx: -1,          //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            songList: {},     //歌单对象
            title: '',   //歌单标题
            // songListTitle: '', //歌单标题
        }
    },
    computed:{
        //计算当前搜索结果表里的数据
        data(){
            return this.tableData.slice((this.pageNum - 1) * this.pageSize,this.pageNum * this.pageSize)
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
                    if(item.title.includes(this.select_word)){
                        this.tableData.push(item);
                    }
                }
            }
        }
    },
    created(){
        this.getData();
    },
    methods:{
        //获取当前页
        handleCurrentChange(val){
            this.pageNum = val;
            this.getData();
        },
        //获取当前页显示条数
        handleSizeChange(val){
            this.pageSize = val;
            this.getData();
        },
        //查询所有歌单
        getData(){
            this.tempData = [];
            this.tableData = [];
            var params = {pageSize:this.pageSize, pageNum:this.pageNum, title:this.title}
            getAllSongListPage(params).then(res => {
                this.tempData = res.data.records;
                this.tableData = res.data.records;
                this.total = res.data.total
            })
        },
        //添加歌单
        addSongList(){
            this.songList.title = this.registerForm.title;
            this.songList.pic = '/img/songListPic/defaultSongListImg.jpg'; //添加歌单时设置默认图片
            this.songList.introduction = this.registerForm.introduction;
            this.songList.style = this.registerForm.style.join(",");
            var songList1 = this.songList
            setSongList(songList1)
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
            this.centerDialogVisible = false;
        },
        //弹出编辑页面
        handleEdit(row){
            this.editVisible = true;
            this.form = {
                id: row.id,
                title: row.title,
                introduction: row.introduction,
                style: row.style.split(',') //转换成数组
            }
        },
        //保存编辑页面修改的数据
        editSave(){
            this.songList.id = this.form.id
            this.songList.title = this.form.title;
            this.songList.introduction = this.form.introduction;
            this.songList.style = this.form.style.join(","); //转换成字符串
            var songList1 = this.songList
            updateSongList(songList1)
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
            this.editVisible = false;
        },
        //更新图片
        uploadUrl(id){
            return `${this.$store.state.HOST}/songList/updateSongListPic?id=${id}`
        },
        //删除一个歌单
        deleteRow(){
            delSongList(this.idx)
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
        },
        //转向歌曲管理页面
        songEdit(id,title){
            this.$router.push({path:`/ListSong`,query:{id,title}});
        },
        //转向该歌单的评论列表
        getComment(id, title){
            this.$router.push({path: '/Comment',query:{id,title}})
        },
        handleCheckedCitiesChange(value){
            this.form.style=value
        },
        handleCheckedCitiesChange1(value){
            this.registerForm.style=value
        },
    }
}
</script>

<style scoped>
    .handle-box{
        margin-bottom: 20px;
    }
    .songList-img{
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
</style>