<template>
  <v-container mt-5>
    <v-row class="justify-center mt-5">
      <v-card style="width:400px;" shaped>
        <v-img class="white--text align-end success" src="" height="120px">
          <v-card-title>
            ระบบรับบริจาค รพ.เจ้าพระยาอภัยภูเบศร
          </v-card-title>
        </v-img>
        <v-card-text>
          <v-form @submit.prevent="submit">
            <!-- Username -->
            <v-text-field
              name="username"
              label="Username"
              id="username"
              v-model="account.username"
              :rules="usernameRules"
            />

            <!-- Password -->
            <v-text-field
              name="password"
              label="Password"
              id="password"
              v-model="account.password"
              :append-icon="isShowPassword ? 'visibility' : 'visibility_off'"
              @click:append="isShowPassword = !isShowPassword"
              :type="isShowPassword ? 'text' : 'password'"
              :rules="passwordRules"
              counter
            />

            <v-row class="justify-space-between px-3 pt-5 mb-5">
              <v-btn type="submit" color="success">เข้าสู่ระบบ</v-btn>
            </v-row>
            <v-alert v-if="errorMessage" outlined type="warning" prominent border="left" > {{ errorMessage }}</v-alert >
          </v-form>
        </v-card-text>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  mounted() {
    // if (api.isLoggedIn()) {
    //   this.$router.push("/home");
    // }
  },
  data() {
    return {
      errorMessage:"",
      isShowPassword: false,
      account: {
        username: "",
        password: "",
      },
      usernameRules: [(v1) => !!v1 || "โปรดกรอก username"],
      passwordRules: [
        (v1) => !!v1 || "โปรดกรอก Password",
        (v2) => !!/^(?=.{6,})/.test(v2) || "Password ขั้นต่ำ 6 ตัว",
      ],
    };
  },
  methods: {
      submit() {
      // console.log(this.account);
      this.$validator.validateAll().then((valid) => {
        // console.log(valid);
        if (!valid) return;
        axios.post("api/account/login",this.account)
          .then((response) => {
            console.log(response.data);
            this.$router.push('/dashboard')
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

<style></style>
