<template>
  <div id="Header">
    <v-app-bar color="accent-4" app dense>
      <v-btn icon @click="onClickMenu(route)"> <v-icon>mdi-home</v-icon></v-btn>

      <v-toolbar-title>version.{{ version }}</v-toolbar-title>

      <v-spacer></v-spacer>
      <span>คุณ: none</span>
      <v-btn icon> <v-icon>mdi-export</v-icon></v-btn>
    </v-app-bar>
  </div>
</template>
<script>
export default {
  name: "Header",
  computed: {
    version() {
      return "1.0";
    },
  },
  methods: {
    onClickMenu() {
      this.$router.push('/').catch(() => {});
    },
  },
};
</script>

<style></style>
