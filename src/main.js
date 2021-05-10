import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'
import VeeValidate from 'vee-validate'
import 'material-design-icons-iconfont'



Vue.config.productionTip = false
Vue.use(VeeValidate) //ใช้งาน validate form 

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
