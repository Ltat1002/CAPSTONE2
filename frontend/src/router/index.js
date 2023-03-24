import { createRouter, createWebHistory } from "vue-router";
import HomeLayout from "../views/HomeLayout.vue";
import { routerAuth } from "@/router/modules/router-auth";
import { routerUsers } from "./modules/router-users/index";
import HomeUser from "@/views/users/components/HeaderUser.vue";
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
