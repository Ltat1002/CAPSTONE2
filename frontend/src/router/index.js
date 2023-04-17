import { createRouter, createWebHistory } from "vue-router";
import HomeLayout from "../views/engineer/HomeLayout.vue";
import { routerAuth } from "@/router/modules/router-auth";
import { routerUsers } from "./modules/router-users/index.js";
import HomeUser from "@/views/users/HomeUser.vue";
// import { useRegisterStore } from "@/store/register";
import { routerEngineer } from "./modules/router-engineer/index";
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
  // console.log(!token && (to.name !== "login" ||));
  if (!token && to.name !== "login" && to.name !== "home") {
    next("/auth/login");
  } else {
    next();
  }
});
export default router;
