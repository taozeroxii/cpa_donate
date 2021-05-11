import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogged: false,
    user:null
  },
  mutations: {
    set_user:(state,user)=> {state.user = user , state.isLogged = true}
  },
  actions: {
    get_user_login:({commit})=>axios.post('api/account/getUserLogin').then(res =>commit('set_user',res.data ))
  },
  modules: {
  }
})
