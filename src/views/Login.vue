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
              counter
            />

            <v-row class="justify-space-between px-3 pt-5 mb-5">
              <v-btn type="submit" color="success">เข้าสู่ระบบ</v-btn>
            </v-row>
          </v-form>
        </v-card-text>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
// import api from "@/services/api";

export default {
  mounted() {
    // if (api.isLoggedIn()) {
    //   this.$router.push("/home");
    // }
  },
  data() {
    return {
      isShowPassword: false,
      account: {
        username: "",
        password: "",
      },
    };
  },
  methods: {
    // submit() {
    //   this.$router.push("/stock");
    //   this.$store.dispatch({
    //     type: "doLogin",
    //     username: this.account.username,
    //     password: this.account.password
    //   });
    // }
  },
};
</script>

<style></style>
