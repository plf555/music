<template>
    <div>
        <el-row :gutter="20" class="mgb20" style="margin-top: 15px">
            <el-col :span="6">
                <el-card>
                    <div class="grid-content">
                        <div class="grid-cont-center">
                            <div class="grid-num">{{consumerCount}}</div>
                            <div>用户总数</div>
                        </div>
                    </div>
                </el-card>
            </el-col>
            <el-col :span="6">
                <el-card>
                    <div class="grid-content">
                        <div class="grid-cont-center">
                            <div class="grid-num">{{songCount}}</div>
                            <div>歌曲总数</div>
                        </div>
                    </div>
                </el-card>
            </el-col>
            <el-col :span="6">
                <el-card>
                    <div class="grid-content">
                        <div class="grid-cont-center">
                            <div class="grid-num">{{singerCount}}</div>
                            <div>歌手数量</div>
                        </div>
                    </div>
                </el-card>
            </el-col>
            <el-col :span="6">
                <el-card>
                    <div class="grid-content">
                        <div class="grid-cont-center">
                            <div class="grid-num">{{songListCount}}</div>
                            <div>歌单数量</div>
                        </div>
                    </div>
                </el-card>
            </el-col>
        </el-row>
        <el-row :gutter="20" class="mgb20">
            <el-col :span="12">
                <h3 class="mgb20">用户性别比例</h3>
                <div style="background-color:white">
                    <ve-pie :data="consumerSex" :theme="options"></ve-pie>
                </div>
            </el-col>
            <el-col :span="12">
                <h3 class="mgb20">歌曲类型分布</h3>
                <div style="background-color:white">
                    <ve-histogram :data="songStyle"></ve-histogram>
                </div>
            </el-col>
        </el-row>
        <el-row :gutter="20" class="mgb20">
            <el-col :span="12">
                <h3 class="mgb20">歌手性别比例</h3>
                <div style="background-color:white">
                    <ve-pie :data="singerSex"></ve-pie>
                </div>
            </el-col>
            <el-col :span="12">
                <h3 class="mgb20">歌手国籍分布</h3>
                <div style="background-color:white">
                    <ve-histogram :data="country" :theme="options1"></ve-histogram>
                </div>
            </el-col>
        </el-row>
    </div>
</template>
<script>
import {getAllConsumerNoParams,alltAllSongNoParams,allSinger,getAllSongList} from '../api/index';
export default {
    
    data(){
        return {
            consumerCount: 0,       //用户总数
            songCount: 0,           //歌曲总数
            singerCount: 0,         //歌手数量
            songListCount: 0,        //歌单数量
            consumer: [],            //所有用户
            songList: [],           //歌单数据
            singer: [],             //歌手数据
            // otherCountrySingers: 1,  //其他国家歌手数
            consumerSex:{           //按性别分类的用户数
                columns: ['性别','总数'],
                rows: [
                    {'性别': '男','总数': 0},
                    {'性别': '女','总数': 0}
                ]
            },
            options: {
                color: ['#87cefa','#ffc0cb']
            },
            options1: {
                color: ['yellow']
            },
            songStyle:{           //按歌单风格分类
                columns: ['风格','总数'],
                rows: [
                    {'风格': '华语','总数': 0},
                    {'风格': '粤语','总数': 0},
                    {'风格': '欧美','总数': 0},
                    {'风格': '日韩','总数': 0},
                    {'风格': '摇滚','总数': 0},
                    {'风格': '民谣','总数': 0},
                    {'风格': '流行','总数': 0},
                    {'风格': '其他','总数': 0}
                ]
            },
            singerSex:{           //按性别分类的歌手数
                columns: ['性别','总数'],
                rows: [                    
                    {'性别': '女','总数': 0},
                    {'性别': '男','总数': 0},
                    {'性别': '组合','总数': 0},
                    {'性别': '不明','总数': 0}
                ]
            },
            country:{
                columns: ['国籍','总数'],
                rows: [
                    {'国籍': '中国','总数': 0},
                    {'国籍': '韩国','总数': 0},
                    {'国籍': '日本','总数': 0},
                    {'国籍': '美国','总数': 0},
                    {'国籍': '英国','总数': 0},
                    {'国籍': '法国','总数': 0},
                    // {'国籍': '其他','总数': 0}                    
                ]
            },
        }
    },
    created() {
       this.getSinger();

    },
    mounted() {
        this.getConsumer();
        this.getSong();
        this.getSongList();
    },
    methods: {
        getConsumer() {              //用户总数
            getAllConsumerNoParams().then(res => {
                this.consumer = res.data
                this.consumerCount = res.total
                this.consumerSex.rows[0]['总数'] = this.setSex(1,this.consumer);
                this.consumerSex.rows[1]['总数'] = this.setSex(0,this.consumer);
            })
        },  
        setSex(sex,val) {              //根据性别获取用户数
            let count = 0;
            for(let item of val){
                if(sex == item.sex){
                    count++;
                }
            }
            return count;
        },
        getSong() {                      //歌曲总数
            alltAllSongNoParams().then(res => {
                this.songCount = res.total;
            })
        },
        getSinger() {                      //歌手数量
            allSinger().then(res => {
                this.singer = res.data
                this.singerCount = res.total;
                this.singerSex.rows[0]['总数'] = this.setSex(0,this.singer);
                this.singerSex.rows[1]['总数'] = this.setSex(1,this.singer);
                this.singerSex.rows[2]['总数'] = this.setSex(2,this.singer);
                this.singerSex.rows[3]['总数'] = this.setSex(3,this.singer);
               
                this.getByCountry(res.data);
                              
            })
        },

        getSongList() {                    //歌单数量
            getAllSongList().then(res => {
                this.songListCount = res.total;
                this.songList = res.data;
                for(let item of this.songList){
                    this.getByStyle(item.style);
                }
            })
        },  
        getByStyle(style) {              //根据歌单风格获取数量
            // var styleList = style.split(',')
            for(let item of this.songStyle.rows){
                if(style.includes(item['风格'])){
                    item['总数']++;
                }
                if(style.includes(item['其他'])){
                    item['总数']++;
                }
            }
        },
        getByCountry(data) {              //根据国籍获取数量
                let a=0
                data.map(it=>{
                   this.country.rows.map(itt=>{
                        if(it.location.includes(itt['国籍'])){
                            itt['总数']++
                        }else{
                          
                        }
                    })
                })
                var array=this.country.rows.map(it=>{
                    return it['总数']
                })
                console.log(array)
                var sum = array.reduce(function(pre, cur, index, array) {
                    return pre+cur;
                });
                a=data.length-sum
                this.country.rows.push( {'国籍': '其他','总数': a},)
               
        }
    }
}

</script>

<style scoped>
.grid-content {
    display: flex;
    align-items: center;
    height: 50px;
}

.grid-cont-center {
    flex: 1;
    text-align: center;
    font-size: 14px;
    color: darkgray;
}

.grid-num {
    font-size: 30px;
    font-weight: bold;
}
</style>