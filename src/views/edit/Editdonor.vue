<template>
  <div class="AddDonor">
    <v-row justify="center">
      <v-col cols="12" sm="10" md="8" lg="6">
        <v-card ref="form" class="mt-5">
          <v-card-text><h1>แก้ไช รายชื่อผู้บริจาค / ผู้มอบ</h1>

            <v-text-field
              class="mt-5"
              ref="head"
              v-model="form.donor_name"
              :rules="[() => !!form.donor_name || 'This field is required']"
              :error-messages="errorMessages"
              label="โปรดกรอกข้อมูลรายชื่อผู้บริจาค / ผู้มอบ "
              placeholder="โปรดกรอกข้อมูลรายชื่อผู้บริจาค"
              required
            ></v-text-field>
          </v-card-text>
          <v-alert
            v-if="errorRes"
            border="right"
            colored-border
            type="error"
            elevation="2"
          >
            {{ errorRes }}
          </v-alert>
          <v-card-actions>
            <v-btn @click="cancle" text>
              Cancel
            </v-btn>
            <v-spacer></v-spacer>
            <v-btn color="primary" text @click="submit">
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
  name: "EditDonor",
  data() {
    return {
      errorMessages: "",
      errorRes: "",
      status: null,
      form: {
        donor_name: null,
        update_staff: null,
      },
    };
  },
  async created() {
    await axios.get(`/api/donate/donorlist/${this.$route.params.id}`).then((res)=>{
        this.form.donor_name =  res.data.donor_name;
    })
  },
  methods: {
    cancle() {
      this.$router.back();
    },
    submit() {
      this.form.update_staff = this.$store.getters.get_name;
      axios .post(`/api/donate/edit-donor/${this.$route.params.id}`, this.form) .then(() => {
          this.alertify.success("แก้ไขข้อมูลสำเร็จ !!");
          this.errorRes = "";
          this.$router.back();
        })
        .catch((err) => {
          this.errorRes = err.response.data.message;
        });
    },
  },
};
</script>

<style></style>
