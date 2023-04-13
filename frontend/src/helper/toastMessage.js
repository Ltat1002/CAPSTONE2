import { app } from "@/main";
export const toastMessage = (type, summary, detail) => {
  app.config.globalProperties.$toast.add({
    severity: type,
    summary: summary,
    detail: detail,
    life: 3000,
  });
};
