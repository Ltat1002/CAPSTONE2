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
    getAllReport() {
      return http.get("admin/reports");
    },
    getDetailReport(id) {
      return http.get(`admin/reports/${id}`);
    },
  },
});
