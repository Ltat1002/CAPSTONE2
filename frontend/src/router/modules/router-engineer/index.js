import ReportPreview from "@/views/users/report-preview/ReportPreview.vue";
import TheHistory from "@/views/users/components/TheHistory.vue";
import ShowReport from "@/views/engineer/components/ShowReport.vue";
import CompHome from "@/views/users/home/CompHome.vue";
import UploadInfomation from "@/views/engineer/UploadInformation.vue";
export const routerEngineer = [
  {
    path: "",
    component: CompHome,
  },
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
  {
    path: "upload-information",
    component: UploadInfomation,
  },
  {
    path: "show-report",
    name: "ShowReport",
    component: ShowReport,
  },
];
