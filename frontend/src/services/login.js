import { http } from "@/configs/httpCommon";
export const login = (data) => {
  return http.post("auth/login", data);
};
