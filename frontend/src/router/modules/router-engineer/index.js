import ReportPreview from "@/views/users/report-preview/ReportPreview.vue";
import TheHistory from "@/views/users/components/TheHistory.vue";
export const routerEngineer = [
  {
    path: "preview",
    name: "preview",
    component: ReportPreview,
  },
  {
    path: "history",
    name: "history",
    component: TheHistory,
  },
];
