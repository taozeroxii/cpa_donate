<template>
  <v-container>
    <v-row style="margin:5px;">
      <v-row>
        <v-col lg="3" md="6" sm="12" cols="12">
          <MenuCard
            title="รับบริจาค/ผู้มอบ"
            subtitle="คลิกเพื่อไปหน้ารับบริจาค"
            avatar_bg="#00a65a"
            avatar_ic="mdi-cart-outline"
            menulink="/donate"
          />
        </v-col>

        <v-col lg="3" md="6" sm="12" cols="12">
          <MenuCard
            title="จ่าย / ผู้รับมอบ"
            avatar_ic="mdi-directions"
            avatar_bg="#f39c12"
            subtitle="คลิกเพื่อไปหน้าจ่าย"
            menulink="/withdraw"
          />
        </v-col>

        <v-col lg="3" md="6" sm="12" cols="12">
          <MenuCard
            title="รายการสิ่งของ"
            avatar_ic="mdi-store"
            avatar_bg="#dd4b39"
            subtitle="เพิ่ม/ลบ/แก้ไขรายการสิ่งของ"
            menulink="/item-list"
          />
        </v-col>

        <v-col lg="3" md="6" sm="12" cols="12">
          <MenuCard
            title="หน่วยนับ"
            avatar_ic="mdi-scale"
            avatar_bg="#DDA0DD"
            subtitle="จัดการหน่วยนับสิ่งของ (ชิ้น อัน)"
            menulink="/item-unit"
          />
        </v-col>

         <v-col lg="3" md="6" sm="12" cols="12">
          <MenuCard
            title="กลุ่มภารกิจ"
            avatar_ic="mdi-directions"
            avatar_bg="#f39c12"
            subtitle="จัดการข้อมูลกลุ่มภารกิจ"
            menulink="/mission"
          />
        </v-col>

         <v-col lg="3" md="6" sm="12" cols="12">
          <MenuCard
            title="หน่วยงาน"
            avatar_ic="mdi-directions"
            avatar_bg="#f39c12"
            subtitle="จัดการข้อมูลกลุ่มภารกิจ"
            menulink="/workgroup"
          />
        </v-col>


        <v-col lg="3" md="6" sm="12" cols="12">
          <MenuCard
            title="ผู้ใช้งาน"
            avatar_ic="mdi-account-multiple-plus"
            avatar_bg="#FA8072"
            subtitle="เพิ่มแก้ไขข้อมูลผู้ใช้งาน"
            menulink="/userlist"
          />
        
        </v-col>
      </v-row>
    </v-row>
  </v-container>
</template>

<script>
// import axios from "axios";
import MenuCard from "@/components/cards/menuCard";
export default {
  name: "Home",
  components: { MenuCard },
  data() {
    return {
      select: "",
    };
  },
  methods: {},
   created(){
    // const userLogin = this.$store.state.user;
    // console.log(userLogin)
  }
};
</script>
