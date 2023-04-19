import { defineStore } from "pinia";
import { http } from "@/configs/httpCommon";
export const useReportStore = defineStore("equipments", {
  state: () => {
    return {
      report: {
        repair_equipment_id: "",
        name: "",
        mobile: "",
        address: "",
        description: "",
        images: "",
        img: [],
      },
    };
  },
  actions: {
    repairEquipments() {
      return http.get("/repair_equipments");
    },
    reportHistoryRepair() {
      return http.get("/reports");
    },
  },
});
