<template>
<div>
    <div class="info">
        <div class="title">
            <span>编辑个人资料</span>
        </div>
        <hr/>
        <div class="personal">
            <el-form :model="registerForm" ref="registerForm" label-width="70px" class="demo-ruleForm" :rules="rules">
                <el-form-item prop="username" label="用户名">
                    <el-input v-model="registerForm.username" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password" label="密码">
                    <el-input type="password" v-model="registerForm.password" placeholder="密码"></el-input>
                </el-form-item>
                <el-form-item prop="sex" label="性别">
                    <el-radio-group v-model="registerForm.sex">
                        <el-radio :label="0">女</el-radio>
                        <el-radio :label="1">男</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item prop="phoneNum" label="手机">
                    <el-input v-model="registerForm.phoneNum" placeholder="手机"></el-input>
                </el-form-item>
                <el-form-item prop="email" label="邮箱">
                    <el-input v-model="registerForm.email" placeholder="邮箱"></el-input>
                </el-form-item>
                <el-form-item prop="birth" label="生日">
                    <!-- <el-date-picker type='date' :editable="false" v-model="registerForm.birth" placeholder="选择日期" style="width: 100%;"></el-date-picker> -->
                    <el-date-picker
                            v-model="registerForm.birth"
                            type="date"
                            placeholder="选择日期"
                            format="yyyy 年 MM 月 dd 日"
                            value-format="yyyy-MM-dd">
                    </el-date-picker>
                </el-form-item>
                <el-form-item prop="introduction" label="签名">
                    <el-input v-model="registerForm.introduction" placeholder="签名"></el-input>
                </el-form-item>
                <el-form-item prop="location" label="地区">
                    <!-- <el-select v-model="registerForm.location" placeholder="地区" style="width: 100%;">
                        <el-option v-for=" item in cities" :key="item.value" :label="item.label" :value="item.value"></el-option>
                    </el-select> -->
                    <v-distpicker v-model="registerForm.location" placeholder="地区" style="width: 100%;" @selected="regionSelectOfUpdate">{{}}</v-distpicker>
                </el-form-item>
            </el-form>
            <div class="btn">
                <div @click="saveMsg">保存</div>
                <div @click="goback(-1)">取消</div>
            </div>
        </div>
        
    </div>
</div>
</template>
<script>
import {mapGetters} from 'vuex'
import {rules,cities} from '../assets/data/form'
import {mixin} from '../mixins'
import {getUserOfId,updateUserMsg} from '../api/index'
import VDistpicker from "v-distpicker"

export default {
    name: 'info',
    mixins: [mixin],
    data() {
        return {
            registerForm: {
                username: '',       //用户名
                password: '',       //密码
                sex: '',            //性别
                phoneNum: '',       //手机
                email: '',          //邮箱
                birth: '',          //生日
                introduction: '',   //签名
                location: '',        //地区
                // location: {},        //地区
            },
            cities: [],            //所有的地区--省
            rules: {},               //表单提交的规则
            consumer: {},           //用户对象
        }        
    },
    components: {
        "v-distpicker":VDistpicker
    },
    computed:{
        ...mapGetters([
            'userId'
        ])
    },
    created() {
        this.rules = rules;
        this.cities = cities;
    },
    mounted(){
        this.getMsg(this.userId);
    },
    methods:{
        //地区选择
        regionSelectOfUpdate(data){
            var province = data.province.value;
            var city = data.city.value;
            var area = data.area.value;
            // console.log(data,'data')
            this.registerForm.location = province + city + area
        },
        getMsg(userId){
            getUserOfId(userId)
                .then(res =>{
                    this.registerForm.username = res.data.username;
                    this.registerForm.password = res.data.password;
                    this.registerForm.sex = res.data.sex;
                    this.registerForm.phoneNum = res.data.phoneNum;
                    this.registerForm.email = res.data.email;
                    this.registerForm.birth = res.data.birth;
                    this.registerForm.introduction = res.data.introduction;
                    this.registerForm.location = res.data.location;
                })
                .catch(err => {
                    console.log(err);
                })
        },
        saveMsg(){
            let _this = this;

            this.consumer.id = this.userId;
            this.consumer.username = this.registerForm.username;
            this.consumer.password = this.registerForm.password;
            this.consumer.sex = this.registerForm.sex;
            this.consumer.phoneNum = this.registerForm.phoneNum;
            this.consumer.email = this.registerForm.email;
            this.consumer.birth = this.registerForm.birth;
            this.consumer.introduction = this.registerForm.introduction;
            this.consumer.location = this.registerForm.location;
            var consumer1 = this.consumer;
            updateUserMsg(consumer1)
                .then(res => {
                    if(res.code == 1){
                        _this.$store.commit('setUsername',this.registerForm.username);
                        _this.notify('修改成功','success');
                        setTimeout(function(){
                            _this.$router.push({path: '/'});
                        },2000);
                    }else{
                        _this.notify('修改失败','error');
                    }
                })
                .catch(err => {
                    _this.notify('修改失败','error');
                })
        },
        goback(index){
            this.$router.go(index);
        }
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/info.scss';
</style>