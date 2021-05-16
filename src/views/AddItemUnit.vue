<template>
  <v-row justify="center">
    <v-col cols="12" sm="10" md="8" lg="6">
      <v-card ref="form" class="mt-5">
        <v-card-text>
          <h1 class="mb-5">เพิ่มประเภทหน่วยนับ</h1>
          <v-autocomplete
            ref="type_item"
            @keydown.space.prevent
            :items="type_item"
            label="ค้นหา - รายการหน่วยนับเดิม"
            placeholder="Select..."
            required
          ></v-autocomplete>

          <br class="mt-5 mb-5">


          <v-text-field
            ref="itemname"
            v-model="form.item_name_type"
            :rules="[() => !!form.item_name_type || 'This field is required']"
            :error-messages="errorMessages"
            label="ชื่อรายการหน่วยนับ"
            placeholder="โปรดกรอกชื่อรายการ"
            required
          ></v-text-field>


            <v-text-field
            ref="note"
            v-model="form.note"
            :error-messages="errorMessages"
            label="หมายเหตุ"
            placeholder=" - "
          ></v-text-field>


        </v-card-text>
      
        <v-divider class="mt-12"></v-divider>

        <v-alert
          v-if="errorRes"
          border="right"
          colored-border
          type="error"
          elevation="2"
        >
          {{ errorRes }}
        </v-alert>
        <v-alert
          v-if="successMessage"
          border="right"
          colored-border
          type="success"
          elevation="2"
        >
          {{ successMessage }}
        </v-alert>
        <v-card-actions>
          <v-btn @click="cancle" text>
            Cancel
          </v-btn>

          <v-spacer></v-spacer>

          <v-btn color="primary"  text @click="submit">
            Submit
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import axios from "axios";
export default {
  name:"additemunit",
  data: () => ({
    counter: 0,
    type_item:[],
    stock: [],
    errorMessages: "",
    successMessage: "",
    errorRes: "",
    groupstock_id: "",
    form: {
      item_name_type:null,
      note:null
    },
  }),

  async created() {
    await axios.get(`api/typeinput/itemtype`) .then((response) => {
        // console.log(response.data);
        var i;
        for (i = 0; i < response.data.length; i++) {
          this.type_item.push( response.data[i].item_type_id + "  : " + response.data[i].item_name_type);
        }
      }).catch((err) => {  console.log(err);}); 
  },


  computed: {},


  methods: {
    cancle() {
      this.$router.back();
    },

    async submit() {
        this.form.staff = this.$store.getters.get_name;
        // console.log(this.form);

        await axios .post("api/typeinput/itemtype", this.form) .then((response) => {
          console.log(response.data.message);
          this.form = {
            item_name_type:null,
            note:null
          };
          this.alertify.success('เพิ่มข้อมูลสำเร็จ !!');
          this.errorRes = "";
        }).catch((err) => {this.errorRes = err.response.data.message;});
    },
  },
};
</script>
<style>
.error-input {
  color: red !important;
}
</style>
