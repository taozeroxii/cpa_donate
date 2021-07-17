import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogged: false,
    user:{
      default_role: null,
      default_role_name: null,
      fname: null,
      id: null,
      isuse: null,
      lname: null,
      pname: null,
      staff_update: null,
      username: null
    }
  },
  mutations: {
    set_user:(state,user)=> state.user = user 
  },
  actions: {
    get_user_login:({commit})=> axios.post('/api/account/getUserLogin').then(res =>commit('set_user',res.data )),
    // get_user_login_edit:({commit})=> axios.post('/api/account/getUserLogin').then(res =>commit('set_user',res.data )),
  },
  getters: {
    get_name(state) {
      return state.user.pname+''+state.user.fname+' '+state.user.lname+' สิทธิการเข้าถึง : '+state.user.default_role_name;
    },
    getuser_role(state){
      return state.user.default_role;
    }
  },
  modules: {
  }
})
