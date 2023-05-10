import { defineStore } from "pinia";
import { http } from "@/configs/httpCommon";
export const useAdminStore = defineStore("admin", {
  state: () => {
    return {};
  },
  actions: {
    getAllUser() {
      return http.get("admin/users");
    },
    getUser(id) {
      return http.get(`admin/users/${id}`);
    },
    getAllEngineer() {
      return http.get("admin/show_engineer");
    },
    getAllReport() {
      return http.get("admin/reports");
    },
    getDetailReport(id) {
      return http.get(`admin/reports/${id}`);
    },
    setAcceptCv(id) {
      return http.put("admin/accept_cv", { ...id });
    },
  },
});