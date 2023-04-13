import { defineStore } from "pinia";
import { http } from "@/configs/httpCommon";
export const useRegisterStore = defineStore("register", {
  state: () => {
    return { account: null };
  },
  actions: {
    register(data) {
      return http.post("auth/register", data);
    },
    login(data) {
      return http.post("auth/login", data).then((data) => {
        this.account = data;
      });
    },
  },
});
