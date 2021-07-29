<template>
  <v-row justify="center">
    <v-col cols="12" sm="10" md="8" lg="6">
      <v-card ref="form" class="mt-5">
        <v-card-text>
          <h1 class="mb-5">จ่ายสิ่งของรับบริจาค / ส่งมอบ</h1>

          <v-text-field
            ref="head"
            v-model="form.draw_head_id"
            :rules="[() => !!form.draw_head_id || 'This field is required',]"
            :error-messages="errorMessages"
            :disabled="ckDonatenumber"
            label="เลขที่จ่ายสิ่งของบริจาค / ส่งรับมอบ"
            placeholder="เสมือนเลขที่กำกับการรับบริจาคในครั้งนั้นๆ เช่น A001"
            required
          ></v-text-field>

          <v-autocomplete
            ref="workgroup"
            v-model="draw_department_id"
            :rules="[() => !!draw_department_id || 'This field is required']"
            :error-messages="errorMessages"
            :items="workgroup"
            label="หน่วยงาน "
            placeholder=" ..."
            required
          ></v-autocomplete>

          <v-autocomplete
            ref="stock"
            v-model="groupstock_id"
            :rules="[() => !!groupstock_id || 'This field is required']"
            :items="stock"
            label="โปรดเลือกประเภทสิ่งของบริจาค"
            placeholder="Select..."
            required
            @click="clearlistitem"
          ></v-autocomplete>
          <v-btn v-model="checkinput" @click="adddata">เลือกประเภท</v-btn>

          <v-autocomplete
            ref="itemlist"
            :disabled="!checkinput"
            v-model="item_id"
            :rules="[() => !!item_id || 'This field is required']"
            :items="itemlist"
            label="รายการสินค้า"
            placeholder="Select..."
            required
          ></v-autocomplete>

          <h3 v-if="totalamount">
            จำนวนสินค้าที่เหลืออยู่ : {{ totalamount }}
          </h3>
          <v-text-field
            ref="amount"
            v-model="form.amount"
            type="number"
            min="1"
            :rules="[ () => !!form.amount || 'This field is required',]"
            :error-messages="errorMessages"
            label="จำนวน"
            placeholder="1-9999999"
            required
          ></v-text-field>

          <v-text-field
            ref="note"
            v-model="form.note"
            label="หมายเหตุ / note"
            placeholder=""
            required
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

          <v-btn color="primary" :disabled="!checkinput" text @click="submit">
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
    checkinput: false,
    ckDonatenumber: false,
    stock: [],
    workgroup: [],
    item_id:[],
    itemlist: [],
    errorMessages: "",
    successMessage: "",
    errorRes: "",
    groupstock_id: "",
    draw_department_id:"",
    totalamount: null,
    form: {
      draw_head_id:null,
      item_id:null,
      amount:null,
      draw_department_id: null,
      staff:null,
      note:null
    },
  }),

  created() {
    axios.get(`api/typeinput/groupitem`) .then((response) => {var i;
        for (i = 0; i < response.data.length; i++) {
          this.stock.push( response.data[i].group_item_type_id +   "   : " + response.data[i].type_name );
        }
      }).catch((err) => {console.log(err);});


    axios .get(`api/typeinput/workgroup`) .then((response) => { 
      var i;
        for (i = 0; i < response.data.length; i++) {
          this.workgroup.push( response.data[i].id + "   : " + response.data[i].workgroup );
        }
      }).catch((err) => {console.log(err); });
  },

  computed: {},



  methods: {
    cancle() {
      this.$router.back();
    },
    

    submit() {
      this.form.draw_department_id = this.draw_department_id;
      this.form.item_id = this.item_id;
      this.form.staff = this.$store.getters.get_name;
      if (this.form.item_id != null) {
           this.form.item_id = this.form.item_id [0] + this.form.item_id [1] + this.form.item_id [2];
      }

      if (this.form.itemlist != null) {
        this.form.itemlist = this.form.itemlist[0] + this.form.itemlist[1] + this.form.itemlist[2];
        this.form.itemlist = this.form.itemlist.trim();
      }

       if (this.form.draw_department_id != null) {
        this.form.draw_department_id = this.form.draw_department_id[0] + this.form.draw_department_id[1] + this.form.draw_department_id[2];
        this.form.draw_department_id = this.form.draw_department_id.trim();
      }

      // console.log(this.form);
      axios .post("api/donate/add-wdraw", this.form) .then(() => {
          // console.log(response);
          this.form.amount = null;
          this.form.note = null;
          this.checkinput = null;
          this.alertify.success("เพิ่มข้อมูลสำเร็จ !!");
          this.errorRes = "";
        })
        .catch((err) => {
          this.errorRes = err.response.data.message;
        });

    },


    clearlistitem() {
      this.itemlist = [];
      this.checkinput = false;
    },

    adddata() {
      this.itemlist = [];
      this.form.groupstock_id = this.groupstock_id[0]
      // console.log(this.form.groupstock_id);
      axios .get(`api/typeinput/itemlistgroupid/${this.groupstock_id[0]}`) .then((response) => {
          // console.log(response.data);
          this.checkinput = true;
          var i;
          for (i = 0; i < response.data.length; i++) {
            this.itemlist.push(  response.data[i].item_id +"  : " +response.data[i].item_name +  " ( " +response.data[i].item_name_type +" ) "
            );
          }
        })
        .catch(() => {
          // console.log(err);
          this.checkinput = false;
        });
    },
  },
};
</script>
<style>
.error-input {
  color: red !important;
}
</style>
