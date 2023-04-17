import { defineStore } from "pinia";
import { http } from "@/configs/httpCommon";
export const useEquipmentsStore = defineStore("equipments", {
  state: () => {
    return {};
  },
  actions: {
    getEquipments() {
      return http.get("repair_equipments");
    },
  },
});
