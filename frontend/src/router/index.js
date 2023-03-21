import { createRouter, createWebHistory } from "vue-router";
import HomeLayout from "../views/HomeLayout.vue";
import { routerAuth } from "@/router/modules/router-auth";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeLayout,
  },
  { ...routerAuth },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
