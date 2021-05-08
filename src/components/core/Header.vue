<template>
  <div id="Header">
    <v-app-bar color="accent-4" app dense >
      <!-- <v-app-bar-nav-icon ></v-app-bar-nav-icon> -->

      <v-toolbar-title>version.{{ version }}</v-toolbar-title>

      <v-spacer></v-spacer>
      <span>Username: none</span>
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
};
</script>

<style></style>
