import ReportProblem from "@/views/users/report-problem/ReportProblem.vue";
import CompHome from "@/views/users/home/CompHome.vue";
export const routerUsers = [
  {
    path: "/",
    component: CompHome,
  },
  {
    path: "/report-problem",
    component: ReportProblem,
  },
];
