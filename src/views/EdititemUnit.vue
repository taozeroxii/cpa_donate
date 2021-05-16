<template>
  <v-row justify="center">
    <v-col cols="12" sm="10" md="8" lg="6">
      <v-card ref="form" class="mt-5">
        <v-card-text>
          <h1 class="mb-5">แก้ไขประเภทหน่วยนับ</h1>

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
            ย้อนกลับ
          </v-btn>

          <v-spacer></v-spacer>

          <v-btn color="primary"  text @click="submit">
            ยืนยันแก้ไข
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
import axios from "axios";
export default {
  name:"edititemunit",
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
      note:null,
      staff_update:null
    },
  }),

async mounted() {
    // console.log(this.$router.params.id)
    // console.log(this.$store.state.user)
    const resdata = await axios.get(`/api/typeinput/groupitem/${this.$route.params.id}`);
    this.form = resdata.data;
},

  methods: {
    cancle() {
      this.$router.back();
    },

    async submit() {
        this.form.staff_update = this.$store.getters.get_name;
        console.log(this.form);

        await axios .put(`/api/typeinput/groupitem/${this.$route.params.id}`, this.form) .then((response) => {
          console.log(response.data.message);
          this.form = {
            item_name_type:null,
            note:null
          };
          this.alertify.success('แก้ไขสำเร็จ');
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
