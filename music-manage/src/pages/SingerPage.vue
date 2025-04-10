<template>
    <div class="table">
        <div class="container">
            <div class="handle-box">
                在当前页搜索：
                <el-input v-model="select_word" size="mini" placeholder="请输入歌手名" class="handle-input"></el-input>
                <br>
                <br>
                搜&nbsp;&nbsp;索&nbsp;&nbsp;全&nbsp;&nbsp;部&nbsp;：
                <el-input v-model="name" size="mini" placeholder="请输入歌手名" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="getData">搜索</el-button>
                <el-button type="primary" size="mini" @click="delBatch">批量删除</el-button>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true">添加歌手</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="680px" :data="this.tableData" @selection-change="handleSelectionChange">   
            <el-table-column type="selection" width="40"></el-table-column>
            <el-table-column label="歌手图片" width="110" align="center">
                <template slot-scope="scope">
                    <div class="singer-img">
                        <img :src="getUrl(scope.row.pic)" style="width:100%"/>
                    </div>
                    <el-upload :action="uploadUrl(scope.row.id)" :before-upload="beforeAvatarUpload" 
                        :on-success="handleAvatarSuccess">
                        <el-button size="mini">更改图片</el-button>
                    </el-upload>
                </template>
            </el-table-column>
            <el-table-column prop="name" label="歌手" width="120" align="center">
            </el-table-column>
            <el-table-column label="性别" width="50" align="center" >
                <template slot-scope="scope">
                    {{changeSex(scope.row.sex)}}
                </template>
            </el-table-column>
            <el-table-column label="生日" width="120" align="center">
                <template slot-scope="scope">
                    {{attachBirth(scope.row.birth)}}
                </template>
            </el-table-column>
            <el-table-column prop="location" label="地区" width="100" align="center"></el-table-column>
            <el-table-column prop="introduction" label="简介" align="center"></el-table-column>
            <el-table-column label="歌曲管理" width="110" align="center" prop="introduction">
                <template slot-scope="scope">
                    <el-button size="mini" @click="songEdit(scope.row.id,scope.row.name)">歌曲管理</el-button>
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

        <el-dialog title="添加歌手" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px">
                <el-form-item prop="name" label="歌手名" size="mini">
                    <el-input v-model="registerForm.name" placeholder="歌手名"></el-input>
                </el-form-item>
                <el-form-item label="性别" size="mini">
                    <el-radio-group v-model="registerForm.sex">
                        <el-radio :label="0">女</el-radio>
                        <el-radio :label="1">男</el-radio>
                        <el-radio :label="2">组合</el-radio>
                        <el-radio :label="3">不明</el-radio>                        
                    </el-radio-group>
                </el-form-item>
                <el-form-item prop="birth" label="生日" size="mini">
                    <!-- <el-date-picker type="date" placeholder="选择日期" value-format="yyyy-MM-dd" v-model="registerForm.birth"  style="width:100%"></el-date-picker> -->
                     <el-date-picker
                        v-model="registerForm.birth"
                        type="date"
                        placeholder="选择日期"
                        format="yyyy 年 MM 月 dd 日"
                        value-format="yyyy-MM-dd">
                    </el-date-picker>
                </el-form-item>
                <el-form-item prop="location" label="地区" size="mini">
                    <!-- <el-input v-model="registerForm.location" placeholder="国籍-省(市州)"></el-input> -->
                    <el-select  placeholder="请选择国籍" filterable style="width: 77.9%" v-model="registerForm.location">
                        <el-option-group v-for="group in country" :key="group.label" :label="group.label">
                            <el-option v-for="item in group.options" :key="item.value" :label="item.label" :value="item.label">
                                <span style="float: left">{{ item.label }}</span>
                                <span style="float: right; color: #8492a6; font-size: 13px">{{ item.value }}</span>
                            </el-option>
                        </el-option-group>
                    </el-select>
                </el-form-item>
                <el-form-item prop="introduction" label="简介" size="mini">
                    <el-input v-model="registerForm.introduction" placeholder="简介" type="textarea"></el-input>
                </el-form-item>                
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addSinger">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="修改歌手" :visible.sync="editVisible" width="400px" center>
            <el-form :model="form" ref="form" label-width="80px">
                <el-form-item prop="name" label="歌手名" size="mini">
                    <el-input v-model="form.name" placeholder="歌手名"></el-input>
                </el-form-item>
                <el-form-item label="性别" size="mini">
                    <el-radio-group v-model="form.sex">
                        <el-radio :label="0">女</el-radio>
                        <el-radio :label="1">男</el-radio>
                        <el-radio :label="2">组合</el-radio>
                        <el-radio :label="3">不明</el-radio>                        
                    </el-radio-group>
                </el-form-item>
                <el-form-item prop="birth" label="生日" size="mini">
                    <!-- <el-date-picker type="date" placeholder="选择日期" v-model="form.birth" style="width:100%"></el-date-picker> -->
                    <el-date-picker
                            v-model="form.birth"
                            type="date"
                            placeholder="选择日期"
                            format="yyyy 年 MM 月 dd 日"
                            value-format="yyyy-MM-dd">
                        </el-date-picker>
                </el-form-item>
                <el-form-item prop="location" label="地区" size="mini">
                    <!-- <el-input v-model="form.location" placeholder="国籍-省(市州)"></el-input> -->
                    <el-select  placeholder="请选择国籍" filterable style="width: 77.9%" v-model="form.location">
                        <el-option-group v-for="group in country" :key="group.label" :label="group.label">
                            <el-option v-for="item in group.options" :key="item.value" :label="item.label" :value="item.label">
                                <span style="float: left">{{ item.label }}</span>
                                <span style="float: right; color: #8492a6; font-size: 13px">{{ item.value }}</span>
                            </el-option>
                        </el-option-group>
                    </el-select>
                </el-form-item>
                <el-form-item prop="introduction" label="简介" size="mini">
                    <el-input v-model="form.introduction" placeholder="简介" type="textarea"></el-input>
                </el-form-item>          
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="editSave">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="删除歌手" :visible.sync="delVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="delVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>                
            </span>
        </el-dialog>
    </div>
</template>

<script>
import {setSinger, getAllSingerPage,updateSinger,delSinger} from '../api/index';
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
                name: '',
                sex: '',
                birth: '',
                location: '',
                introduction: ''
            },
            form:{      //编辑框
                id: '',
                name: '',
                sex: '',
                birth: '',
                location: '',
                introduction: ''
            },
            name:'', //歌手名
            tableData: [], //表格数据
            tempData: [], //表格中的临时数据，用于模糊搜索框
            select_word: '', //搜索框中输入的文字
            pageSize: 10,    //分页每页大小
            pageNum: 1,  //当前页
            total: 0, //查询总数
            idx: -1,          //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            singer: {}, //歌手对象

            country:[{
    			label: '热门国家',
    			options: [{value:'China',label:'中国'},]
    		},{
    			label: '所有国家',
    			options: [
    			    {value:'Angola',label:'安哥拉'},
					{value:'Afghanistan',label:'阿富汗'},
					{value:'Albania',label:'阿尔巴尼亚'},
					{value:'Algeria',label:'阿尔及利亚'},
					{value:'Andorra',label:'安道尔共和国'},
					{value:'Anguilla',label:'安圭拉岛'},
					{value:'Antigua and Barbuda',label:'安提瓜和巴布达'},
					{value:'Argentina',label:'阿根廷'},
					{value:'Armenia',label:'亚美尼亚'},
					{value:'Ascension',label:'阿森松'},
					{value:'Australia',label:'澳大利亚'},
					{value:'Austria',label:'奥地利'},
					{value:'Azerbaijan',label:'阿塞拜疆'},
					{value:'Bahamas',label:'巴哈马'},
					{value:'Bahrain',label:'巴林'},
					{value:'Bangladesh',label:'孟加拉国'},
					{value:'Barbados',label:'巴巴多斯'},
					{value:'Belarus',label:'白俄罗斯'},
					{value:'Belgium',label:'比利时'},
					{value:'Belize',label:'伯利兹'},
					{value:'Benin',label:'贝宁'},
					{value:'Bermuda Is',label:'百慕大群岛'},
					{value:'Bolivia',label:'玻利维亚'},
					{value:'Botswana',label:'博茨瓦纳'},
					{value:'Brazil',label:'巴西'},
					{value:'Brunei',label:'文莱'},
					{value:'Bulgaria',label:'保加利亚'},
					{value:'Burkina Faso',label:'布基纳法索'},
					{value:'Burma',label:'缅甸'},
					{value:'Burundi',label:'布隆迪'},
					{value:'Cameroon',label:'喀麦隆'},
					{value:'Canada',label:'加拿大'},
					{value:'Cayman Is',label:'开曼群岛'},
					{value:'Central African Republic',label:'中非共和国'},
					{value:'Chad',label:'乍得'},
					{value:'Chile',label:'智利'},
					{value:'China',label:'中国'},
					{value:'Colombia',label:'哥伦比亚'},
					{value:'Congo',label:'刚果'},
					{value:'Cook Is',label:'库克群岛'},
					{value:'Costa Rica',label:'哥斯达黎加'},
					{value:'Cuba',label:'古巴'},
					{value:'Cyprus',label:'塞浦路斯'},
					{value:'Czech Republic',label:'捷克'},
					{value:'Denmark',label:'丹麦'},
					{value:'Djibouti',label:'吉布提'},
					{value:'Dominica Rep',label:'多米尼加共和国'},
					{value:'Ecuador',label:'厄瓜多尔'},
					{value:'Egypt',label:'埃及'},
					{value:'EI Salvador',label:'萨尔瓦多'},
					{value:'Estonia',label:'爱沙尼亚'},
					{value:'Ethiopia',label:'埃塞俄比亚'},
					{value:'Fiji',label:'斐济'},
					{value:'Finland',label:'芬兰'},
					{value:'France',label:'法国'},
					{value:'French Guiana',label:'法属圭亚那'},
					{value:'French Polynesia',label:'法属玻利尼西亚'},
					{value:'Gabon',label:'加蓬'},
					{value:'Gambia',label:'冈比亚'},
					{value:'Georgia',label:'格鲁吉亚'},
					{value:'Germany',label:'德国'},
					{value:'Ghana',label:'加纳'},
					{value:'Gibraltar',label:'直布罗陀'},
					{value:'Greece',label:'希腊'},
					{value:'Grenada',label:'格林纳达'},
					{value:'Guam',label:'关岛'},
					{value:'Guatemala',label:'危地马拉'},
					{value:'Guinea',label:'几内亚'},
					{value:'Guyana',label:'圭亚那'},
					{value:'Haiti',label:'海地'},
					{value:'Honduras',label:'洪都拉斯'},
					{value:'Hungary',label:'匈牙利'},
					{value:'Iceland',label:'冰岛'},
					{value:'India',label:'印度'},
					{value:'Indonesia',label:'印度尼西亚'},
					{value:'Iran',label:'伊朗'},
					{value:'Iraq',label:'伊拉克'},
					{value:'Ireland',label:'爱尔兰'},
					{value:'Israel',label:'以色列'},
					{value:'Italy',label:'意大利'},
					{value:'Ivory Coast',label:'科特迪瓦'},
					{value:'Jamaica',label:'牙买加'},
					{value:'Japan',label:'日本'},
					{value:'Jordan',label:'约旦'},
					{value:'Kampuchea (Cambodia )',label:'柬埔寨'},
					{value:'Kazakstan',label:'哈萨克斯坦'},
					{value:'Kenya',label:'肯尼亚'},
					{value:'Korea',label:'韩国'},
					{value:'Kuwait',label:'科威特'},
					{value:'Kyrgyzstan',label:'吉尔吉斯坦'},
					{value:'Laos',label:'老挝'},
					{value:'Latvia',label:'拉脱维亚'},
					{value:'Lebanon',label:'黎巴嫩'},
					{value:'Lesotho',label:'莱索托'},
					{value:'Liberia',label:'利比里亚'},
					{value:'Libya',label:'利比亚'},
					{value:'Liechtenstein',label:'列支敦士登'},
					{value:'Lithuania',label:'立陶宛'},
					{value:'Luxembourg',label:'卢森堡'},
					{value:'Madagascar',label:'马达加斯加'},
					{value:'Malawi',label:'马拉维'},
					{value:'Malaysia',label:'马来西亚'},
					{value:'Maldives',label:'马尔代夫'},
					{value:'Mali',label:'马里'},
					{value:'Malta',label:'马耳他'},
					{value:'Mariana Is',label:'马里亚那群岛'},
					{value:'Martinique',label:'马提尼克'},
					{value:'Mauritius',label:'毛里求斯'},
					{value:'Mexico',label:'墨西哥'},
					{value:'Moldova',label:'摩尔多瓦'},
					{value:'Monaco',label:'摩纳哥'},
					{value:'Mongolia',label:'蒙古'},
					{value:'Montserrat Is',label:'蒙特塞拉特岛'},
					{value:'Morocco',label:'摩洛哥'},
					{value:'Mozambique',label:'莫桑比克'},
					{value:'Namibia',label:'纳米比亚'},
					{value:'Nauru',label:'瑙鲁'},
					{value:'Nepal',label:'尼泊尔'},
					{value:'Netheriands Antilles',label:'荷属安的列斯'},
					{value:'Netherlands',label:'荷兰'},
					{value:'New Zealand',label:'新西兰'},
					{value:'Nicaragua',label:'尼加拉瓜'},
					{value:'Niger',label:'尼日尔'},
					{value:'Nigeria',label:'尼日利亚'},
					{value:'North Korea',label:'朝鲜'},
					{value:'Norway',label:'挪威'},
					{value:'Oman',label:'阿曼'},
					{value:'Pakistan',label:'巴基斯坦'},
					{value:'Panama',label:'巴拿马'},
					{value:'Papua New Cuinea',label:'巴布亚新几内亚'},
					{value:'Paraguay',label:'巴拉圭'},
					{value:'Peru',label:'秘鲁'},
					{value:'Philippines',label:'菲律宾'},
					{value:'Poland',label:'波兰'},
					{value:'Portugal',label:'葡萄牙'},
					{value:'Puerto Rico',label:'波多黎各'},
					{value:'Qatar',label:'卡塔尔'},
					{value:'Reunion',label:'留尼旺'},
					{value:'Romania',label:'罗马尼亚'},
					{value:'Russia',label:'俄罗斯'},
					{value:'Saint Lueia',label:'圣卢西亚'},
					{value:'Saint Vincent',label:'圣文森特岛'},
					{value:'Samoa Eastern',label:'东萨摩亚(美)'},
					{value:'Samoa Western',label:'西萨摩亚'},
					{value:'San Marino',label:'圣马力诺'},
					{value:'Sao Tome and Principe',label:'圣多美和普林西比'},
					{value:'Saudi Arabia',label:'沙特阿拉伯'},
					{value:'Senegal',label:'塞内加尔'},
					{value:'Seychelles',label:'塞舌尔'},
					{value:'Sierra Leone',label:'塞拉利昂'},
					{value:'Singapore',label:'新加坡'},
					{value:'Slovakia',label:'斯洛伐克'},
					{value:'Slovenia',label:'斯洛文尼亚'},
					{value:'Solomon Is',label:'所罗门群岛'},
					{value:'Somali',label:'索马里'},
					{value:'South Africa',label:'南非'},
					{value:'Spain',label:'西班牙'},
					{value:'SriLanka',label:'斯里兰卡'},
					{value:'St.Lucia',label:'圣卢西亚'},
					{value:'St.Vincent',label:'圣文森特'},
					{value:'Sudan',label:'苏丹'},
					{value:'Suriname',label:'苏里南'},
					{value:'Swaziland',label:'斯威士兰'},
					{value:'Sweden',label:'瑞典'},
					{value:'Switzerland',label:'瑞士'},
					{value:'Syria',label:'叙利亚'},
					{value:'Tajikstan',label:'塔吉克斯坦'},
					{value:'Tanzania',label:'坦桑尼亚'},
					{value:'Thailand',label:'泰国'},
					{value:'Togo',label:'多哥'},
					{value:'Tonga',label:'汤加'},
					{value:'Trinidad and Tobago',label:'特立尼达和多巴哥'},
					{value:'Tunisia',label:'突尼斯'},
					{value:'Turkey',label:'土耳其'},
					{value:'Turkmenistan',label:'土库曼斯坦'},
					{value:'Uganda',label:'乌干达'},
					{value:'Ukraine',label:'乌克兰'},
					{value:'United Arab Emirates',label:'阿拉伯联合酋长国'},
					{value:'United Kiongdom',label:'英国'},
					{value:'United States of America',label:'美国'},
					{value:'Uruguay',label:'乌拉圭'},
					{value:'Uzbekistan',label:'乌兹别克斯坦'},
					{value:'Venezuela',label:'委内瑞拉'},
					{value:'Vietnam',label:'越南'},
					{value:'Yemen',label:'也门'},
					{value:'Yugoslavia',label:'南斯拉夫'},
					{value:'Zimbabwe',label:'津巴布韦'},
					{value:'Zaire',label:'扎伊尔'},
					{value:'Zambia',label:'赞比亚'}
    			]
    		}],
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
                    if(item.name.includes(this.select_word)){
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
        //查询所有歌手
        getData(){
            this.tempData = [];
            this.tableData = [];
            var params = {pageSize:this.pageSize, pageNum:this.pageNum, singerName:this.name}
            getAllSingerPage(params).then(res => {
                this.tempData = res.data.records;
                this.tableData = res.data.records;
                this.total = res.data.total
                // this.pageNum = 1;
            })
        },
        //添加歌手
        addSinger(){
            // let params = new URLSearchParams();
            // params.append('name',this.registerForm.name);
            // params.append('sex',this.registerForm.sex);
            // params.append('birth',datetime);
            // params.append('location',this.registerForm.location);
            // params.append('introduction',this.registerForm.introduction);
            this.singer.name = this.registerForm.name;
            this.singer.sex = this.registerForm.sex;
            // this.singer.pic = '/img/singerPic/defaultSingerImg.jpg'; //添加歌手时设置默认图片
            this.singer.birth = this.registerForm.birth;
            this.singer.location = this.registerForm.location;
            this.singer.introduction = this.registerForm.introduction;
            var singer1 = this.singer
            setSinger(singer1)
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
                name: row.name,
                sex: row.sex,
                birth: row.birth,
                location: row.location,
                introduction: row.introduction
            }
        },
        //保存编辑页面修改的数据
        editSave(){
            // let d = new Date(this.form.birth);
            let datetime = this.form.birth
            // let params = new URLSearchParams();
            // params.append('id',this.form.id);
            // params.append('name',this.form.name);
            // params.append('sex',this.form.sex);
            // params.append('birth',datetime);
            // params.append('location',this.form.location);
            // params.append('introduction',this.form.introduction);
            this.singer.id = this.form.id
            this.singer.name = this.form.name;
            this.singer.sex = this.form.sex;
            this.singer.pic = null;
            this.singer.birth = datetime;
            this.singer.location = this.form.location;
            this.singer.introduction = this.form.introduction;
            var singer1 = this.singer
            updateSinger(singer1)
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
            return `${this.$store.state.HOST}/singer/updateSingerPic?id=${id}`
        },
        //删除一名歌手
        deleteRow(){
            delSinger(this.idx)
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
        songEdit(id,name){
            this.$router.push({path:`/Song`,query:{id,name}});
        }
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