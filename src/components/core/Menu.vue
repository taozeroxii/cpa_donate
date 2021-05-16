<template>
  <v-navigation-drawer app permanent dense dark class="responsesive">
    <template v-slot:prepend>
      <v-list-item two-line>
        <!-- <v-list-item-avatar>
          <img src="https://randomuser.me/api/portraits/women/81.jpg" />
        </v-list-item-avatar> -->

        <v-list-item-content>
          <v-list-item-title>CPA Donate Hospital</v-list-item-title>
          <v-list-item-subtitle
            >รับบริจาค รพ.เจ้าพระยาอภัยภูเบศร</v-list-item-subtitle
          >
        </v-list-item-content>
      </v-list-item>
    </template>

    <v-divider></v-divider>

    <v-list dense>
      <v-list-item-group v-model="selectedMenu" mandatory>
        <v-list-item
          class="tile"
          v-for="([icon, text, route], index) in menus"
          :key="index"
          link
          @click="onClickMenu(route)"
        >
          <v-list-item-icon>
            <v-icon> {{ icon }} </v-icon>
          </v-list-item-icon>

          <v-list-item-content> {{ text }}</v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  name: "Menu",
  data() {
    return {
      selectedMenu: 0,
      menus: [
        ["mdi-home-city", "หน้าหลัก", "/"],
        ["mdi-chart-line", "Dashboard", "/dashboard"],
        ["mdi-folder-multiple", "Report", "/report"],
        ["mdi-account-group-outline", "about", "/about"],
      ],
    };
  },
  methods: {
    onClickMenu(link) {
      this.$router.push(link).catch(() => {});
    },
  },
};
</script>

<style>
@media only screen and (max-width: 600px) {
  .responsesive {
    width: 60px !important;
  }
  .v-main {
    padding: 48px 0px 0px 60px !important;
  }
  .v-sheet.theme--light.v-toolbar.v-toolbar--dense.v-app-bar.v-app-bar--fixed.accent-4{
   left:60px !important;
  }
}
</style>
