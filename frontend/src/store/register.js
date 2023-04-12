import { defineStore } from "pinia";
import { http } from "@/configs/httpCommon";
export const useRegisterStore = defineStore("register", {
  state: () => {
    return { register: null };
  },
  actions: {
    register(data) {
      return http.post("auth/register", data);
    },
  },
});
