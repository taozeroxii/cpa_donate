<template>
  <div id="menuCard">
    <v-expansion-panels>
      <v-expansion-panel
        v-for="(item, i) in menumain"
        :key="i"
        @click="showSubmenu(item.main_id)"
      >
        <v-expansion-panel-header>
          {{ item.main_name }}
        </v-expansion-panel-header>
        <v-expansion-panel-content>
          <v-list dense>
            <v-list-item
              class="tile"
              v-for="(item, index) in menusss"
              :key="index"
              link
              @click="onClickMenu(item.menu_file)"
            >
              <v-list-item-content> {{ item.menu_sub }}</v-list-item-content>
            </v-list-item>
          </v-list>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
  </div>
</template>

<script>
import Axios from "axios";
export default {
  name: "menuCard",
  data() {
    return {
      menumain: "",
      menusss: "",
      rout: "",
    };
  },
  async mounted() {
    // console.log("menu");
    await  Axios.get("http://localhost:3000/api/menu").then((result) => {
      //console.log(JSON.stringify(result.data));
      this.menumain = result.data;
    });
  },
  methods: {
    async showSubmenu(id) {
     await Axios.get(`http://localhost:3000/api/menu/submenu/${id}`).then(
        (result) => {
          // console.log(JSON.stringify(result.data));
          this.menusss = result.data;
        }
      );
    },
    onClickMenu(link){
      this.$router.push(`/tableshowdata/${link}`)
    }
  },
};
</script>

<style></style>
