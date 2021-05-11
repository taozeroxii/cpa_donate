<template>
  <v-app>
    <Header v-if="this.$route.name!='login'"/>
    <Menu   v-if="this.$route.name!='login'" />
    <Content />
  </v-app>
</template>
 
<script>
import Header from "@/components/core/Header";
import Menu from "@/components/core/Menu";
import Content from "@/components/core/Content";
export default {
  name: "App",
  components: {
    Header,
    Menu,
    Content,
  },
   mounted() {
    // this.$store.dispatch({type:"restoreLogin"});
  }

};
</script>

<style></style>
