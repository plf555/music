<template>
    <div class="my-music">
        <div>
          <p id="title">留 言 板</p>
          <p id="title-s">在此提出您宝贵的意见或建议</p>
        </div>
        <el-form ref="form" :model="form" label-width=50% id="message-form">
            <el-form-item label="留言内容">
                <el-input v-model="form.content" type="textarea" :rows="10" placeholder="请输入内容"></el-input>
            </el-form-item>
            <el-form-item label="留言类型">
                <el-select v-model="form.type" placeholder="请选择留言类型">
                    <el-option label="网站建议" value="网站建议"></el-option>
                    <el-option label="问题反馈" value="问题反馈"></el-option>
                    <el-option label="补充资源" value="补充资源"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="联系方式">
                <el-input v-model="form.contact" placeholder="请输入您的联系方式（可选）"></el-input>
            </el-form-item>

            <el-form-item>
                <el-button type="primary" @click="onSubmit">提交留言</el-button>
                <el-button>取消</el-button>
            </el-form-item>
          </el-form>
    </div>
</template>

<script>
import {mixin} from '../mixins';
import {mapGetters} from 'vuex';
import {addMessage} from '../api/index';

export default {
    name: 'leave-message',
    mixins: [mixin],
    data() {
      return {
        message: {},        //留言对象
        form: {
          content: '',
          type: '',
          contact: ''
        }        
      }
    },
    methods: {
      onSubmit(){
        this.message.content = this.form.content;
        this.message.type = this.form.type;
        this.message.contact = this.form.contact;
        var message = this.message;
        console.log(message);
        addMessage(message)
            .then(res => {
                if(res.code == 1){
                    if(this.form.type == '网站建议'){
                        this.notify('收到您的建议，我们将视情况进行采纳','success');
                    }else if(this.form.type == '问题反馈'){
                        this.notify('谢谢您向我们反馈问题，我们将尽快处理','success');this.form = {}
                    }else{
                        this.notify('谢谢您的来信，我们将尽快补充对应资源','success');
                    }
                    this.form = {}
                }else{
                    this.notify(res.message,'error');
                }
            })
            .catch(err =>{
                this.notify('出现异常','error');
            })
        },
    }
}
</script>

<style lang="scss" scoped>
@import '../assets/css/my-music.scss';
#message-form{
  width: 70%;
  height: 500px;
}
#title{
  font-size: 60px;
  position: absolute;
  margin-top: -6%;
  margin-left: 20%;
  font-style: italic;
  color: #fcd9ee;
}
#title-s{
  font-size: 15px;
  position: absolute;
  margin-top: -2%;
  margin-left: 20%;
  color: gray;
}
</style>