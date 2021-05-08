<template>
  <v-container>
    <form @submit.prevent="submitForm()">
      <v-row>
        <v-col cols="12" sm="6" md="6" lg="6">
          <v-menu
            ref="menu1"
            v-model="datepicker1"
            :close-on-content-click="false"
            :return-value.sync="form.date1"
            transition="scale-transition"
            offset-y
            min-width="auto"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="form.date1"
                label="เลือกวันที่เริ่ม"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker v-model="form.date1" no-title scrollable>
              <v-spacer></v-spacer>

              <v-btn text color="primary" @click="$refs.menu1.save(form.date1)">
                OK
              </v-btn>
            </v-date-picker>
          </v-menu>
          <!-- <p>
            วันที่เริ่มต้น: <strong>{{ form.date1 }}</strong>
          </p> -->
        </v-col>

        <v-col cols="12" sm="6" md="6" lg="6">
          <v-menu
            ref="menu2"
            v-model="datepick2"
            :close-on-content-click="false"
            :return-value.sync="form.date2"
            transition="scale-transition"
            offset-y
            min-width="auto"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="form.date2"
                label="เลือกวันที่สิ้นสุด"
                prepend-icon="mdi-calendar"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-date-picker v-model="form.date2" no-title scrollable>
              <v-spacer></v-spacer>

              <v-btn text color="primary" @click="$refs.menu2.save(form.date2)">
                OK
              </v-btn>
            </v-date-picker>
          </v-menu>
          <!-- <p>
            วันที่สิ้นสุด: <strong>{{ form.date2 }}</strong>
          </p> -->
        </v-col>
      </v-row>

      <v-row style="margin-top:-35px">
        <v-col lg="6">
          <v-select
            v-model="selectedFruits"
            :items="fruits"
            label="โปรดเลือก ward"
            multiple
          >
            <template v-slot:prepend-item>
              <v-list-item ripple @click="toggle">
                <v-list-item-action>
                  <v-icon
                    :color="selectedFruits.length > 0 ? 'indigo darken-4' : ''"
                  >
                    {{ icon }}
                  </v-icon>
                </v-list-item-action>
                <v-list-item-content>
                  <v-list-item-title>
                    เลือกทุกรายการ
                  </v-list-item-title>
                </v-list-item-content>
              </v-list-item>
              <v-divider class="mt-2"></v-divider>
            </template>
            <template v-slot:append-item>
              <v-divider class="mb-2"></v-divider>
              <v-list-item disabled>
                <v-list-item-avatar color="grey lighten-3">
                  <v-icon>
                    mdi-food-apple
                  </v-icon>
                </v-list-item-avatar>

                <v-list-item-content v-if="likesAllFruit">
                  <v-list-item-title>
                    เลือกทุกรายการ
                  </v-list-item-title>
                </v-list-item-content>

                <v-list-item-content v-else-if="likesSomeFruit">
                  <v-list-item-title>
                    ward ที่เลือก
                  </v-list-item-title>
                  <v-list-item-subtitle>
                    {{ selectedFruits.length }}
                  </v-list-item-subtitle>
                </v-list-item-content>

                <v-list-item-content v-else>
                  <v-list-item-title>
                    โปรดเลือก ward ที่ต้องการ
                  </v-list-item-title>
                  <v-list-item-subtitle>
                    สามารถเลือกได้มากกว่า 1 รายการ
                  </v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
            </template>
          </v-select>
        </v-col>
      </v-row>
      <v-btn type="submit" class="success mb-5">ค้นหา</v-btn>
    </form>


    <!-- alert message And progress bar when data is loading's long time -->
    <v-alert v-if="errorMessage!=''" outlined dense type="error"> Error <strong>{{errorMessage}}</strong> </v-alert>
    <v-progress-circular v-if="loading" :size="50" color="primary" indeterminate></v-progress-circular>


    <hr />

    <!-- tables show data section  -->
    <v-card>
      <v-card-title>
        {{ sql_name }}
        <v-spacer></v-spacer>
        <v-btn class="warning mr-3"  @click="onExport" v-if="exceldata!=''">File excel</v-btn>
        <input type="text" v-model.lazy="search" placeholder="กรอกคำที่ต้องการค้นหา..." class="inputclass"/>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="responseDataarray"
        :search="search"
      ></v-data-table>
    </v-card>
  </v-container>
</template>

<script>
import axios from "axios";
import XLSX from 'xlsx' // import xlsx
export default {
  name: "tableshowdata",
  data: () => ({
    search: "",
    datepicker1: "",
    datepick2: "",
    getsqlcode: "",
    sql_name: "",
    loading:false,
    errorMessage:"",
    form: {
      sql: "",
      date1: "",
      date2: "",
    },
    Checkform: "",
    exceldata: "",
    fruits: [
      "Apples",
      "Apricots",
      "Avocado",
      "Bananas",
      "Blueberries",
      "Blackberries",
      "Boysenberries",
      "Bread fruit",
      "Cantaloupes (cantalope)",
      "Cherries",
      "Cranberries",
      "Cucumbers",
      "Currants",
      "Dates",
      "Eggplant",
      "Figs",
      "Grapes",
      "Grapefruit",
      "Guava",
      "Honeydew melons",
      "Huckleberries",
      "Kiwis",
      "Kumquat",
      "Lemons",
      "Limes",
      "Mangos",
      "Mulberries",
      "Muskmelon",
      "Nectarines",
      "Olives",
      "Oranges",
      "Papaya",
      "Peaches",
      "Pears",
      "Persimmon",
      "Pineapple",
      "Plums",
      "Pomegranate",
      "Raspberries",
      "Rose Apple",
      "Starfruit",
      "Strawberries",
      "Tangerines",
      "Tomatoes",
      "Watermelons",
      "Zucchini",
    ],
    selectedFruits: [],

    headers: [],
    responseDataarray: [],
  }),
  mounted() {
    axios
      .get(
        `http://localhost:3000/api/tableshowdata/sql/${this.$route.params.sql}`
      )
      .then((result) => {
        this.sql_name = result.data.sql_head; //name 1
        this.getsqlcode = result.data.sql_code; //code 1
        // console.log(result.data);
      });
    // console.log(this.$route.params.sql);
  },
  computed: {
    likesAllFruit() {
      return this.selectedFruits.length === this.fruits.length;
    },
    likesSomeFruit() {
      return this.selectedFruits.length > 0 && !this.likesAllFruit;
    },
    icon() {
      if (this.likesAllFruit) return "mdi-close-box";
      if (this.likesSomeFruit) return "mdi-minus-box";
      return "mdi-checkbox-blank-outline";
    },
  },

  methods: {
    toggle() {
      this.$nextTick(() => {
        if (this.likesAllFruit) {
          this.selectedFruits = [];
        } else {
          this.selectedFruits = this.fruits.slice();
        }
      });
    },
    submitForm() {
      this.form.sql = this.getsqlcode;
      this.loading = true;
      //console.log(this.form);
      axios
        .post( `http://localhost:3000/api/tableshowdata/queryfrominput`, this.form )
        .then((result) => {
          // this.getData = result.data;
          // this.headers =  [{ text: result.data.fields[0].name, value:  result.data.fields[0].name }];
          //console.log(result.data)
          var i;
          for (i = 0; i < result.data.fields.length; i++) {
            //map field data ใส่ลง data table เพื่อการแสดงผลข้อมูลตามชุดคำสั่ง query
            this.headers.push({
              text: result.data.fields[i].name,
              value: result.data.fields[i].name,
            }); // เป็น obj อยู่แล้ว ดันมี obj array ว้อนในอีกทีตรงช่อง fields เลยต้องเพิ่มทีละช่อง
          }
          // console.log(this.headers);
          this.responseDataarray = result.data.rows; //map data ใส่ลง data table
          this.exceldata = result.data.rows;
          this.loading = false;
          this.errorMessage = '';
        }).catch(err => {
            this.loading = false;
            this.errorMessage = err.response.data.message;
          });
    },
      onExport() {
      const dataWS = XLSX.utils.json_to_sheet(this.exceldata)
      const wb = XLSX.utils.book_new()
      const namefile = Date.now();
      
      XLSX.utils.book_append_sheet(wb, dataWS)
      XLSX.writeFile(wb,`${this.sql_name + namefile}.xlsx`)
    },
  },
};
</script>

<style>
.inputclass{
    cursor: text;
    margin: 0em;
    padding: 1px 2px;
    border-width: 2px;
    border-style: solid;
}
</style>
