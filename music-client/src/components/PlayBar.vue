<template>
    <div class="play-bar" :class="{show:!toggle}">
        <div @click="toggle=!toggle" class="item-up" :class="{turn: toggle}">
            <svg class="icon">
                <use xlink:href="#icon-jiantou-xia-cuxiantiao"></use>
            </svg>
        </div>
        <div class="kongjian">
            <!-- 上一首 -->
            <div class="item" @click="prev">
                <svg class="icon">
                    <use xlink:href="#icon-ziyuanldpi"></use>
                </svg>
            </div>
            <!-- 播放 -->
            <div class="item" @click="togglePlay">
                <svg class="icon">
                    <use :xlink:href="playButtonUrl"></use>
                </svg>
            </div>
            <!-- 下一首 -->
            <div class="item" @click="next">
                <svg class="icon">
                    <use xlink:href="#icon-ziyuanldpi1"></use>
                </svg>
            </div>
            <!-- 歌曲图片 -->
            <div class="item-img" @click="toLyric">
                <img :src="picUrl" style="cursor:pointer;"/>
            </div>
            <!-- 播放进度 -->
            <div class="playing-speed">
                <!-- 播放开始时间 -->
                <div class="current-time">{{nowTime}}</div>
                <div class="progress-box">
                    <div class="item-song-title">
                        <div>{{this.title}}</div>
                        <div>{{this.artist}}</div>
                    </div>
                    <div ref="progress" class="progress1" @mousemove="mousemove">
                        <!-- 进度条 -->
                        <div ref="bg" class="bg" @click="updatemove">
                            <div ref="curProgress" class="cur-progress" :style="{width:curLength+'%'}"></div>
                        </div>
                        <!-- 拖动的点点 -->
                        <div ref="idot" class="idot" :style="{left:curLength+'%'}" @mousedown="mousedown" @mouseup="mouseup"></div>
                    </div>
                </div>
                <!-- 播放结束时间 -->
                <div class="left-time">{{songTime}}</div>
                <!-- 播放顺序 -->
                <div class="item" @click="changePlayMethod(playMethod)">
                    <svg class="icon" v-if="playMethod == '列表循环'">
                        <image xlink:href = "../assets/img/icon/sequence.png" 
                            style="width: 80%; height: 80%;"></image>
                    </svg>
                    <svg class="icon" v-if="playMethod == '单曲循环'">
                        <image xlink:href = "../assets/img/icon/circulation.png" 
                            style="width: 80%; height: 80%;"></image>
                    </svg>
                    <svg class="icon" v-if="playMethod == '随机播放'">
                        <image xlink:href = "../assets/img/icon/random.png" 
                            style="width: 80%; height: 80%;"></image>
                    </svg>
                </div>
                <!-- 音量 -->
                <div class="item item-volume">
                    <svg v-if="volume == 0" class="icon">
                        <use xlink:href="#icon-yinliangjingyinheix"></use>
                    </svg>
                    <svg v-else class="icon">
                        <use xlink:href="#icon-yinliang1"></use>
                    </svg>
                    <el-slider class="volume" v-model="volume" :vertical="true"></el-slider>
                </div>
                <!-- 收藏 -->
                <div class="item" @click="collection">
                    <svg :class="{active:isActive}" class="icon">
                        <use xlink:href="#icon-xihuan-shi"></use>
                    </svg>
                </div>
                <!-- 下载 -->
                <div class="item" @click="download">
                    <svg class="icon">
                        <use xlink:href="#icon-xiazai"></use>
                    </svg>
                </div>
                <!-- 当前播放的歌曲列表 -->
                <div class="item" @click="changeAside">
                    <svg class="icon">
                        <use xlink:href="#icon-liebiao"></use>
                    </svg>
                </div>
                
            </div>
        </div>
    </div>
</template>
<script>
import {mapGetters} from 'vuex';
import { download,setCollect,increasePlayCount,getACollect, createPlayHistory, createDownloadHistory } from '../api/index';

export default {
    name: 'play-bar',
    data(){
        return {
            nowTime: '00:00',        //当前播放进度的时间
            songTime: '00:00',        //当前歌曲总时间
            curLength: 0,            //进度条的位置
            progressLength: 0,      //进度条的总长度
            mouseStartX:    0,      //拖拽开始位置
            tag: false,             //拖拽开始结束的标志，当开始拖拽，它的值才会变成true
            volume: 30,             //音量，默认20
            toggle: true,            //显示隐藏播放器页面
            openLyric: false,    //歌词是否打开
            collect: {},         //收藏对象
            playMethods: ['列表循环', '单曲循环', '随机播放'],       //播放方式（列表循环、单曲循环、随机播放） 
            playMethod: '列表循环',       //默认播放方式   
            randomIndex: 1,              //随机播放前一首被随机的歌曲在播放列表中的位置  
        }
    },
    computed: {
        ...mapGetters([
            'id',               //歌曲id
            'lyric',               //歌词
            'url',              //歌曲地址
            'isPlay',           //播放状态
            'playButtonUrl',   //播放状态的图标
            'picUrl',            //正在播放的音乐的图片
            'title',                  //歌名
            'artist',                 //歌手名
            'duration',                //音乐时长
            'curTime',                //当前音乐的播放位置
            'showAside',            //是否显示播放中的歌曲列表
            'listIndex',            //当前歌曲在歌单中的位置
            'listOfSongs',          //当前歌单列表
            'autoNext',             //自动播放下一首
            'loginIn',              //用户是否已登录
            'userId',               //当前登录用户的id
            'isActive',             //当前播放的歌曲是否已收藏
        ])
    },
    watch:{
        //切换播放状态的图标
        isPlay() {
             if(this.isPlay){
                this.$store.commit('setPlayButtonUrl', '#icon-zanting');
            }else{
                this.$store.commit('setPlayButtonUrl', '#icon-bofang');
            }
        },
        curTime(){
            this.nowTime = this.formatSeconds(this.curTime);
            this.songTime = this.formatSeconds(this.duration);
            this.curLength = (this.curTime / this.duration) *100;
        },
        //音量变化
        volume(){
            this.$store.commit('setVolume',this.volume / 100);
        },
        //自动播放下一首
        autoNext(){
            this.next();
        },
    },
    mounted(){
        this.progressLength = this.$refs.progress.getBoundingClientRect().width;
        document.querySelector('.item-volume').addEventListener('click',function(e){
            document.querySelector('.volume').classList.add('show-volume');
            e.stopPropagation();
        },false);
        document.querySelector('.volume').addEventListener('click',function(e){
            e.stopPropagation();
        },false);
        document.addEventListener('click',function(){
            document.querySelector('.volume').classList.remove('show-volume');
        },false);
        this.playNum = JSON.parse(sessionStorage.getItem('playNum'));
    },
    methods: {
        //切换播放顺序
        changePlayMethod(playMethod){
            if(playMethod == '列表循环'){
                this.playMethod = this.playMethods[1];
                this.notify('切换到单曲循环','success');
            }
            if(playMethod == '单曲循环'){
                this.playMethod = this.playMethods[2];
                this.notify('切换到随机播放','success');
            }
            if(playMethod == '随机播放'){
                this.playMethod = this.playMethods[0];
                this.notify('切换到列表循环','success');
            }
        },

        //提示信息
        notify(title,type) {
            this.$notify({
                title: title,
                type: type
            })
        },
        //控制音乐播放、暂停
        togglePlay() {
            if(this.isPlay){
                this.$store.commit('setIsPlay', false);
            }else{
                this.$store.commit('setIsPlay', true);
            }
        },
        //解析时间
        formatSeconds(value){
            let theTime = parseInt(value);
            let result = '';    //返回值
            let hour = parseInt(theTime / 3600);    //小时
            let minute = parseInt((theTime / 60) % 60); //分钟
            let second = parseInt(theTime % 60);        //秒
            if(hour > 0){
                if(hour < 10){
                    result = '0' + hour + ":";
                }else{
                    result = hour + ":";
                }
            }
            if(minute > 0){
                if(minute < 10){
                    result += "0" + minute + ":";
                }else{
                    result += minute + ":";
                }
            }else{
                result += "00:";
            }
            if(second > 0){
                if(second < 10){
                    result += "0" + second;
                }else{
                    result += second;
                }
            }else{
                result += "00";
            }
            return result;
        },
        //拖拽开始
        mousedown(e){
            this.mouseStartX = e.clientX;
            this.tag = true;
        },
        //拖拽结束
        mouseup(){
            // $(this).unbind('mousemove'); //移除鼠标的移动事件
            this.tag = false;
        },
        //拖拽中
        mousemove(e){
            if(!this.duration){
                return false;
            }
            if(this.tag){
                let movementX = e.clientX - this.mouseStartX;       //点点移动的距离
                let curLength = this.$refs.curProgress.getBoundingClientRect().width;
                let newPercent = ((movementX+curLength)/this.progressLength)*100;
                if(newPercent>100){
                    newPercent = 100;
                }
                this.curLength = newPercent;
                this.mouseStartX = e.clientX;
                this.changeTime(newPercent);
            }
        },
        //更改歌曲进度
        changeTime(percent){
            let newCurTime = (percent*0.01)* this.duration;
            this.$store.commit('setChangeTime',newCurTime);
        },
        //点击播放条切换播放进度
        updatemove(e){
            if(!this.tag){
                //进度条的左侧坐标
                let curLength = this.$refs.bg.offsetLeft;
                let newPercent = ((e.clientX - curLength) / this.progressLength) * 100;
                if(newPercent>100){
                    newPercent = 100;
                }else if(newPercent<0){
                    newPercent = 0;
                }
                this.curLength = newPercent;
                this.changeTime(newPercent);
            }
        },
        //显示播放中的歌曲列表
        changeAside(){
            this.$store.commit('setShowAside',true);
        },
        //上一首
        prev(){
            if(this.playMethod == '列表循环'){
                if(this.listIndex != -1 && this.listOfSongs.length > 1){    //当前处于不可能状态或者只有只有一首音乐的时候不执行）
                    if(this.listIndex > 0){                                 //不是第一首音乐
                        this.$store.commit('setListIndex',this.listIndex - 1);  //直接返回上一首
                    }else{                                                  //当前是第一首音乐
                        this.$store.commit('setListIndex',this.listOfSongs.length - 1);  //切换到倒数第一首
                    }
                    this.toplay(this.listOfSongs[this.listIndex].songUrl);
                }
            }
            if(this.playMethod == '单曲循环'){
                if(this.listIndex != -1){    //当前处于不可能状态的时候不执行）
                    // this.$store.commit('setListIndex',this.listIndex);  //循环
                    this.$store.commit('setIsPlay', true);
                    this.toplay(this.listOfSongs[this.listIndex].songUrl);
                }
            }
            if(this.playMethod == '随机播放'){
                if(this.listIndex != -1 && this.listOfSongs.length > 1){    //当前处于不可能状态或者只有只有一首音乐的时候不执行）
                    var randomIndex = Math.round(Math.random()*this.listOfSongs.length)   // 生成随机整数
                    if(randomIndex == this.randomIndex){
                        randomIndex = Math.round(Math.random()*this.listOfSongs.length)   // 和上一次生成的随机数相同就重新生成
                    }
                    this.randomIndex = randomIndex; //将本次随机数存储起来，如果下次一样，就重新随机
                    this.$store.commit('setListIndex',randomIndex);  //随机播放
                    this.toplay(this.listOfSongs[this.listIndex].songUrl);
                }
            }
            
        },
        //下一首
        next(){
            if(this.playMethod == '列表循环'){
                if(this.listIndex != -1 && this.listOfSongs.length > 1){    //当前处于不可能状态或者只有只有一首音乐的时候不执行）
                    if(this.listIndex < this.listOfSongs.length - 1){                                 //不是最后一首音乐
                        this.$store.commit('setListIndex',this.listIndex + 1);  //直接返回下一首
                    }else{                                                      //当前是最后一首音乐
                        this.$store.commit('setListIndex',0);  //切换到第一首
                    }
                    this.toplay(this.listOfSongs[this.listIndex].songUrl);
                }
            }
            if(this.playMethod == '单曲循环'){
                if(this.listIndex != -1){    //当前处于不可能状态的时候不执行）
                    // this.$store.commit('setListIndex',this.listIndex);  //循环
                    this.$store.commit('setIsPlay', true);
                    this.toplay(this.listOfSongs[this.listIndex].songUrl);
                }
            }
            if(this.playMethod == '随机播放'){
                if(this.listIndex != -1 && this.listOfSongs.length > 1){    //当前处于不可能状态或者只有只有一首音乐的时候不执行）
                    var randomIndex = Math.round(Math.random()*this.listOfSongs.length)   // 生成随机整数
                    if(randomIndex == this.randomIndex){
                        randomIndex = Math.round(Math.random()*this.listOfSongs.length)   // 和上一次生成的随机数相同就重新生成
                    }
                    this.randomIndex = randomIndex; //将本次随机数存储起来，如果下次一样，就重新随机
                    this.$store.commit('setListIndex',randomIndex);  //随机播放
                    this.toplay(this.listOfSongs[this.listIndex].songUrl);
                }
            }
            
        },
        //播放音乐
        toplay: function(songUrl){
                this.$store.commit('setId',this.listOfSongs[this.listIndex].songId);
                this.$store.commit('setUrl',this.$store.state.configure.HOST+songUrl);
                this.$store.commit('setPicUrl',this.$store.state.configure.HOST+this.listOfSongs[this.listIndex].songPic);
                this.$store.commit('setTitle',this.listOfSongs[this.listIndex].songName);
                this.$store.commit('setArtist',this.listOfSongs[this.listIndex].singerName);
                this.$store.commit('setLyric',this.parseLyric(this.listOfSongs[this.listIndex].songLyric));
                this.$store.commit('setIsActive',false);
                //查询歌曲收藏状态
                this.getACollectStatus(this.listOfSongs[this.listIndex].songId)
                //根据歌曲id, 将歌曲的播放量增加1
                this.increasePlayback(this.listOfSongs[this.listIndex].songId);
                //生成播放记录
                this.addPlayHistory(this.listOfSongs[this.listIndex].songId)
        },
        //解析歌词
        parseLyric(text){
            let lines = text.split("\n");                   //将歌词按行分解成数组
            let pattern = /\[\d{2}:\d{2}.(\d{3}|\d{2})\]/g; //时间格式的正则表达式
            let result = [];                                //返回值
            //对于歌词格式不对的直接返回
            if(!(/\[.+\]/.test(text))){
                return [[0,text]]
            }        
            //去掉前面格式不正确的行
            while(!pattern.test(lines[0])){
                lines = lines.slice(1);
            }
            //遍历每一行，形成一个每行带着俩元素的数组，第一个元素是以秒为计算单位的时间，第二个元素是歌词
            for(let item of lines){
                let time = item.match(pattern);  //存前面的时间段
                let value = item.replace(pattern,'');//存后面的歌词
                for(let item1 of time){
                    let t = item1.slice(1,-1).split(":");   //取出时间，换算成数组
                    if(value!=''){
                        result.push([parseInt(t[0],10)*60 + parseFloat(t[1]),value]);
                    }                    
                }                
            }
            //按照第一个元素--时间--排序
            result.sort(function(a,b){
                return a[0] - b[0];
            });
            return result;
        },
        //转向歌词页面
        toLyric(){
            if(this.openLyric == false){
                this.$router.push({path: `/lyric`});
                this.openLyric = true;
            }else{
                this.$router.go(-1);
                this.openLyric = false;
            }
        },
        //传递歌词到歌词页面
        // toLyricWithLyric(lyric){
        //     this.$router.push({path: `/lyric`,query:{lyric}});
        // },
        //下载音乐
        download() {
            download(this.url)
            .then(res=>{
                let content = res.data;
                let eleLink = document.createElement('a');
                eleLink.download = `${this.artist}-${this.title}.mp3`;
                eleLink.style.display = 'none';
                //把字符内容转换成blob地址
                let blob = new Blob([content]);
                eleLink.href = URL.createObjectURL(blob);
                //把链接地址加到document里
                document.body.appendChild(eleLink);
                //触发点击
                eleLink.click();
                //然后移除掉这个新加的控件
                document.body.removeChild(eleLink);
                //添加下载记录
                // console.log(this.id, this.userId)
                this.addDownloadHistory(this.userId, this.id)
                
            })
            .catch(err =>{
                console.log(err);
            })
        },
        //查询歌曲收藏状态
        getACollectStatus(songId){            
            getACollect(this.userId, songId)
                .then(res =>{
                    if(res == '1'){ //未收藏
                        this.$store.commit('setIsActive',false);
                    }else if(res == '2'){ //已收藏
                        this.$store.commit('setIsActive',true);
                    }else{
                        this.notify(res,'error');
                    }
                })           
        },
        //根据歌曲id，将歌曲播放量+1
        increasePlayback(songId){
            increasePlayCount(songId);
        },

        //根据用户id和歌曲id，生成播放记录
        addPlayHistory(songId){
            createPlayHistory(this.userId, songId);
        },


        //创建下载记录
        addDownloadHistory(userId,songId){
            createDownloadHistory(userId,songId)
                .then(res =>{
                    // if(res == '1'){ //已添加
                    //     this.$store.commit('setIsActive',false);
                    // }else if(res == '2'){ //已收藏
                    //     this.$store.commit('setIsActive',true);
                    // }else{
                    //     this.notify(res,'error');
                    // }
                    // console.log('下载中...')
                }) 
        },
        
        //收藏
        collection() {
            if(this.loginIn){
                // var params = new URLSearchParams();
                // params.append('userId',this.userId);
                // params.append('type',0);
                // params.append('songId',this.id);
                this.collect.userId = this.userId;
                this.collect.type = 0;
                this.collect.songId = this.id;
                var collect1 = this.collect;
                setCollect(collect1)
                    .then(res =>{
                        if(res.code == 1){
                            this.$store.commit('setIsActive',true);
                            this.notify(res.message,'success');
                        }else if(res.code == 2){
                            this.$store.commit('setIsActive',false);
                            this.notify(res.message,'success');
                        }else{
                            this.notify(res.message,'error');
                        }
                    })
            }else{
                this.notify('请先登录','warning');
            }
        }
    }
}
</script>
<style  lang="scss" scoped>
@import '../assets/css/play-bar.scss';
</style>
