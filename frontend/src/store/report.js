import { defineStore } from "pinia";
import { http } from "@/configs/httpCommon";
export const useReportStore = defineStore("reports", {
  state: () => {
    return {
      report: {
        repair_equipment_id: "",
        name: "",
        mobile: "",
        address: "",
        description: "",
        images: [],
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
    getReportDetail(path, id) {
      const pt = path.includes("admin")
        ? "admin/reports"
        : path.includes("engineer")
        ? "engineer/reports"
        : "reports";
      return http.get(`${pt}/${id}`);
    },
    searchReport(search) {
      return http.get(`/search?search=${search}`);
    },
  },
});
