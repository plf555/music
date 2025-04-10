<template>
<div>
    <loginLogo/>
    <div class="signUp">
        <div class="signUp-head">
            <span>帐号登录</span>
        </div>
        <el-form :model="loginForm" ref="loginForm" label-width="70px" class="demo-ruleForm" :rules="rules">
            <el-form-item prop="username" label="用户名">
                <el-input 
                v-model="loginForm.username" 
                placeholder="用户名"
                @keyup.enter.native="handleLoginIn"
                ></el-input>
            </el-form-item>
            <el-form-item prop="password" label="密码">
                <el-input 
                type="password" 
                v-model="loginForm.password" 
                placeholder="密码"
                @keyup.enter.native="handleLoginIn">
                </el-input>
            </el-form-item>
            <el-form-item prop="password" label="验证码">
                <div id="auth_code">
                    <el-input
                        v-model="loginForm.numcode" 
                        placeholder="验证码">
                    </el-input>
                </div> 
                
            </el-form-item> 
            
            <div class="login-btn">
                <el-button @click="goSignUp()">注册</el-button>
                <el-button type="primary" @click.native.prevent="handleLoginIn">登录</el-button>
            </div>
        </el-form>
        <div id="forgot-password">
            <!-- <el-button type="text" @click="open">忘记密码？</el-button> -->
            <el-button type="text" @click="dialogFormVisible = true">忘记密码？</el-button>
            <el-dialog title="通过邮箱找回密码" :visible.sync="dialogFormVisible" class="validate-box">
                <el-form :model="codeForm">
                    <p>用户名：</p>
                    <el-input placeholder="请输入用户名" v-model="innerVisibleForm.username" class="validate-mail"></el-input>
                    <br>
                    <br>
                    <p>邮箱号：</p>
                    <el-input placeholder="请输入邮箱" v-model="innerVisibleForm.email" class="validate-mail"></el-input>
                    <el-button v-show="verShow" @click="getCode()" type="primary">获取验证码</el-button>
                    <el-button v-show="!verShow" disabled type="info"><span>{{timer}}</span>秒后重新获取</el-button>
                    <br>
                    <br>
                    <p>验证码：</p>
                    <el-form-item>
                        <el-input v-model="codeForm.validateCode" class="validate-mail"></el-input>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="dialogFormVisible = false">取 消</el-button>
                    <el-button type="primary" @click="validateEamilCode1">确 定</el-button>
                </div>
            </el-dialog>
        </div>

        <el-dialog title="修改密码" :visible.sync="changePasswordDialogVisible" width="400px" center>
            <el-form :model="changePasswordForm" ref="changePasswordForm" label-width="80px">
                <el-form-item prop="username" label="用户名" size="mini">
                    <el-input v-model="changePasswordForm.username" placeholder="请输入用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password" label="新密码" size="mini">
                    <el-input :type="passwordType" v-model="changePasswordForm.password" placeholder="请输入新密码"></el-input>
                    <!-- <span class="show-pwd" @click="showPwd">
                        <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'" />
                    </span> -->
                </el-form-item>
                <!-- <el-form-item prop="passwordAgain" label="新密码" size="mini">
                    <el-input v-model="changePasswordForm.passwordAgain" placeholder="确认新密码" type="password"></el-input>
                </el-form-item>                 -->
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="back">取消</el-button>
                <el-button size="mini" @click.native.prevent="changePassword1">确定</el-button>                
            </span>
        </el-dialog>

    </div>
</div>
</template>
<script>
import loginLogo from '../components/LoginLogo'
import {mixin} from '../mixins'
import {GVerify} from '../assets/js/numcode.js'
import {loginIn,sendEmailCode,validateEmailAndUsername,validateEamilCode,changePassword} from '../api/index'

export default {
    name: 'login-in',
    mixins: [mixin],
    components: {
        loginLogo
    },
    data() {
        return {
            verifyCode: '',
            passwordType: 'password',
            changePasswordDialogVisible: false, //修改密码弹窗是否显示
            changePasswordForm: {
                username: '',
                password: ''
            },
            innerVisibleForm:{
                username:'',
                email:''
            },
            codeForm: {
                validateCode: '',
            },
            dialogFormVisible: false,
            verShow: true, // 判断显示那个按钮
            timer: 60, // 短信验证码倒计时
            loginForm: {
                username: '',       //用户名
                password: '',       //密码
                numcode: '' //验证码
            },
            rules: {
                username: [
                    { required: true, trigger: 'blur',message: '请输入用户名' }
                ],
                password: [
                    { required: true, trigger: 'blur',message: '请输入密码' }
                ]
            }
        }    
    },
    mounted() {
        this.changeIndex('登录');
        this.verifyCode = new GVerify("auth_code");
    },
    methods:{
        // showPwd() {
        //     if (this.passwordType === 'password') {
        //         this.passwordType = ''
        //     } else {
        //         this.passwordType = 'password'
        //     }
        //     this.$nextTick(() => {
        //         this.$refs.password.focus()
        //     })
        // },
        back(){
            this.changePasswordDialogVisible = false;
            this.dialogFormVisible = true;
        },
        changePassword1(params = {}){
            params.username = this.changePasswordForm.username
            params.password =  md5(this.changePasswordForm.password, 32);
            if(params.username != this.innerVisibleForm.username){
                this.notify('不是您的账户','error');
            }else{
                changePassword(params)
                .then(res =>{
                    if(res.code == '1'){
                        this.notify(res.message,'success');
                        this.changePasswordDialogVisible = false;
                    }else{
                        this.notify('出现内部错误，请联系管理员','error');
                        console.log('aaa',res.code)
                    }
                })
                .catch(err => {
                    console.log(err);
                })
            }
        },
        //校验参数、校验用户名和邮箱是否匹配、发送验证码
        getCode () {
            const regEmali = /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/
            if (regEmali.test(this.innerVisibleForm.email)) {
                this.verShow = false
                const authTimer = setInterval(() => {
                this.timer--
                if (this.timer <= 0) {
                    this.verShow = true
                    this.timer = 60
                    clearInterval(authTimer)
                }
                }, 1000)
                var username = this.innerVisibleForm.username
                var email = this.innerVisibleForm.email
                validateEmailAndUsername(username, email)
                    .then(res =>{
                        if(res.code == '1'){
                            this.notify(res.message,'success');
                            sendEmailCode(username,email);
                        }
                        if(res.code == '0'){
                            this.notify(res.message,'error');
                        }
                    })
                    .catch(err => {
                        console.log(err);
                    })
            } else {
                this.$message.error('邮箱格式不正确!')
            }
        },
        //提交验证码
        validateEamilCode1 () {
            var validateCode = this.codeForm.validateCode
            validateEamilCode(validateCode)
                .then(res =>{
                    if(res.code == '1'){
                        this.notify(res.message,'success');
                        this.dialogFormVisible = false
                        this.changePasswordDialogVisible = true;
                    }
                    if(res.code == '0'){
                        this.notify(res.message,'error');
                    }
                })
                .catch(err => {
                    console.log(err);
                })
        },

        handleLoginIn(params = {}){
            let _this = this;
            params.name = this.loginForm.username;
            // params.password = this.loginForm.password;
            params.password = md5(this.loginForm.password, 32);
            if(this.verifyCode.validate(this.loginForm.numcode)){
                loginIn(params)
                .then(res => {
                    if(res.code == 1){
                        _this.notify('登录成功','success');
                        _this.$store.commit('setLoginIn',true);
                        _this.$store.commit('setUserId',res.id);
                        _this.$store.commit('setUsername',res.username);
                        _this.$store.commit('setAvatar',res.avatar);                                             
                        setTimeout(function(){
                            _this.changeIndex('首页');
                            _this.$router.push({path: '/'});
                        },2000);
                    }else{
                        _this.notify(res.message,'error');
                    }
                })
                .catch(err => {
                    _this.notify('系统内部异常','error');
                })
            }else{
                 _this.notify('验证码错误','warning');
                this.verifyCode.refresh();
                return
            }
            
        },
        goSignUp(){
            this.changeIndex('注册');
            this.$router.push({path: '/sign-up'});
        },
        changeIndex(value){
            this.$store.commit('setActiveName',value);
        }
    }
}

//MD5加密
function md5(string,bit) {
    function md5_RotateLeft(lValue, iShiftBits) {
        return (lValue << iShiftBits) | (lValue >>> (32 - iShiftBits));
    }
    function md5_AddUnsigned(lX, lY) {
        var lX4, lY4, lX8, lY8, lResult;
        lX8 = (lX & 0x80000000);
        lY8 = (lY & 0x80000000);
        lX4 = (lX & 0x40000000);
        lY4 = (lY & 0x40000000);
        lResult = (lX & 0x3FFFFFFF) + (lY & 0x3FFFFFFF);
        if (lX4 & lY4) {
            return (lResult ^ 0x80000000 ^ lX8 ^ lY8);
        }
        if (lX4 | lY4) {
            if (lResult & 0x40000000) {
                return (lResult ^ 0xC0000000 ^ lX8 ^ lY8);
            } else {
                return (lResult ^ 0x40000000 ^ lX8 ^ lY8);
            }
        } else {
            return (lResult ^ lX8 ^ lY8);
        }
    }
    function md5_F(x, y, z) {
        return (x & y) | ((~x) & z);
    }
    function md5_G(x, y, z) {
        return (x & z) | (y & (~z));
    }
    function md5_H(x, y, z) {
        return (x ^ y ^ z);
    }
    function md5_I(x, y, z) {
        return (y ^ (x | (~z)));
    }
    function md5_FF(a, b, c, d, x, s, ac) {
        a = md5_AddUnsigned(a, md5_AddUnsigned(md5_AddUnsigned(md5_F(b, c, d), x), ac));
        return md5_AddUnsigned(md5_RotateLeft(a, s), b);
    };
    function md5_GG(a, b, c, d, x, s, ac) {
        a = md5_AddUnsigned(a, md5_AddUnsigned(md5_AddUnsigned(md5_G(b, c, d), x), ac));
        return md5_AddUnsigned(md5_RotateLeft(a, s), b);
    };
    function md5_HH(a, b, c, d, x, s, ac) {
        a = md5_AddUnsigned(a, md5_AddUnsigned(md5_AddUnsigned(md5_H(b, c, d), x), ac));
        return md5_AddUnsigned(md5_RotateLeft(a, s), b);
    };
    function md5_II(a, b, c, d, x, s, ac) {
        a = md5_AddUnsigned(a, md5_AddUnsigned(md5_AddUnsigned(md5_I(b, c, d), x), ac));
        return md5_AddUnsigned(md5_RotateLeft(a, s), b);
    };
    function md5_ConvertToWordArray(string) {
        var lWordCount;
        var lMessageLength = string.length;
        var lNumberOfWords_temp1 = lMessageLength + 8;
        var lNumberOfWords_temp2 = (lNumberOfWords_temp1 - (lNumberOfWords_temp1 % 64)) / 64;
        var lNumberOfWords = (lNumberOfWords_temp2 + 1) * 16;
        var lWordArray = Array(lNumberOfWords - 1);
        var lBytePosition = 0;
        var lByteCount = 0;
        while (lByteCount < lMessageLength) {
            lWordCount = (lByteCount - (lByteCount % 4)) / 4;
            lBytePosition = (lByteCount % 4) * 8;
            lWordArray[lWordCount] = (lWordArray[lWordCount] | (string.charCodeAt(lByteCount) << lBytePosition));
            lByteCount++;
        }
        lWordCount = (lByteCount - (lByteCount % 4)) / 4;
        lBytePosition = (lByteCount % 4) * 8;
        lWordArray[lWordCount] = lWordArray[lWordCount] | (0x80 << lBytePosition);
        lWordArray[lNumberOfWords - 2] = lMessageLength << 3;
        lWordArray[lNumberOfWords - 1] = lMessageLength >>> 29;
        return lWordArray;
    };
    function md5_WordToHex(lValue) {
        var WordToHexValue = "", WordToHexValue_temp = "", lByte, lCount;
        for (lCount = 0; lCount <= 3; lCount++) {
            lByte = (lValue >>> (lCount * 8)) & 255;
            WordToHexValue_temp = "0" + lByte.toString(16);
            WordToHexValue = WordToHexValue + WordToHexValue_temp.substr(WordToHexValue_temp.length - 2, 2);
        }
        return WordToHexValue;
    };
    function md5_Utf8Encode(string) {
        string = string.replace(/\r\n/g, "\n");
        var utftext = "";
        for (var n = 0; n < string.length; n++) {
            var c = string.charCodeAt(n);
            if (c < 128) {
                utftext += String.fromCharCode(c);
            } else if ((c > 127) && (c < 2048)) {
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            } else {
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }
        }
        return utftext;
    };
    var x = Array();
    var k, AA, BB, CC, DD, a, b, c, d;
    var S11 = 7, S12 = 12, S13 = 17, S14 = 22;
    var S21 = 5, S22 = 9, S23 = 14, S24 = 20;
    var S31 = 4, S32 = 11, S33 = 16, S34 = 23;
    var S41 = 6, S42 = 10, S43 = 15, S44 = 21;
    string = md5_Utf8Encode(string);
    x = md5_ConvertToWordArray(string);
    a = 0x67452301; b = 0xEFCDAB89; c = 0x98BADCFE; d = 0x10325476;
    for (k = 0; k < x.length; k += 16) {
        AA = a; BB = b; CC = c; DD = d;
        a = md5_FF(a, b, c, d, x[k + 0], S11, 0xD76AA478);
        d = md5_FF(d, a, b, c, x[k + 1], S12, 0xE8C7B756);
        c = md5_FF(c, d, a, b, x[k + 2], S13, 0x242070DB);
        b = md5_FF(b, c, d, a, x[k + 3], S14, 0xC1BDCEEE);
        a = md5_FF(a, b, c, d, x[k + 4], S11, 0xF57C0FAF);
        d = md5_FF(d, a, b, c, x[k + 5], S12, 0x4787C62A);
        c = md5_FF(c, d, a, b, x[k + 6], S13, 0xA8304613);
        b = md5_FF(b, c, d, a, x[k + 7], S14, 0xFD469501);
        a = md5_FF(a, b, c, d, x[k + 8], S11, 0x698098D8);
        d = md5_FF(d, a, b, c, x[k + 9], S12, 0x8B44F7AF);
        c = md5_FF(c, d, a, b, x[k + 10], S13, 0xFFFF5BB1);
        b = md5_FF(b, c, d, a, x[k + 11], S14, 0x895CD7BE);
        a = md5_FF(a, b, c, d, x[k + 12], S11, 0x6B901122);
        d = md5_FF(d, a, b, c, x[k + 13], S12, 0xFD987193);
        c = md5_FF(c, d, a, b, x[k + 14], S13, 0xA679438E);
        b = md5_FF(b, c, d, a, x[k + 15], S14, 0x49B40821);
        a = md5_GG(a, b, c, d, x[k + 1], S21, 0xF61E2562);
        d = md5_GG(d, a, b, c, x[k + 6], S22, 0xC040B340);
        c = md5_GG(c, d, a, b, x[k + 11], S23, 0x265E5A51);
        b = md5_GG(b, c, d, a, x[k + 0], S24, 0xE9B6C7AA);
        a = md5_GG(a, b, c, d, x[k + 5], S21, 0xD62F105D);
        d = md5_GG(d, a, b, c, x[k + 10], S22, 0x2441453);
        c = md5_GG(c, d, a, b, x[k + 15], S23, 0xD8A1E681);
        b = md5_GG(b, c, d, a, x[k + 4], S24, 0xE7D3FBC8);
        a = md5_GG(a, b, c, d, x[k + 9], S21, 0x21E1CDE6);
        d = md5_GG(d, a, b, c, x[k + 14], S22, 0xC33707D6);
        c = md5_GG(c, d, a, b, x[k + 3], S23, 0xF4D50D87);
        b = md5_GG(b, c, d, a, x[k + 8], S24, 0x455A14ED);
        a = md5_GG(a, b, c, d, x[k + 13], S21, 0xA9E3E905);
        d = md5_GG(d, a, b, c, x[k + 2], S22, 0xFCEFA3F8);
        c = md5_GG(c, d, a, b, x[k + 7], S23, 0x676F02D9);
        b = md5_GG(b, c, d, a, x[k + 12], S24, 0x8D2A4C8A);
        a = md5_HH(a, b, c, d, x[k + 5], S31, 0xFFFA3942);
        d = md5_HH(d, a, b, c, x[k + 8], S32, 0x8771F681);
        c = md5_HH(c, d, a, b, x[k + 11], S33, 0x6D9D6122);
        b = md5_HH(b, c, d, a, x[k + 14], S34, 0xFDE5380C);
        a = md5_HH(a, b, c, d, x[k + 1], S31, 0xA4BEEA44);
        d = md5_HH(d, a, b, c, x[k + 4], S32, 0x4BDECFA9);
        c = md5_HH(c, d, a, b, x[k + 7], S33, 0xF6BB4B60);
        b = md5_HH(b, c, d, a, x[k + 10], S34, 0xBEBFBC70);
        a = md5_HH(a, b, c, d, x[k + 13], S31, 0x289B7EC6);
        d = md5_HH(d, a, b, c, x[k + 0], S32, 0xEAA127FA);
        c = md5_HH(c, d, a, b, x[k + 3], S33, 0xD4EF3085);
        b = md5_HH(b, c, d, a, x[k + 6], S34, 0x4881D05);
        a = md5_HH(a, b, c, d, x[k + 9], S31, 0xD9D4D039);
        d = md5_HH(d, a, b, c, x[k + 12], S32, 0xE6DB99E5);
        c = md5_HH(c, d, a, b, x[k + 15], S33, 0x1FA27CF8);
        b = md5_HH(b, c, d, a, x[k + 2], S34, 0xC4AC5665);
        a = md5_II(a, b, c, d, x[k + 0], S41, 0xF4292244);
        d = md5_II(d, a, b, c, x[k + 7], S42, 0x432AFF97);
        c = md5_II(c, d, a, b, x[k + 14], S43, 0xAB9423A7);
        b = md5_II(b, c, d, a, x[k + 5], S44, 0xFC93A039);
        a = md5_II(a, b, c, d, x[k + 12], S41, 0x655B59C3);
        d = md5_II(d, a, b, c, x[k + 3], S42, 0x8F0CCC92);
        c = md5_II(c, d, a, b, x[k + 10], S43, 0xFFEFF47D);
        b = md5_II(b, c, d, a, x[k + 1], S44, 0x85845DD1);
        a = md5_II(a, b, c, d, x[k + 8], S41, 0x6FA87E4F);
        d = md5_II(d, a, b, c, x[k + 15], S42, 0xFE2CE6E0);
        c = md5_II(c, d, a, b, x[k + 6], S43, 0xA3014314);
        b = md5_II(b, c, d, a, x[k + 13], S44, 0x4E0811A1);
        a = md5_II(a, b, c, d, x[k + 4], S41, 0xF7537E82);
        d = md5_II(d, a, b, c, x[k + 11], S42, 0xBD3AF235);
        c = md5_II(c, d, a, b, x[k + 2], S43, 0x2AD7D2BB);
        b = md5_II(b, c, d, a, x[k + 9], S44, 0xEB86D391);
        a = md5_AddUnsigned(a, AA);
        b = md5_AddUnsigned(b, BB);
        c = md5_AddUnsigned(c, CC);
        d = md5_AddUnsigned(d, DD);
    }
    if(bit==32){
        return (md5_WordToHex(a) + md5_WordToHex(b) + md5_WordToHex(c) + md5_WordToHex(d)).toUpperCase();
    }
    return (md5_WordToHex(b) + md5_WordToHex(c)).toUpperCase();
}



</script>

<style lang="scss" scoped>
@import '../assets/css/sign-up.scss';
#auth_code{
    width: 40%
}

</style>