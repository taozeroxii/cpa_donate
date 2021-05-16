<template>
  <v-container>
    <v-row class="justify-center mt-5">
      <v-card style="width:90%;" outline>
        <v-img class="align-end" height="100px">
          <v-card-title primary-title>
            เพิ่มผู้ใช้งาน
          </v-card-title>
        </v-img>
        <v-card-text>
          <v-form @submit.prevent="submit">
            <v-row>
              <v-col class="d-flex" lg="2" cols="4">
                <v-select
                  v-validate="'required'"
                  name="pname"
                  v-model="account.pname"
                  :items="items"
                  label="คำนำหน้า"
                  :rules="pnameRule"
                  :class="{ 'v-input--has-state theme--light v-text-field v-text-field--is-booted error--text': errors.has( 'pname'  ),  }"
                ></v-select>
              </v-col>

              <v-col lg="5" cols="4">
                <v-text-field
                  v-validate="'required'"
                  name="fname"
                  label="ชื่อ"
                  id="fname"
                  :class="{  'v-input--has-state theme--light v-text-field v-text-field--is-booted error--text': errors.has(     'fname'   ),   }"
                  v-model.trim="account.fname"
                  :rules="fnameRule"
                />
                <!-- <span>{{ errors.first("fname") }}</span> -->
              </v-col>
              <v-col lg="5" cols="4">
                <v-text-field
                  v-validate="'required'"
                  name="lname"
                  label="นามสกุล"
                  id="lname"
                  v-model.trim="account.lname"
                  :rules="lnameRule"
                  :class="{'v-input--has-state theme--light v-text-field v-text-field--is-booted error--text': errors.has('lname') }"
                />
                <!-- <span>{{ errors.first("lname") }}</span> -->
              </v-col>
            </v-row>

            <v-row>
              <!-- Username -->
              <v-col lg="6" cols="4">
                <v-text-field
                  v-validate="'required'"
                  name="username"
                  label="Username"
                  id="username"
                  v-model.trim="account.username"
                  :class="{'v-input--has-state theme--light v-text-field v-text-field--is-booted error--text': errors.has( 'username' ),}"
                  :rules="usernameRules"
                /><!-- <span>{{ errors.first("username") }}</span>-->
              </v-col>

              <!-- Password -->
              <v-col lg="6" cols="4">
                <v-text-field
                  v-validate="'required|min:6'"
                  name="password"
                  label="Password"
                  id="password"
                  :append-icon="
                    isShowPassword ? 'visibility' : 'visibility_off'
                  "
                  @click:append="isShowPassword = !isShowPassword"
                  :type="isShowPassword ? 'text' : 'password'"
                  counter
                  v-model.trim="account.password"
                  :rules="passwordRules"
                  :class="{'v-input--has-state theme--light v-text-field v-text-field--is-booted error--text': errors.has('password' )}"
                />
                <!-- <span>{{ errors.first("password") }}</span> -->
              </v-col>
            </v-row>

            <v-row>
              <v-col class="d-flex" lg="12" cols="4">
                <v-select
                  v-validate="'required'"
                  name="role"
                  v-model="account.default_role"
                  :items="role"
                  item-text="name"
                  item-value="id"
                  :rules="roleRules"
                  label="สิทธิการใช้งาน"
                  :class="{ 'v-input--has-state theme--light v-text-field v-text-field--is-booted error--text': errors.has('role' ), }"
                >
                </v-select>
              </v-col>
            </v-row>

            <!-- <span>{{ account }}</span> -->

            <v-row class="justify-space-between px-3 pt-5 mb-5">
              <v-col cols="6">
                <v-btn type="submit" block color="success">
                  บันทึก<v-icon dark right> mdi-checkbox-marked-circle </v-icon>
                </v-btn>
              </v-col>
              <v-col cols="6">
                <v-btn block color="orange darken-2" dark @click="cancel"
                  ><v-icon dark left> mdi-arrow-left</v-icon>ยกเลิก</v-btn
                >
              </v-col>

              <v-col>
                <v-alert v-if="errorMessage" outlined type="warning" prominent border="left" > {{ errorMessage }}</v-alert >
              </v-col>
            </v-row>
          </v-form>
        </v-card-text>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import Axios from "axios";

export default {
  data() {
    return {
      errorMessage: "",
      isShowPassword: false,
      role: [
        { id: "1", name: "admin" },
        { id: "2", name: "user" },
      ],
      items: ["นาย", "นาง", "นางสาว"],
      account: {
        username: "",
        password: "",
        pname: "",
        fname: "",
        lname: "",
        default_role :"",
        isuse:"Y"
      },
      usernameRules: [(v1) => !!v1 || "โปรดกรอก username"],
      passwordRules: [
        (v1) => !!v1 || "โปรดกรอก Password",
        (v2) => !!/^(?=.{6,})/.test(v2) || "Password ขั้นต่ำ 6 ตัว",
      ],
      pnameRule: [(v1) => !!v1 || "โปรดกรอก คำนำหน้าชื่อ"],
      fnameRule: [(v1) => !!v1 || "โปรดกรอก ชื่อ"],
      lnameRule: [(v1) => !!v1 || "โปรดกรอก นามสกุล"],
      roleRules: [(v1) => !!v1 || "โปรดกรอก สิทธิผู้ใช้งาน"],
    };
  },
  methods: {
    cancel() {
      this.$router.back();
    },
    submit() {
      // console.log(this.account);
      this.$validator.validateAll().then((valid) => {
        // console.log(valid);
        if (!valid) return;
        Axios.post("api/account/register",this.account)
          .then((response) => {
            console.log(response);
            this.account = {
              username: "",
              password: "",
              pname: "",
              fname: "",
              lname: "",
              default_role :"",
            }
              // alertify.success(('Success message'));
            this.errorMessage = "Insert success";
          })
          .catch((err) => {
            // console.log(err.response.data.message);
            this.errorMessage = err.response.data.message;
          });
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
