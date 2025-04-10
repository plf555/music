<template>
    <div class="table">
        <div class="container">
            <div class="handle-box">
                在当前页搜索：
                <el-input v-model="select_word" size="mini" placeholder="请输入绑定歌手" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="delBatch">批量删除</el-button>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true">添加轮播图</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" :row-style="{height:'370px'}" :cell-style="{padding:'0px'}" :data="this.tableData" @selection-change="handleSelectionChange">   
            <el-table-column type="selection" width="40"></el-table-column>
            <el-table-column label="轮播图" width="1000" align="center">
                <template slot-scope="scope">
                    <div class="singer-img">
                        <img :src="getUrl(scope.row.url)" style="width:640px"/>
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="singerName" label="绑定歌手" width="220" align="center"></el-table-column>
            <el-table-column prop="updateTime" label="更新时间" width="220" align="center"></el-table-column>
            <el-table-column label="操作" align="center">
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
                :page-sizes="[2, 5, 10, 20]"
                :limit.sync="pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total=this.total>
                
            </el-pagination>
        </div>

        <el-dialog title="添加轮播图" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="100px" action="" id="tf1">
                <el-form-item>
                    <label>绑定歌手</label>
                    <el-select  v-model="registerForm.singerName" name='singerName' placeholder="请输入歌手名" @change="singerSelect1($event)"
                    :remote="true"
                    style="width: 100%;"
                    reserve-keyword
                    :filterable="true">
                    <el-option v-for="item in allSingerTable" 
                        :key="item.id"
                        :label="item.name"
                        :value="{singerName:item.name,singerId:item.id}">
                    </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    <label>上传图片</label>
                    <input type="file" name="file">
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addSwiper">确定</el-button>
            </span>
        </el-dialog>

        <el-dialog title="编辑此轮播图" :visible.sync="editVisible" width="400px" center>
            <el-form :model="form" ref="form" label-width="100px">
                <el-form-item prop="singerName" label="更改绑定歌手" size="mini">
                    <!-- <el-input v-model="form.singerName" placeholder="歌手名"></el-input> -->
                    <el-select  v-model="form.singerName" placeholder="请输入歌手名" @change="singerSelect($event)"
                    :remote="true"
                    style="width: 100%;"
                    reserve-keyword
                    :filterable="true">
                    <el-option v-for="item in allSingerTable" 
                        :key="item.id"
                        :label="item.name"
                        :value="{singerName:item.name,singerId:item.id}">
                    </el-option>
                    </el-select>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="editSave()">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="删除轮播图" :visible.sync="delVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="delVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>                
            </span>
        </el-dialog>
    </div>
</template>

<script>
import {setSwiper, getAllSwiper,deleteASwiper,allSinger,updateSwiper} from '../api/index';
import VDistpicker from "v-distpicker";
import { mixin } from '../mixins/index';
export default {
    components: {
        "v-distpicker":VDistpicker
    },
    mixins: [mixin],
    data(){
        return{
            centerDialogVisible: false, //添加弹窗是否显示
            editVisible: false,         //编辑弹窗是否显示
            delVisible: false,          //删除弹窗是否显示
            registerForm:{      //添加框
                singerName: '',
                singerId: '',
            },
            form:{      //编辑框
                id: '',
                singerId: '',
                singerName: '',
            },
            tableData: [], //表格数据
            tempData: [], //表格中的临时数据，用于模糊搜索框
            select_word: '', //搜索框中输入的文字
            pageSize: 10,    //分页每页大小
            pageNum: 1,  //当前页
            total: 0, //查询总数
            idx: -1,          //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            allSingerTable: [],   //所有歌手
            swiper: {}, //轮播图对象
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
                    if(item.singerName.includes(this.select_word)){
                        this.tableData.push(item);
                    }
                }
            }
        }
    },
    created(){
        this.getData();
        this.getAllSinger(); 
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
        //查询所有歌手
        getAllSinger() {  
            this.allSingerTable = [];
            allSinger().then(res => {
                for(let i in res.data){
                    this.allSingerTable.push(res.data[i]);
                }
            })
        },
        getData(){
            this.tempData = [];
            this.tableData = [];
            var params = {pageSize:this.pageSize, pageNum:this.pageNum}
            getAllSwiper(params).then(res => {
                this.tempData = res.data.records;
                this.tableData = res.data.records;
                this.total = res.data.total
                // this.pageNum = 1;
            })
        },
        //添加轮播图
        addSwiper(){
            let _this = this;
            var form = new FormData(document.getElementById('tf1'));
            form.append('singerName', this.registerForm.singerName);
            form.append('singerId', this.registerForm.singerId);
            var req = new XMLHttpRequest();
            req.onreadystatechange = function(){
                //req.readyState == 4 获取到返回的完整数据
                //req.status == 200 和后台正常交互完成
                if(req.readyState == 4 && req.status == 200){
                    let res = JSON.parse(req.response);
                    if(res.code == 1){
                        _this.getData();
                        _this.registerForm = {};
                        _this.notify(res.message,'success');
                    }else{
                         _this.notify(res.message,'error');
                    }
                }
            }
            req.open('post',`${_this.$store.state.HOST}/swiper/addSwiper`,false);
            // req.setRequestHeader("Content-type","multipart/form-data");
            req.send(form);
            _this.centerDialogVisible = false;
        },
        //弹出编辑页面
        handleEdit(row){
            this.editVisible = true;
            this.form = {
                id: row.id,
                // singerName: row.singerName,
                singerId: row.singerId
            }
        },
        singerSelect(event){
            this.form.singerId = event.singerId
            this.form.singerName = event.singerName
        },
        singerSelect1(event){
            this.registerForm.singerId = event.singerId
            this.registerForm.singerName = event.singerName
        },
        //保存编辑页面修改的数据
        editSave(name){
            this.swiper.id = this.form.id
            this.swiper.singerId = this.form.singerId;
            this.swiper.singerName = this.form.singerName;
            var swiper1 = this.swiper
            updateSwiper(swiper1)
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
        //删除轮播图
        deleteRow(){
            deleteASwiper(this.idx)
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
    }
}
</script>

<style scoped>
    .handle-box{
        margin-bottom: 20px;
    }
    .singer-img{
        width: 100%;
        height: 370px;
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