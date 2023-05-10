import { defineStore } from "pinia";
export const useLoadingStore = defineStore("loading", {
  state: () => {
    return {
      load: false,
    };
  },
  actions: {
    setLoad(val) {
      this.state = val;
    },
  },
});
