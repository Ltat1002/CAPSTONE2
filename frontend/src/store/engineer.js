import { defineStore } from "pinia";
import { http } from "@/configs/httpCommon";
import { useStorage } from "@vueuse/core";
export const useEngineerStore = defineStore("engineer", {
  state: () => {
    return {
      repair: useStorage("repair", {}, localStorage),
    };
  },
  actions: {
    setRepair(data) {
      this.repair = data;
    },
    receiveReport() {
      return http.get("engineer/reports");
    },
    receive(data) {
      return http.put("engineer/receive", data);
    },
    updateRPForUser(data, id) {
      return http.put(`reports/${id}`, data);
    },
    getReportByListId(ids) {
      console.log(ids);
      return http.post("show_all_report", {
        id: ids,
      });
    },
    offer(data) {
      return http.put("engineer/offer", data);
    },
    getAllEngineer() {
      return http.get("all_engineer");
    },
  },
});
