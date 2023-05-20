import ReportPreview from "@/views/users/report-preview/ReportPreview.vue";
import TheHistory from "@/views/users/components/TheHistory.vue";
import ShowReport from "@/views/engineer/components/ShowReport.vue";
import CompHome from "@/views/users/home/CompHome.vue";
import UploadInformation from "@/views/engineer/UploadInformation.vue";
const ReceiveReport = () =>
  import("@/views/users/components/ReceiveReport.vue");
export const routerEngineer = [
  {
    path: "",
    component: CompHome,
  },
  // {
  //   path: "preview",
  //   component: ReportPreview,
  // },
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
    path: "my-report",
    name: "my-report",
    component: ReceiveReport,
    children: [
      {
        path: "preview/:id",
        component: ReportPreview,
      },
    ],
  },
  {
    path: "receive-report",
    name: "receive-report",
    component: ReceiveReport,
    children: [
      {
        path: "preview/:id",
        component: ReportPreview,
      },
    ],
  },

  {
    path: "show-report",
    name: "Show-report",
    component: ShowReport,
  },
];
