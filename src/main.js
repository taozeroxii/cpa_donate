import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import VeeValidate from 'vee-validate'
import store from './store' //ต้อง import store ก่อน router ไม่เช่นนั้นค่าในstore จะไม่มา
import router from './router'
import 'material-design-icons-iconfont'
import Vue2filters from "vue2-filters"


//impoer alertify มาใช้งานการแสดง alert ล่างขวาจอ
import  'alertifyjs/build/css/alertify.css'
import  'alertifyjs/build/css/themes/default.css'
import * as alertify from 'alertifyjs'

Vue.config.productionTip = false
Vue.use(VeeValidate) //ใช้งาน validate form 
Vue.use(Vue2filters)
Vue.prototype.alertify = alertify // กำหนดให้ alertify เป็นชื่อการเรียกใช้ function alertify

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
