import AuthenticationManager from "@/views/auth/AuthenticationManager.vue";
import AuthLogin from "@/views/auth/AuthSignin.vue";
import AuthRegister from "@/views/auth/AuthRegister";
export const routerAuth = {
  path: "/auth",
  name: "auth",
  component: AuthenticationManager,
  children: [
    {
      path: "login",
      name: "login",
      component: AuthLogin,
    },
    {
      path: "register",
      name: "register",
      component: AuthRegister,
    },
  ],
};
