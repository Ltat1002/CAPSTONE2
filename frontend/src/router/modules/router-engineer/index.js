import ReportPreview from "@/views/users/report-preview/ReportPreview.vue";
import TheHistory from "@/views/users/components/TheHistory.vue";
import ShowReport from "@/views/engineer/components/ShowReport.vue";
import CompHome from "@/views/users/home/CompHome.vue";
import UploadInformation from "@/views/engineer/UploadInformation.vue";
export const routerEngineer = [
  {
    path: "",
    component: CompHome,
  },
  {
    path: "preview",
    component: ReportPreview,
  },
  {
    path: "history",
    name: "history",
    component: TheHistory,
  },
  {
    path: "upload-information",
    name: "upload-information",
    component: UploadInformation,
  },
  {
    path: "show-report",
    name: "Show-report",
    component: ShowReport,
  },
];
