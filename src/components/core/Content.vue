<template>
  <v-main>
    <div id="core-view">
      <v-fade-transition mode="out-in">
        <router-view></router-view>
      </v-fade-transition>
    </div>
  </v-main>
</template>

<script>
export default {
  name:"Content",
  
};
</script>

<style></style>
