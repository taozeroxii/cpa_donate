import Vue from "vue";
import VueRouter from "vue-router";
import Login from "../views/Login.vue";
import tableshowdata from "../views/form/tableshowdata";

Vue.use(VueRouter);

const routes = [
  //-------------------------------------------- หน้าหลัก ----------------------------------------------------------
  {
    path: "/",name: "home" ,meta:{auth:true}, component: () => import("@/views/Home.vue"),
  },
  {
    path: "/dashboard", name: "dashboard", component: () => import("@/views/dashboard.vue"),
  },
  {
    path: "/report",meta:{auth:true}, name: "report", component: () => import("@/views/report.vue"),
  },
  {
    path: "/about", name: "About", component: () =>import( "../views/About.vue"),
  },


  //-------------------------------------------- รับบริจาค ----------------------------------------------------------
  {
    path: "/donate",meta:{auth:true}, name: "Donate", component: () =>import( "../views/Donate"),
  },
  {
    path: "/add-donate",meta:{auth:true}, name: "adddonate", component: () =>import( "../views/AddDonate"),
  },


  //-------------------------------------------- จ่ายสินค้า ----------------------------------------------------------
  {
    path: "/withdraw",meta:{auth:true}, name: "wDraw", component: () =>import( "../views/wDraw"),
  },




  //-------------------------------------------- สินค้า ----------------------------------------------------------
  {
    path: "/item-list",meta:{auth:true}, name: "ItemList", component: () =>import( "../views/itemList"),
  },
  {
    path: "/add-item",meta:{auth:true}, name: "additem", component: () =>import( "../views/AddItem.vue"),
  },
  {
    path: "/item-unit",meta:{auth:true}, name: "itemUnit", component: () =>import( "../views/itemUnit"),
  }, 


  //-------------------------------------------- USER ----------------------------------------------------------
  {
    path: "/userlist",meta:{auth:true}, name: "userlist", component: () => import("@/views/userlist.vue"),
  },
  {
    path: "/register",meta:{auth:true}, name: "register", component: () => import("@/views/Register.vue"),
  },
  {
    path: "/edit-user/:id",meta:{auth:true}, name: "EditUser", component: () => import("@/views/EditUser.vue")
  },
  {
    path: "/login", name: "login",component: Login,
  },
 
  {
    path: "/tableshowdata/:sql",name: "tableshowdata",component: tableshowdata,// meta:{ isSecured:true},
  },

  {
    path: "*",
    redirect: "/login",
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

//ตรวจสอบสิทธิเข้าถึงหน้า
router.beforeEach((to,from,next)=>{
  //  console.log(to)
  //  console.log(to.path)
  // console.log(router.app.$store)
  if(!to.meta.auth)return next();
  router.app.$store.dispatch('get_user_login')
  .then(()=>next() )   
  .catch(() => next({ name: 'login' }))
})

export default router;
