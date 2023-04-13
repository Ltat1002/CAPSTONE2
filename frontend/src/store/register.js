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
      return http.post("auth/login", data);
    },
    profile() {
      return http.get("profile").then((data) => {
        this.account = data.data;
        console.log(data);
      });
    },
    setAccount(account) {
      this.account = account;
    },
  },
});
