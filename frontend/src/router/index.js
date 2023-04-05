import { createRouter, createWebHistory } from "vue-router";
import HomeLayout from "../views/HomeLayout.vue";
import { routerAuth } from "@/router/modules/router-auth";
import { routerUsers } from "./modules/router-engineer/index.js";
import HomeUser from "@/views/users/HomeUser.vue";
const routes = [
  {
    path: "/",
    name: "home",
    component: HomeUser,
  },
  {
    path: "/engineer",
    name: "engineer",
    component: HomeLayout,
    children: [...routerUsers],
  },
  { ...routerAuth },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
