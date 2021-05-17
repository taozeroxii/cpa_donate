<template>
  <div id="Header">
    <v-app-bar color="accent-4" app dense>
      <!-- <v-btn icon @click="onClickMenu()"> <v-icon>mdi-home</v-icon></v-btn> -->
      <v-toolbar-title>version.{{ version }}</v-toolbar-title>
      <v-spacer></v-spacer>
      <span >สวัสดี : {{this.$store.getters.get_name === 'nullnull null' ? "Guest" : this.$store.getters.get_name }}</span>
      <v-btn icon @click="Logout()"> <v-icon>mdi-export</v-icon></v-btn>
    </v-app-bar>
  </div>
</template>
<script>
import axios from "axios"
export default {
  name: "Header",
  data() {
    return {
     a:null,path:""
    }
  },
  computed: {
    version() {
      return "1.0";
    },
  },
  methods: {
    Logout() {
      this.path =   './api/account/logout';
      if(this.$router.currentRoute.name === 'EditUser')  this.path = '../../api/account/logout'; 
      axios.post(this.path).then((response)=>{
        console.log(response.data.message);
        this.$store.commit("set_user", null);
        this.$router.push('/login').catch(() => {});
      }).catch((err) => {
         console.log(err.response.data.message);
      });
    },
  },
  mounted() {
    //  console.log(this.$store.getters.get_name)
  },
};
</script>

<style></style>
