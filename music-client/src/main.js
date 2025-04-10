import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store/index'
import './assets/css/index.scss'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import '@/assets/js/iconfont.js'
import '@/assets/js/iconfont1.js'
import '@/assets/js/iconfont2.js'
import '@/assets/js/iconfont3.js'
import QRCode from 'qrcodejs2'
// import $ from 'jquery'
// import 'bootstrap/dist/js/bootstrap.js'
// import 'bootstrap/dist/css/bootstrap.css'
Vue.prototype.$QRCode = function()
{
  let qrcode = new QRCode('qrcode', {
    width: 232,  // 设置宽度
    height: 232, // 设置高度
    text: '12345',
  });
};
Vue.use(ElementUI)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
