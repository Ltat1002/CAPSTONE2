import { createRouter, createWebHistory } from "vue-router";
import HomeLayout from "../views/engineer/HomeLayout.vue";
import { routerAuth } from "@/router/modules/router-auth";
import { routerUsers } from "./modules/router-users/index.js";
import HomeUser from "@/views/users/HomeUser.vue";
import { routerEngineer } from "./modules/router-engineer/index";
import HomeAdmin from "@/views/Admin/HomeAdmin.vue";
import { routerAdmin } from "./modules/router-admin/index.js";
const routes = [
  {
    path: "/",
    name: "home",
    component: HomeUser,
    children: [...routerUsers],
  },
  {
    path: "/engineer",
    name: "engineer",
    component: HomeLayout,
    children: [...routerEngineer],
  },
  {
    path: "/admin",
    name: "admin",
    component: HomeAdmin,
    children: [...routerAdmin],
  },
  { ...routerAuth },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
  scrollBehavior() {
    return { top: 0 };
  },
});

router.beforeEach((to, from, next) => {
  const token = localStorage.getItem("token");
  if (!token && to.name !== "login") {
    next("/auth/login");
  } else {
    next();
  }
});
export default router;
