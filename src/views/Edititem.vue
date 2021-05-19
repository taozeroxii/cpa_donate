<template>
  <v-row justify="center">
    <v-col cols="12" sm="10" md="8" lg="6">
      <v-card ref="form" class="mt-5">
        <v-card-text>
          <h1 class="mb-5">แก้ไขข้อมูลสินค้า</h1>
          <v-autocomplete
            ref="stock"
            @keydown.space.prevent
            v-model="form.group_item_type_id"
            :rules="[() => !!form.group_item_type_id || 'This field is required']"
            :items="stock"
            label="โปรดเลือกประเภทบริจาค"
            placeholder="Select..."
            required
          ></v-autocomplete>

          <v-text-field
            ref="itemname"
            v-model="form.item_name"
            :rules="[() => !!form.item_name || 'This field is required']"
            :error-messages="errorMessages"
            label="ชื่อรายการ"
            placeholder="โปรดกรอกชื่อรายการ"
            required
          ></v-text-field>

          <v-autocomplete
            ref="type_item"
            v-model="form.item_type_id"
            @keydown.space.prevent
            :rules="[() => !!form.item_type_id || 'This field is required']"
            :items="type_item"
            label="โปรดเลือกหน่วยนับ"
            placeholder="Select..."
            required
          ></v-autocomplete>
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
  data: () => ({
    counter: 0,
    type_item:[],
    stock: [],
    errorMessages: "",
    successMessage: "",
    errorRes: "",
    groupstock_id: "",
    form: {
      group_item_type_id:null,
      item_type_id:null,
      item_name: null,
      insert_date: null,
      staff:null
    },
  }),

  async created() {
    await axios.get(`/api/typeinput/groupitem`).then((response) => {
        //console.log(response.data);
        var i;
        for (i = 0; i < response.data.length; i++) {
          this.stock.push(  response.data[i].group_item_type_id + " " + response.data[i].type_name );
        }
      }).catch((err) => { console.log(err); });

    await axios.get(`/api/typeinput/itemtype`) .then((response) => {
        // console.log(response.data);
        var i;
        for (i = 0; i < response.data.length; i++) {
          this.type_item.push( response.data[i].item_type_id + "  : " + response.data[i].item_name_type);
        }
      }).catch((err) => {  console.log(err);}); 
  },

  async mounted() {
    const resdata = await axios.get(`/api/typeinput/itemlist/${this.$route.params.id}`);
    // console.log(resdata.data)
    this.form =  { 
      group_item_type_id:resdata.data.group_item_type_id+ " " +resdata.data.type_name,
      item_type_id:resdata.data.item_type_id+ "  : " +resdata.data.item_name_type,
      item_name:resdata.data.item_name
      }
      console.log(this.form)
  },


  computed: {},


  methods: {
    cancle() {
      this.$router.back();
    },

    async submit() {
        if( this.form.group_item_type_id!=null){ 
            this.form.group_item_type_id = this.form.group_item_type_id[0];
            this.form.group_item_type_id =  this.form.group_item_type_id.trim();
        } 
        if( this.form.item_type_id!=null){ 
          this.form.item_type_id = this.form.item_type_id[0]+this.form.item_type_id[1]+this.form.item_type_id[2];
          this.form.item_type_id = this.form.item_type_id.trim();
        }
        this.form.staff = this.$store.getters.get_name;
        // console.log(this.form);

        await axios .post("api/typeinput/add-item", this.form) .then((response) => {
          console.log(response.data.message);
          this.form = {
                group_item_type_id:null,
                item_type_id:null,
                item_name: null,
                insert_date: null,
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
