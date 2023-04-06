import ReportProblem from "@/views/users/report-problem/ReportProblem.vue";
import VoucherProblem from "@/views/users/voucher-giveaway/VoucherProblem.vue";
export const routerUsers = [
  {
    path: "/report-problem",
    name: "/report-problem",
    component: ReportProblem,
  },
  {
    path: "/voucher",
    name: "/voucher",
    component: VoucherProblem,
  },
];
