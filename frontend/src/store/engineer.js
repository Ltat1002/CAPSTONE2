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
  },
});
