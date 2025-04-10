<template>
    <div class="table">
        <div class="container">
            <div class="handle-box">
                在当前页搜索：
                <el-input v-model="select_word" size="mini" placeholder="请输入关键字" class="handle-input"></el-input>
                <br>
                <br>
                搜&nbsp;&nbsp;索&nbsp;&nbsp;全&nbsp;&nbsp;部&nbsp;：
                <el-input v-model="content" size="mini" placeholder="请输入关键字" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="getData">搜索</el-button>
                <el-button type="primary" size="mini" @click="delBatch">批量删除</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="680px" :data="this.tableData" @selection-change="handleSelectionChange">   
            <el-table-column type="selection" width="40"></el-table-column>
            <el-table-column prop="type" label="类型" width="120" align="center"></el-table-column>
            <el-table-column prop="content" label="留言内容" width="520" align="left"></el-table-column>
            <el-table-column prop="time" label="留言时间" width="300" align="center"></el-table-column>
            <el-table-column prop="contact" label="联系方式" align="center"></el-table-column>
            <el-table-column label="操作" width="150" align="center">
                <template slot-scope="scope">
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

        <el-dialog title="删除留言" :visible.sync="delVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="deleteRow">确定</el-button> 
                <el-button size="mini" @click="delVisible = false">取消</el-button>               
            </span>
        </el-dialog>
    </div>
</template>

<script>
import {getAllMessagePage,delMessage} from '../api/index';
import { mixin } from '../mixins/index';
export default {
    mixins: [mixin],
    data(){
        return{
            centerDialogVisible: false, //添加弹窗是否显示
            editVisible: false,         //编辑弹窗是否显示
            delVisible: false,          //删除弹窗是否显示
            content:'', //留言内容
            tableData: [], //表格数据
            tempData: [], //表格中的临时数据，用于模糊搜索框
            select_word: '', //搜索框中输入的文字
            pageSize: 10,    //分页每页大小
            pageNum: 1,  //当前页
            total: 0, //查询总数
            idx: -1,          //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            message: {}, //留言对象
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
                    if(item.content.includes(this.select_word)){
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
        //查询所有留言
        getData(){
            this.tempData = [];
            this.tableData = [];
            var params = {pageSize:this.pageSize, pageNum:this.pageNum, content:this.content}
            getAllMessagePage(params).then(res => {
                this.tempData = res.data.records;
                this.tableData = res.data.records;
                this.total = res.data.total
                // this.pageNum = 1;
            })
        },
        
        //删除一条留言
        deleteRow(){
            delMessage(this.idx)
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
    }
}
</script>

<style scoped>
    .handle-box{
        margin-bottom: 20px;
    }
    .singer-img{
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