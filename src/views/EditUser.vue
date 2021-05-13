<template>
  <v-container id="Edituser">
    <v-row class="justify-center mt-5">
      <v-card style="width:90%;" outline>
        <v-img class="align-end" height="100px">
          <v-card-title primary-title>
            แก้ไขข้อมูลผู้ใช้งาน
          </v-card-title>
        </v-img>
        <v-card-text>
          <v-form @submit.prevent="submit">
            <v-row>
              <v-col class="d-flex" lg="2" cols="4">
                <v-select
                  v-model="useraccount.pname"
                  :items="items"
                  label="คำนำหน้า"
                  :rules="pnameRule"
                ></v-select>
              </v-col>

              <v-col lg="5" cols="4">
                <v-text-field
                  name="fname"
                  label="ชื่อ"
                  id="fname"
                  v-model="useraccount.fname"
                  :rules="fnameRule"
                />
              </v-col>
              <v-col lg="5" cols="4">
                <v-text-field
                  name="lname"
                  label="นามสกุล"
                  id="lname"
                  v-model="useraccount.lname"
                  :rules="lnameRule"
                />
              </v-col>
            </v-row>

            <v-row>
              <!-- Username -->
              <v-col lg="6" cols="4">
                <v-text-field
                  name="username"
                  label="Username"
                  id="username"
                  v-model="useraccount.username"
                  :rules="usernameRules"
              /></v-col>
              <!-- Password -->
              <v-col lg="6" cols="4">
                <v-text-field
                  name="password"
                  label="Password"
                  id="password"
                  :append-icon="
                    isShowPassword ? 'visibility' : 'visibility_off'
                  "
                  @click:append="isShowPassword = !isShowPassword"
                  :type="isShowPassword ? 'text' : 'password'"
                  counter
                  v-model="useraccount.password"
                  :rules="passwordRules"
              /></v-col>
            </v-row>

            <v-row>
              <v-col class="d-flex" lg="12" cols="4">
                <v-select
                  v-model="useraccount.default_role"
                  :items="role"
                  item-text="name"
                  item-value="id"
                  label="สิทธิการใช้งาน"
                ></v-select>
              </v-col>
            </v-row>
            <!-- <span>{{ useraccount }}</span> -->
            <v-row class="justify-space-between px-3 pt-5 mb-5">
              <v-col cols="6">
                <v-btn type="submit" block color="success">
                  แก้ไข
                  <v-icon dark right> mdi-checkbox-marked-circle </v-icon>
                </v-btn></v-col
              >
              <v-col cols="6">
                <v-btn block color="orange darken-2" dark @click="cancel">
                  <v-icon dark left> mdi-arrow-left</v-icon>ยกเลิก</v-btn
                ></v-col
              >
            </v-row>
          </v-form>
        </v-card-text>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import axios from 'axios'

export default {
  name: "Edituser",
  data() {
    return {
      isShowPassword: false,
      role: [
        { id: "1", name: "admin" },
        { id: "2", name: "user" },
        // { id: "3", name: "ดูแลอุปกรณ์" },
        // { id: "4", name: "ดูแลเวชภัณฑ์" },
        // { id: "5", name: "ครุภัณฑ์" },
        // { id: "6", name: "อุปโภค" },
        // { id: "7", name: "บริโภค" },
      ],
      items: ["นาย", "นาง", "นางสาว"],
      useraccount: {
        username: "",
        password: "",
        pname: "",
        fname: "",
        lname: "",
        default_role: "",
      },
      usernameRules: [(v1) => !!v1 || "โปรดกรอก username"],
      passwordRules: [
        (v1) => !!v1 || "โปรดกรอก Password",
        (v2) =>
          !!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.test(v2) ||
          "ขั้นต่ำ 8 ตัว, ต้องมีตัวอีกษรอย่างน้อย 1 ตัว",
      ],
      pnameRule: [(v1) => !!v1 || "โปรดกรอก คำนำหน้าชื่อ"],
      fnameRule: [(v1) => !!v1 || "โปรดกรอก ชื่อ"],
      lnameRule: [(v1) => !!v1 || "โปรดกรอก นามสกุล"],
    };
  },
    async mounted() {
    // console.log(this.$route.params.id)
    const resdata = await axios.get(`/api/account/get-user/${this.$route.params.id}`);
    this.useraccount = resdata.data;
    // console.log( this.account)
    // this.product = result.data;
  },
  methods: {
    cancel() {
      this.$router.back();
    },
    submit() {
      // console.log(this.account);
      // axios.post(`/api/accont/edit-user/`,this.useraccount,(err,res)=>{
      //   if(err) return err
      //   console.log(res)
      // })
    },
  },
};
</script>

<style></style>
