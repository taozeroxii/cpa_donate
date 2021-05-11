<template>
  <div id="Header">
    <v-app-bar color="accent-4" app dense>
      <v-btn icon @click="onClickMenu()"> <v-icon>mdi-home</v-icon></v-btn>

      <v-toolbar-title>version.{{ version }}</v-toolbar-title>

      <v-spacer></v-spacer>
      <span>สวัสดี :  {{this.$store.state.use ? 'Guest':this.$store.state.user.pname+' '+this.$store.state.user.fname+' '+this.$store.state.user.lname}}</span>
      <v-btn icon @click="Logout()"> <v-icon>mdi-export</v-icon></v-btn>
    </v-app-bar>
  </div>
</template>
<script>
import axios from "axios"
export default {
  name: "Header",
  computed: {
    version() {
      return "1.0";
    },
  },
  methods: {
    onClickMenu() {
      this.$router.push('/home').catch(() => {});
    },
    Logout() {
      axios.post('api/account/logout').then((response)=>{
        console.log(response.data.message);
        this.$router.push('/login').catch(() => {});
      }).catch((err) => {
         console.log(err.response.data.message);
      });
    },
  },
};
</script>

<style></style>
