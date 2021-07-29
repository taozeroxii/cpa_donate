<template>
  <div class="EditwDraw">
    <h1></h1>
    <v-row justify="center">
      <v-col cols="12" sm="10" md="8" lg="6">
        <v-card ref="form" class="mt-5">
          <v-card-text>
            <h1 class="mb-5">แก้ไขข้อมูลจ่ายสิ่งค้า/ ผู้รับมอบ</h1>
            <p>wd_id : {{ this.$route.params.id }}</p>

            <v-text-field
              ref="head"
              v-model="form.draw_head_id"
              :rules="[() => !!form.draw_head_id || 'This field is required']"
              :error-messages="errorMessages"
              :disabled="ckDonatenumber"
              label="รหัสใบจ่ายสินค้า"
              placeholder="เสมือนเลขที่กำกับการรับบริจาคในครั้งนั้นๆ เช่น A001"
              required
            ></v-text-field>

            <v-autocomplete
              ref="workgroup_id"
              v-model="form.workgroup_id"
              :rules="[() => !!form.workgroup_id || 'This field is required']"
              :error-messages="errorMessages"
              :items="workgroup"
              label="ผู้รับบริจาค / ผู้รับมอบ / หน่วยงาน"
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
            <v-btn v-model="checkinput" @click="adddata">เลือกประเภท</v-btn> รายการเดิม {{ olditem}}

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
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "EditwDraw",
  data: () => ({
    counter: 0,
    checkinput: false,
    ckDonatenumber: false,
    stock: [],
    stopdornor: "",
    workgroup: [],
    itemlist: [],
    errorMessages: "",
    successMessage: "",
    errorRes: "",
    groupstock_id: "",
    olditem:"",
    form: {
      item_id: null,
      workgroup_id: null,
      amount: null,
      insert_date: null,
      update_staff: null,
      draw_head_id: "",
    },
  }),

  created() {

    axios.get(`/api/typeinput/groupitem`).then((response) => {
        var i;
        for (i = 0; i < response.data.length; i++) {
          this.stock.push(
            response.data[i].group_item_type_id +"   : " + response.data[i].type_name
          );
        }
      }) .catch((err) => {
        console.log(err);
      });
    axios.get(`/api/typeinput/workgroup`).then((response) => {
        var i;
        for (i = 0; i < response.data.length; i++) {
          this.workgroup.push( response.data[i].id + "   : " + response.data[i].workgroup );
        }
      }).catch((err) => {
        console.log(err);
      });
    //  this.form.draw_head_id = 'A001';
  },

  async mounted() {
     const resdata = await axios.get(`/api/donate/with-draw/${this.$route.params.id}`)
    //  console.log(resdata.data);
     this.olditem = resdata.data.item_id +"   : " +  resdata.data.item_name + " ("+resdata.data.item_name_type+" ) ";
     this.groupstock_id  =  resdata.data.groupstock_id +"   : " +resdata.data.type_name ;
     this.form =  { 
        draw_head_id :resdata.data.draw_head_id,
        amount  :resdata.data.amount,
        workgroup_id :resdata.data.draw_department_id + "   : " +resdata.data.workgroup
     }
  },

  methods: {
    cancle() {
      this.$router.back();
    },

    submit() {
      this.stopdornor = this.form.workgroup_id;
      this.form.update_staff = this.$store.getters.get_name;
      this.form.item_id = this.form.item_id[0] + this.form.item_id[1] + this.form.item_id[2];
      this.form.workgroup_id = this.form.workgroup_id[0] + this.form.workgroup_id[1] + this.form.workgroup_id[2];
      if (this.form.item_id != null) {
        this.form.item_id = this.form.item_id[0] + this.form.item_id[1] + this.form.item_id[2];
        this.form.item_id = this.form.item_id.trim();
      }
      if (this.form.workgroup_id != null) {
        this.form.workgroup_id =this.form.workgroup_id[0] + this.form.workgroup_id[1] + this.form.workgroup_id[2];
        this.form.workgroup_id = this.form.workgroup_id.trim();
      }

      // console.log(this.form);
      axios .post(`/api/donate/edit-donate/${this.$route.params.id}`, this.form) .then((response) => {
          console.log(response);
          this.form.item_id = null;
          this.form.amount = null;
          this.checkinput = null;
          this.alertify.success("เพิ่มข้อมูลสำเร็จ !!");
          this.$router.back();
          this.errorRes = "";
        })
        .catch((err) => {
          this.errorRes = err.response.data.message;
        });
      this.form.workgroup_id = this.stopdornor;
    },

    clearlistitem() {
      this.itemlist = [];
      this.checkinput = false;
    },

    adddata() {
      this.itemlist = [];
      // console.log(this.form.groupstock_id[0]);
      axios
        .get(`/api/typeinput/itemlistgroupid/${this.groupstock_id[0]}`)
        .then((response) => {
          // console.log(response.data);
          this.checkinput = true;
          var i;
          for (i = 0; i < response.data.length; i++) {
            this.itemlist.push(
              response.data[i].item_id + "  : " + response.data[i].item_name + " ( " +response.data[i].item_name_type +  " ) "
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

<style></style>
