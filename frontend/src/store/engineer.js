import { defineStore } from "pinia";
import { http } from "@/configs/httpCommon";
export const useEngineerStore = defineStore("engineer", {
  state: () => {
    return {};
  },
  actions: {
    receiveReport() {
      return http.get("engineer/reports");
    },
    receive(data) {
      return http.put("engineer/receive", data);
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
