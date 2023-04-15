import { defineStore } from "pinia";
import { useRouter } from "vue-router";
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
      const router = useRouter();
      return http
        .get("profile")
        .then((data) => {
          this.account = data.data;
        })
        .catch(() => {
          router.push("/");
          localStorage.removeItem("token");
        });
    },
    setAccount(account) {
      this.account = account;
    },
  },
});
