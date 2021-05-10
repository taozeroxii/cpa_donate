<template>
  <v-card ripple id="StockCard"   @click="onClickMenu(menulink)">
    <v-list-item two-line>
      <v-list-item-content>
        <v-list-item-title class="headline mb-1">{{ title }}. </v-list-item-title>
        <v-list-item-subtitle class="title">{{ subtitle }}</v-list-item-subtitle>
      </v-list-item-content>

      <v-list-item-avatar tile size="80" :color="avatar_bg">
        <v-icon color="white"> {{ avatar_ic }} </v-icon>
      </v-list-item-avatar>
    </v-list-item>
  </v-card>
</template>

<script>
export default {
  name: "menuCard",
  props: ["title", "subtitle", "avatar_bg", "avatar_ic","menulink"],
  menulinks:"",
  methods: {
    onClickMenu(menulink){     
      console.log(menulink)
      this.$router.push(menulink).catch(()=>{});
    }
  },
};
</script>

<style></style>
