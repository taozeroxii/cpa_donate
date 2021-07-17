import Vue from "vue";
import VueRouter from "vue-router";
import Login from "../views/Login.vue";
import tableshowdata from "../views/form/tableshowdata";

Vue.use(VueRouter);

const routes = [
  //-------------------------------------------- หน้าหลัก ----------------------------------------------------------
  {
    path: "/",
    name: "home",
    meta: { auth: true },
    component: () => import("@/views/Home.vue"),
  },
  {
    path: "/dashboard",
    name: "dashboard",
    component: () => import("@/views/dashboard.vue"),
  },
  {
    path: "/report",
    meta: { auth: true },
    name: "report",
    component: () => import("@/views/report.vue"),
  },
  {
    path: "/about",
    name: "About",
    component: () => import("../views/About.vue"),
  },

  //-------------------------------------------- รับบริจาค ----------------------------------------------------------
  {
    path: "/donate",
    meta: { auth: true },
    name: "Donate",
    component: () => import("../views/Donate"),
  },
  {
    path: "/add-donate",
    meta: { auth: true },
    name: "adddonate",
    component: () => import("../views/AddDonate"),
  },

  //-------------------------------------------- จ่ายสินค้า ----------------------------------------------------------
  {
    path: "/withdraw",
    meta: { auth: true },
    name: "wDraw",
    component: () => import("../views/wDraw"),
  },
  {
    path: "/w-draw",
    meta: { auth: true },
    name: "addwDraw",
    component: () => import("../views/addwDraw"),
  },

  //-------------------------------------------- สินค้า ----------------------------------------------------------
  {
    path: "/item-list", meta: { auth: true }, name: "ItemList",component: () => import("../views/itemList"),
  },
  {
    path: "/add-item",meta: { auth: true }, name: "additem",component: () => import("../views/AddItem.vue"),
  },
  {
    path: "/edit-item/:id", meta: { auth: true },name: "edititem", component: () => import("../views/Edititem"),
  },
   //--------------------------------------- ประเภทหน่วยสินค้า ----------------------------------------------------------
  {
    path: "/item-unit",meta: { auth: true }, name: "itemUnit", component: () => import("../views/itemUnit"),
  },
  {
    path: "/add-item-unit", meta: { auth: true },name: "additemunid",component: () => import("../views/AddItemUnit"),
  },
  {
    path: "/edit-item-unit/:id", meta: { auth: true },name: "edititemunitid", component: () => import("../views/EdititemUnit"),
  },

  //-------------------------------------------- USER ----------------------------------------------------------
  {
    path: "/userlist", meta: { auth:['admin'] },name: "userlist",component: () => import("@/views/userlist.vue"),
  },
  {
    path: "/register",meta: { auth: true },name: "register",component: () => import("@/views/Register.vue"),
  },
  {//ฟิกต้องเป็นสิทธิตั้งต้นของ admin เท่านั้นที่จะเข้า router นี้ได้
    path: "/edit-user/:id", meta: { auth:['admin'] }, name: "EditUser",component: () => import("@/views/EditUser.vue"),
  },
  {
    path: "/login",name: "login",component: Login,
  },

  {
    path: "/tableshowdata/:sql",name: "tableshowdata",component: tableshowdata, // meta:{ isSecured:true},
  },

  {
    path: "*",redirect: "/login",
  },
];

const router = new VueRouter({
  mode: "history",base: process.env.BASE_URL,routes,
});

//ตรวจสอบสิทธิเข้าถึงหน้า
router.beforeEach((to, from, next) => {
  // console.log(to)
  // console.log(to.name)
  // console.log(router.app.$store)
  const auth =  to.meta.auth; // ดึงค่าจาก authen ตรวจ router ที่ประกาศไว้แบบธรรมดาและ array
  // console.log(auth)
  if (!auth) return next();
  // if(to.name == `edititemunitid`) router.app.$store.dispatch('get_user_login_edit')//หากเข้า path ที่เป็น api/path/:id ให้เข้าไป get user login ตามนี้
  router.app.$store.dispatch("get_user_login")
    .then(() => {
      // console.log(router.app.$store.state.user); //เช็คค่าที่เก็บลง store หลังจาก login
      if(!Array.isArray(auth))return next(); 
      const userLogin = router.app.$store.state.user;//ดึงค่า userมาเก็บในตัวแปร
      if(auth.indexOf(userLogin.default_role_name) >=0 ) return next()
     
    })
    .catch(() => next({ name: "login" }));
});

export default router;
