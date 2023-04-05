import { createRouter, createWebHistory } from "vue-router";
import HomeLayout from "../views/engineer/HomeLayout.vue";
import { routerAuth } from "@/router/modules/router-auth";
import { routerUsers } from "./modules/router-users/index.js";
import HomeUser from "@/views/users/HomeUser.vue";
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
  },
  { ...routerAuth },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
