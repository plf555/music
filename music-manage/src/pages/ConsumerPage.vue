<template>
    <div class="table">
        <div class="container">
            <div class="handle-box">
                在当前页搜索：
                <el-input v-model="select_word" size="mini" placeholder="请输入用户名" class="handle-input"></el-input>
                <br>
                <br>
                搜&nbsp;&nbsp;索&nbsp;&nbsp;全&nbsp;&nbsp;部&nbsp;：
                <el-input v-model="username" size="mini" placeholder="请输入用户名" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="getData">搜索</el-button>
                <el-button type="primary" size="mini" @click="delBatch">批量删除</el-button>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true">添加新用户</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="680px" :data="tableData" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="40"></el-table-column>
            <el-table-column label="用户图片" width="110" align="center">
                <template slot-scope="scope">
                    <div class="consumer-img">
                        <img :src="getUrl(scope.row.avatar)" style="width:100%"/>
                    </div>
                    <el-upload :action="uploadUrl(scope.row.id)" :before-upload="beforeAvatarUpload" 
                        :on-success="handleAvatarSuccess">
                        <el-button size="mini">更新图片</el-button>
                    </el-upload>
                </template>
            </el-table-column>
            <el-table-column prop="username" label="用户名" width="120" align="center"></el-table-column>
            <el-table-column label="性别" width="50" align="center">
                <template slot-scope="scope">
                    {{changeSex(scope.row.sex)}}
                </template>
            </el-table-column>
            <el-table-column prop="phoneNum" label="手机号" width="120" align="center"></el-table-column>
            <el-table-column prop="email" label="电子邮箱" width="240" align="center"></el-table-column>
            <el-table-column label="生日" width="120" align="center">
                <template slot-scope="scope">
                    {{attachBirth(scope.row.birth)}}
                </template>
            </el-table-column>
            <el-table-column prop="introduction" label="签名" align="center"></el-table-column>
            <el-table-column prop="location" label="地区" width="100" align="center"></el-table-column> 
            <el-table-column label="收藏" width="80" align="center">
                <template slot-scope="scope">
                    <!-- <el-button size="mini" @click="getCollect(data[scope.$index].id, data[scope.$index].username)">收藏</el-button> -->
                    <el-button size="mini" @click="getCollect(scope.row.id, scope.row.username)">收藏</el-button>
                </template>    
            </el-table-column>           
            <el-table-column label="操作" width="150" align="center">
                <template slot-scope="scope">
                    <el-button size="mini" @click="handleEdit(scope.row)">编辑</el-button>
                    <el-button size="mini" type="danger" @click="handleDelete(scope.row.id)">删除</el-button> 
                </template>
            </el-table-column>
        </el-table>
        <div class="pagination">
            <el-pagination
                v-show="total > 0"
                background
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :page.sync="pageNum"
                :page-sizes="[2, 10, 20, 50]"
                :limit.sync="pageSize"
                :total=this.total
                layout="total, sizes, prev, pager, next, jumper"
                >
                
            </el-pagination>
        </div>

        <el-dialog title="添加新用户" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px" :rules="rules">
                <el-form-item prop="username" label="用户名" size="mini">
                    <el-input v-model="registerForm.username" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password" label="密码" size="mini">
                    <el-input type="password" v-model="registerForm.password" placeholder="密码"></el-input>
                </el-form-item>
                <el-form-item label="性别" size="mini">
                    <input type="radio" name="sex" :value=1 v-model="registerForm.sex">&nbsp;男&nbsp;&nbsp;
                    <input type="radio" name="sex" :value=0 v-model="registerForm.sex">&nbsp;女
                </el-form-item>
                <el-form-item prop="phoneNum" label="手机号" size="mini">
                    <el-input v-model="registerForm.phoneNum" placeholder="手机号"></el-input>
                </el-form-item>
                <el-form-item prop="email" label="电子邮箱" size="mini">
                    <el-input v-model="registerForm.email" placeholder="电子邮箱"></el-input>
                </el-form-item>
                <el-form-item prop="birth" label="生日" size="mini">
                    <!-- <el-date-picker type="date" placeholder="选择日期" v-model="registerForm.birth" style="width:100%"></el-date-picker> -->
                    <el-date-picker
                        v-model="registerForm.birth"
                        type="date"
                        placeholder="选择日期"
                        format="yyyy 年 MM 月 dd 日"
                        value-format="yyyy-MM-dd">
                    </el-date-picker>
                </el-form-item>
                <el-form-item prop="introduction" label="签名" size="mini">
                    <el-input v-model="registerForm.introduction" placeholder="签名"></el-input>
                </el-form-item>      
                <el-form-item prop="location" label="地区" size="mini">
                    <!-- <el-input v-model="registerForm.location" placeholder="地区"></el-input> -->
                     <v-distpicker @selected="regionSelectOfInsert"></v-distpicker>
                </el-form-item>          
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addConsumer">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="修改用户" :visible.sync="editVisible" width="400px" center>
            <el-form :model="form" ref="form" label-width="80px" :rules="rules">
                <el-form-item prop="username" label="用户名" size="mini">
                    <el-input v-model="form.username" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password" label="密码" size="mini">
                    <el-input type="password" v-model="form.password" placeholder="密码"></el-input>
                </el-form-item>
                <el-form-item label="性别" size="mini">
                    <input type="radio" name="sex" :value=0 v-model="form.sex">&nbsp;女&nbsp;&nbsp;
                    <input type="radio" name="sex" :value=1 v-model="form.sex">&nbsp;男
                </el-form-item>
                <el-form-item prop="phoneNum" label="手机号" size="mini">
                    <el-input v-model="form.phoneNum" placeholder="手机号"></el-input>
                </el-form-item>
                <el-form-item prop="email" label="电子邮箱" size="mini">
                    <el-input v-model="form.email" placeholder="电子邮箱"></el-input>
                </el-form-item>
                <el-form-item prop="birth" label="生日" size="mini">
                    <!-- <el-date-picker type="date" placeholder="选择日期" v-model="form.birth" style="width:100%"></el-date-picker> -->
                    <el-date-picker
                        v-model="registerForm.birth"
                        type="date"
                        placeholder="选择日期"
                        format="yyyy 年 MM 月 dd 日"
                        value-format="yyyy-MM-dd">
                    </el-date-picker>
                </el-form-item>
                <el-form-item prop="introduction" label="签名" size="mini">
                    <el-input v-model="form.introduction" placeholder="签名"></el-input>
                </el-form-item>      
                <el-form-item prop="location" label="地区" size="mini">
                    <!-- <el-input v-model="form.location" placeholder="地区"></el-input> -->
                    <v-distpicker @selected="regionSelectOfUpdate"></v-distpicker>
                </el-form-item> 
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="editSave">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="删除用户" :visible.sync="delVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="delVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>                
            </span>
        </el-dialog>
    </div>
</template>

<script>
import {getAllConsumer,setConsumer,updateConsumer,delConsumer} from '../api/index';
import { mixin } from '../mixins/index';
import VDistpicker from "v-distpicker";
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
                username: '',
                password: '',
                sex: 1, //性别默认为男
                phoneNum: '',
                email: '',
                birth: '',
                introduction: '',
                location: ''
            },
            form:{      //编辑框
                id: '',
                username: '',
                password: '',
                sex: '',
                phoneNum: '',
                email: '',
                birth: '',
                introduction: '',
                location: ''
            },
            tableData: [],
            tempData: [],
            select_word: '',
            pageSize: 10,    //分页每页大小
            pageNum: 1,  //当前页
            idx: -1,          //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            total: 0, //查询记录数
            consumer: {}, //用户对象
            username: '', //搜索框输入的用户名
            rules: {
                username: [
                    {required: true,message: '请输入用户名',trigger: 'blur'}
                ],
                password: [
                    {required: true,message: '请输入密码',trigger: 'blur'}
                ],
                phoneNum: [
                    {required: true,message: '请输入手机号',trigger: 'blur'},
                    {
                        validator: function(rule, value, callback) {
                        if (/^1[34578]\d{9}$/.test(value) == false) {
                            callback(new Error("手机号格式错误"));
                        } else {
                            callback();
                        }
                        },
                        trigger: "blur"
                    },
                ],
                email: [
                    {required: true,message: '请输入电子邮箱',trigger: 'blur'},
                    {type: 'email',message:'请输入正确的电子邮箱地址',trigger:['blur','change']}
                ],
                // introduction: [
                //     {required: true,message: '请输入签名',trigger: 'blur'}
                // ],
                // location: [
                //     {required: true,message: '请输入地区',trigger: 'blur'}
                // ]                
            }
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
            //设置忽略大小写
            // for(let i in tempData){
            //     tempData[i].username.toUpperCase().includes(_this.message.toUpperCase());
            // }
            if(this.select_word == ''){
                this.tableData = this.tempData;
            }else{
                this.tableData = [];
                for(let item of this.tempData){
                    if(item.username.includes(this.select_word)){
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
        //地区选择方法
        regionSelectOfInsert(data){
            var country = data.province.value
            var city = data.city.value 
            var area = data.area.value
            this.registerForm.location = country + city + area
        },
        regionSelectOfUpdate(data){
            var country = data.province.value
            var city = data.city.value 
            var area = data.area.value
            this.form.location = country + city + area
        },
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
        //查询所有用户
        getData(){
            this.tempData = [];
            this.tableData = [];
            var params = {pageSize:this.pageSize, pageNum:this.pageNum, username:this.username}            
            getAllConsumer(params).then(res => {
                this.tempData = res.data.records;
                this.tableData = res.data.records;
                this.total = res.data.total
            })
        },
        //添加用户
        addConsumer(){
            this.$refs['registerForm'].validate(valid =>{
                if(valid){
                    this.consumer.username = this.registerForm.username;
                    this.consumer.password = this.registerForm.password;
                    this.consumer.sex = this.registerForm.sex;
                    this.consumer.phoneNum = this.registerForm.phoneNum;
                    this.consumer.email = this.registerForm.email;
                    this.consumer.birth = this.registerForm.birth;
                    this.consumer.introduction = this.registerForm.introduction;
                    this.consumer.location = this.registerForm.location;
                    // this.consumer.avatar = '/img/user.jpg';
                    var consumer1 = this.consumer;
                    setConsumer(consumer1)
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
                }
            })
            
        },
        //弹出编辑页面
        handleEdit(row){
            this.editVisible = true;
            this.form = {
                id: row.id,
                username: row.username,
                password: row.password,
                sex: row.sex,
                phoneNum: row.phoneNum,
                email: row.email,
                birth: row.birth,
                introduction: row.introduction,
                location: row.location
            }
        },
        //保存编辑页面修改的数据
        editSave(){
            this.$refs['form'].validate(valid =>{
                if(valid){
                    this.consumer.id = this.form.id;
                    this.consumer.username = this.form.username;
                    this.consumer.password = this.form.password;
                    this.consumer.sex = this.form.sex;
                    this.consumer.phoneNum = this.form.phoneNum;
                    this.consumer.email = this.form.email;
                    this.consumer.birth = this.form.birth;
                    this.consumer.introduction = this.form.introduction;
                    this.consumer.location = this.form.location;

                    var consumer1 = this.consumer

                    updateConsumer(consumer1)
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
                }
            })
        },
        //更新图片
        uploadUrl(id){
            return `${this.$store.state.HOST}/consumer/updateConsumerAvatar?id=${id}`
        },
        //删除一名用户
        deleteRow(){
            delConsumer(this.idx)
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
        //转向该用户的收藏列表
        getCollect(id,name){
            this.$router.push({path: '/collect',query:{id,name}})
        }
    }
}
</script>

<style scoped>
    .handle-box{
        margin-bottom: 20px;
    }
    .consumer-img{
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