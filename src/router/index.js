import Vue from "vue";
import VueRouter from "vue-router";
import Login from "../views/Login.vue";
import tableshowdata from "../views/form/tableshowdata";

Vue.use(VueRouter);

const routes = [
  {
    path: "/home",name: "home", component: () => import("@/views/Home.vue"),
  },
  {
    path: "/dashboard", name: "dashboard", component: () => import("@/views/dashboard.vue"),
  },
  {
    path: "/report", name: "report", component: () => import("@/views/report.vue"),
  },
  {
    path: "/about", name: "About", component: () =>import( "../views/About.vue"),
  },
  {
    path: "/donate", name: "Donate", component: () =>import( "../views/Donate"),
  },
  {
    path: "/withdraw", name: "wDraw", component: () =>import( "../views/wDraw"),
  },
  {
    path: "/item-list", name: "ItemList", component: () =>import( "../views/itemList"),
  },
  {
    path: "/item-unit", name: "itemUnit", component: () =>import( "../views/itemUnit"),
  }, 
  {
    path: "/userlist", name: "userlist", component: () => import("@/views/userlist.vue"),
  },



  {
    path: "/register", name: "register", component: () => import("@/views/Register.vue"),
  },
  {
    path: "/edit-user/:id", name: "EditUser", component: () => import("@/views/edits/EditUser.vue")
  },


  
  {
    path: "/login", name: "login",component: Login,
  },
 
  {
    path: "/tableshowdata/:sql",name: "tableshowdata",component: tableshowdata,// meta:{ isSecured:true},
  },

  {
    path: "*",
    redirect: "/home",
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
