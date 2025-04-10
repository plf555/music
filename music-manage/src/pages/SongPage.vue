<template>
    <div class="table">
        <div class="crumbs">
            <i class="el-icon-tickets" style="font-size: 18px; padding-top: 18px">{{this.singerName}}-音乐列表</i>
        </div>
        <div class="container">
            <div class="handle-box">
                在当前页搜索：
                <el-input v-model="select_word" size="mini" placeholder="请输入歌曲名" class="handle-input"></el-input>
                <br>
                <br>
                搜&nbsp;&nbsp;索&nbsp;&nbsp;全&nbsp;&nbsp;部&nbsp;：
                <el-input v-model="songName" size="mini" placeholder="请输入歌曲名" class="handle-input"></el-input>
                <el-button type="primary" size="mini" @click="getData">搜索</el-button>
                <el-button type="primary" size="mini" @click="delBatch">批量删除</el-button>
                <el-button type="primary" size="mini" @click="centerDialogVisible = true">添加歌曲</el-button>
            </div>
        </div>
        <el-table size="mini" ref="multipleTable" border style="width:100%" height="680px" :data="tableData" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="40"></el-table-column>
            <el-table-column label="歌曲图片" width="110" align="center">
                <template slot-scope="scope">
                    <div class="song-img">
                        <img :src="getUrl(scope.row.pic)" style="width:100%"/>
                    </div>
                    <div class="play" @click="setSongUrl(scope.row.url,scope.row.name)">
                        <div v-if="toggle == scope.row.name">
                            <svg class="icon">
                                <use xlink:href="#icon-zanting"></use>
                            </svg>
                        </div>
                        <div v-if="toggle != scope.row.name">
                            <svg class="icon">
                                <use xlink:href="#icon-bofanganniu"></use>
                            </svg>
                        </div>
                    </div>
                </template>
            </el-table-column>
            <el-table-column prop="name" label="歌名" width="120" align="center"></el-table-column>
            <el-table-column prop="album" label="专辑" width="150" align="center"></el-table-column>
            <el-table-column label="歌词" align="center">
                <template slot-scope="scope">
                    <ul style="height:100px;overflow-y:scroll;">
                        <li v-for="(item,index) in parseLyric(scope.row.lyric)" :key="index">
                            {{item}}
                        </li>
                    </ul>
                </template>
            </el-table-column>
            <el-table-column label="资源更新" align="center" width="100">
                <template slot-scope="scope">
                    <el-upload :action="uploadUrl(scope.row.id)" :before-upload="beforeAvatarUpload" 
                        :on-success="handleAvatarSuccess">
                        <el-button size="mini">更新图片</el-button>
                    </el-upload>
                    <br/>
                    <el-upload :action="uploadSongUrl(scope.row.id)" :before-upload="beforeSongUpload" 
                        :on-success="handleSongSuccess">
                        <el-button size="mini">更新歌曲</el-button>
                    </el-upload>
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
                :page-sizes="[1, 10, 20, 50]"
                :limit.sync="pageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total=this.total>
                
            </el-pagination>
        </div>

        <el-dialog title="添加歌曲" :visible.sync="centerDialogVisible" width="400px" center>
            <el-form :model="registerForm" ref="registerForm" label-width="80px" action="" id="tf">
                <div>
                    <label>歌名</label>
                    <el-input v-model="registerForm.name" type="text" name="name"></el-input>
                </div>
                <div>
                    <label>专辑</label>
                    <el-input v-model="registerForm.album" type="text" name="album"></el-input>
                </div>
                <div>
                    <label>歌词</label>
                    <el-input v-model="registerForm.lyric" type="textarea" name="lyric"></el-input>
                </div>
                <div>
                    <label>风格</label>
                    <el-select v-model="songStyle" multiple :multiple-limit=3 name="style" placeholder="请选择至多3项">
                        <el-option
                            v-for="item in styles"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                        </el-option>
                    </el-select>
                </div>
                <div>
                    <label>歌曲上传</label>
                    <input type="file" name="file">
                </div>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="centerDialogVisible = false">取消</el-button>
                <el-button size="mini" @click="addSong">确定</el-button>                
            </span>
        </el-dialog>
        <el-dialog title="修改歌曲" :visible.sync="editVisible" width="400px" center>
            <el-form :model="form" ref="form" label-width="80px">
                <el-form-item prop="name" label="歌名" size="mini">
                    <el-input v-model="form.name" placeholder="歌名"></el-input>
                </el-form-item>                
                <el-form-item prop="album" label="专辑" size="mini">
                    <el-input v-model="form.album" placeholder="专辑"></el-input>
                </el-form-item>
                <el-form-item prop="lyric" label="歌词" size="mini">
                    <el-input v-model="form.lyric" placeholder="歌词" type="textarea"></el-input>
                </el-form-item>  
                <el-form-item prop="style" label="风格" size="mini">
                    <el-select v-model="form.style" multiple :multiple-limit=3 placeholder="请选择至多3项">
                        <el-option
                            v-for="item in styles"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                        </el-option>
                    </el-select>
                </el-form-item>
            </el-form>
            <span slot="footer">
                <el-button size="mini" @click="editVisible = false">取消</el-button>
                <el-button size="mini" @click="editSave">确定</el-button>                
            </span>
        </el-dialog>

        <el-dialog title="删除歌曲" :visible.sync="delVisible" width="300px" center>
            <div align="center">删除不可恢复，是否确定删除？</div>
            <span slot="footer">
                <el-button size="mini" @click="delVisible = false">取消</el-button>
                <el-button size="mini" @click="deleteRow">确定</el-button>                
            </span>
        </el-dialog>

        <!-- 切换页面歌曲暂停弹框 -->
        <el-dialog title="暂停歌曲？" :visible.sync="pauseVisible" width="300px" center>
            <div align="center">是否暂停当前播放歌曲？</div>
            <span slot="footer">
                <el-button size="mini" @click="pauseVisible = false" type="danger">继续播放</el-button>
                <el-button size="mini" @click="deleteRow" type="danger">停止播放</el-button>                
            </span>
        </el-dialog>
    </div>
</template>

<script>
import { mixin } from '../mixins/index';
import {mapGetters} from 'vuex';
import '@/assets/js/iconfont.js';
import {songOfSingerId,updateSong,delSong} from '../api/index';

export default {
    mixins: [mixin],
    data(){
        return{
            singerId: '',               //歌手id
            singerName: '',             //歌手名
            centerDialogVisible: false, //添加弹窗是否显示
            editVisible: false,         //编辑弹窗是否显示
            delVisible: false,          //删除弹窗是否显示
            pauseVisible: false,          //切换页面弹窗是否显示
            registerForm:{      //添加框
                name: '',
                singerName: '',                
                album: '',
                lyric: '',
                style: ''
            },
            songStyle:['流行', '华语'],
            checkedStyles: ['流行', '华语'], //默认歌单风格
            form:{      //编辑框
                id: '',
                name: '',
                album: '',
                lyric: '',
                style: ''
            },
            songName: '', //搜索全部输入框歌手姓名
            tableData: [], //表格数据
            tempData: [], //临时数据，用于当前页的模糊查询
            select_word: '', //当前页模糊查询中的值
            pageSize: 10,    //分页每页大小
            pageNum: 1, //当前页
            total: 0, //查询总数
            idx: -1,  //当前选择项
            multipleSelection: [],   //哪些项已经打勾
            toggle: false,           //播放器的图标状态
            song: {}, //歌曲对象
            styles: [{
                value: '华语',
                label: '华语'
            }, {
                value: '粤语',
                label: '粤语'
            }, {
                value: '欧美',
                label: '欧美'
            }, {
                value: '日韩',
                label: '日韩'
            }, {
                value: '摇滚',
                label: '摇滚'
            }, {
                value: '民谣',
                label: '民谣'
            }, {
                value: '流行',
                label: '流行'
            }, {
                value: '选项8',
                label: '其他'
            }] //所有歌曲风格
        }
    },
    computed:{
        ...mapGetters([
            'isPlay'
        ]),
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
        this.singerId = this.$route.query.id;
        this.singerName = this.$route.query.name;
        this.getData();
    },
    destroyed() {
        this.pauseVisible=true;
        this.$store.commit('setIsPlay',false);
    },
    methods:{
        handleCheckedCitiesChange(value){
            this.form.style=value
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
        //查询某位歌手的所有歌曲
        getData(){
            this.tempData = [];
            this.tableData = [];
            var params = {pageSize:this.pageSize, pageNum:this.pageNum, songName:this.songName, singerId:this.singerId}
            // var params = {pageSize:this.pageSize, pageNum:this.pageNum, songName:this.songName, singerId:this.singerId}
            songOfSingerId(params).then(res => {
                this.tempData = res.data.records;
                this.tableData = res.data.records;
                this.total = res.data.total
            })
        },
        //添加歌曲
        addSong(){
            let _this = this;
            var form = new FormData(document.getElementById('tf'));
            form.set('style', _this.songStyle.toString())
            form.append('singerId',this.singerId);
            form.set('name', form.get('name'));
            if(!form.get('lyric')){
                form.set('lyric','[00:00:00]暂无歌词');
            }
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
            req.open('post',`${_this.$store.state.HOST}/song/add`,false);
            req.send(form);
            _this.centerDialogVisible = false;
        },

        //弹出编辑页面
        handleEdit(row){
            this.editVisible = true;
            this.form = {
                id: row.id,
                name: row.name,
                album: row.album,
                lyric: row.lyric,
                style: row.style,
            }
        },
        //保存编辑页面修改的数据
        editSave(){            
            this.song.id = this.form.id
            this.song.name = this.form.name;
            this.song.album = this.form.album;
            this.song.lyric = this.form.lyric;
            this.song.style = this.form.style.toString();
            var song1 = this.song

            updateSong(song1)
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
            return `${this.$store.state.HOST}/song/updateSongPic?id=${id}`
        },
        //删除一名歌手
        deleteRow(){
            delSong(this.idx)
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
        //解析歌词
        parseLyric(text){
            let lines = text.split("\n");
            let pattern = /\[\d{2}:\d{2}.(\d{3}|\d{2})\]/g;
            let result = [];
            for(let item of lines){
                let value = item.replace(pattern,'');
                result.push(value);
            }
            return result;
        },
        //上传歌曲之前的校验
        beforeSongUpload(file){
            var testMsg = file.name.substring(file.name.lastIndexOf('.') + 1);
            if(testMsg!='mp3'){
                this.$message({
                    message: '文件格式错误',
                    type: 'error'
                });
                return false;
            }
            return true;
        },
        //上传歌曲成功之后要做的工作
        handleSongSuccess(res){
            let _this = this;
            if(res.code == 1){
                _this.getData();
                _this.$notify({
                    title: res.message,
                    type: 'success'
                });
            }else{
                _this.$notify({
                    title: res.message,
                    type: 'error'
                });
            }
        },
        //更新歌曲url
        uploadSongUrl(id){
            return `${this.$store.state.HOST}/song/updateSong?id=${id}`
        },
        //切换播放歌曲
        setSongUrl(url,name){
         if(this.toggle==name){
             this.toggle=false;
             this.$store.commit('setIsPlay',false);
         }else{
             this.toggle=name;
             this.$store.commit('setUrl',this.$store.state.HOST+'/'+url);
             this.$store.commit('setIsPlay',true);
            }
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