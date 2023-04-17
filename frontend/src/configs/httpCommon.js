import axios from "axios";

export const http = axios.create({
  baseURL: `http://localhost:3000/api/v1/`,
  headers: {
    "Content-Type": "application/json",
  },
});

http.interceptors.request.use((config) => {
  const localToken = localStorage.getItem("token") || "";
  config.headers.Authorization = `Bearer ${localToken}`;
  return config;
});
