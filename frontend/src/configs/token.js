import http from "@/configs/httpCommon";
export const instanceToken = () => {
  const localToken = localStorage.getItem("token") || "";
  if (localToken) {
    http.defaults.headers.common["Authorization"] = `Bearer ${localToken}`;
  }
};
