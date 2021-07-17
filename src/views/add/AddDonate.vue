<template>
  <v-row justify="center">
    <v-col cols="12" sm="10" md="8" lg="6">
      <v-card ref="form" class="mt-5">
        <v-card-text>
          <h1 class="mb-5">รับบริจาค / รับมอบ</h1>

          <v-text-field
            ref="head"
            v-model="form.donate_head_id"
            :rules="[() => !!form.donate_head_id || 'This field is required' ,() => form.donate_head_id.length <= 5 || 'โปรดกรอกตัวอักษร น้อยกว่า 5 ตัว']"
            :error-messages="errorMessages"
            :disabled="ckDonatenumber"
            label="เลขที่รับบริจาค / รับมอบ"
            placeholder="เสมือนเลขที่กำกับการรับบริจาคในครั้งนั้นๆ เช่น A001"
            required
          ></v-text-field>

          <v-autocomplete
            ref="donor_id"
            v-model="form.donor_id"
            :rules="[() => !!form.donor_id || 'This field is required']"
            :error-messages="errorMessages"
            :items="donor"
            label="ผู้บริจาค / ผู้มอบ"
            placeholder="นาย ก. บริษัท ข."
            required
          ></v-autocomplete>

          <v-autocomplete
            ref="stock"
            v-model="groupstock_id"
            :rules="[() => !!groupstock_id || 'This field is required']"
            :items="stock"
            label="โปรดเลือกประเภทบริจาค"
            placeholder="Select..."
            required
            @click="clearlistitem"
          ></v-autocomplete>
          <v-btn v-model="checkinput" @click="adddata">เลือกประเภท</v-btn>

          <v-autocomplete
            ref="itemlist"
            :disabled="!checkinput"
            v-model="form.item_id"
            :rules="[() => !!form.item_id || 'This field is required']"
            :items="itemlist"
            label="รายการสินค้า"
            placeholder="Select..."
            required
          ></v-autocomplete>

          <v-text-field
            ref="amount"
            v-model="form.amount"
            type="number"
            :rules="[() => !!form.amount || 'This field is required']"
            :error-messages="errorMessages"
            label="จำนวน"
            placeholder="1-9999999"
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
    counter: 0,
    checkinput: false,
    ckDonatenumber:false,
    stock: [],
    stopdornor:"",
    donor: [],
    itemlist: [],
    errorMessages: "",
    successMessage: "",
    errorRes: "",
    groupstock_id: "",
    form: {
      item_id: null,
      donor_id: null,
      amount: null,
      insert_date: null,
      staff: null,
      donate_head_id:''
    },
  }),

  created() {
    axios.get(`api/typeinput/groupitem`) .then((response) => {
        var i;
        for (i = 0; i < response.data.length; i++) {this.stock.push( response.data[i].group_item_type_id + "   : " +response.data[i].type_name );}
      })
      .catch((err) => {
        console.log(err);
      });
    axios.get(`api/donate/donorlist`) .then((response) => {
        var i;
        for (i = 0; i < response.data.length; i++) {this.donor.push( response.data[i].donor_id + "   : " +response.data[i].donor_name );}
      })
      .catch((err) => {
        console.log(err);
      });
    //  this.form.donate_head_id = 'A001';
  },

  computed: {},

  methods: {
    cancle() {
      this.$router.back();
    },

    submit() {
      this.stopdornor =  this.form.donor_id;
      this.form.staff    = this.$store.getters.get_name;
      this.form.item_id  = this.form.item_id[0] + this.form.item_id[1] + this.form.item_id[2];
      this.form.donor_id = this.form.donor_id[0] + this.form.donor_id[1] + this.form.donor_id[2];
      if (this.form.item_id != null) {
        this.form.item_id = this.form.item_id[0] + this.form.item_id[1] + this.form.item_id[2];
        this.form.item_id = this.form.item_id.trim();
      }
      if (this.form.donor_id != null) {
        this.form.donor_id = this.form.donor_id[0] + this.form.donor_id[1] + this.form.donor_id[2];
        this.form.donor_id = this.form.donor_id.trim();
      }
   
      // console.log(this.form);
      axios .post("api/donate/add-donate", this.form) .then((response) => {
          console.log(response);
          this.form.item_id = null;
          this.form.amount = null;
          this.checkinput = null;
          this.alertify.success("เพิ่มข้อมูลสำเร็จ !!");
          this.errorRes = "";
        })
        .catch((err) => {
          this.errorRes = err.response.data.message;
        });
       this.form.donor_id = this.stopdornor ;
    },

    clearlistitem() {
      this.itemlist = [];
      this.checkinput = false;
    },

    adddata() {
      this.itemlist = [];
      // console.log(this.form.groupstock_id[0]);
      axios
        .get(`api/typeinput/itemlistgroupid/${this.groupstock_id[0]}`) .then((response) => {
          // console.log(response.data);
          this.checkinput = true;
          var i;
          for (i = 0; i < response.data.length; i++) {
            this.itemlist.push( response.data[i].item_id +  "  : " +response.data[i].item_name + " ( " +response.data[i].item_name_type + " ) "
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
