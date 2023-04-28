import ManageUsers from "@/views/Admin/manage-users/ManageUsers.vue";
import ManageReport from "@/views/Admin/manage-report/ManageReport.vue";
import DetailReport from "@/views/Admin/manage-report/DetailReport.vue";
export const routerAdmin = [
  {
    path: "manage-users",
    name: "manage-users",
    component: ManageUsers,
  },
  {
    path: "manage-report",
    name: "manage-report",
    component: ManageReport,
    children: [
      {
        path: "detail-report/:id",
        name: "detail-report",
        component: DetailReport,
      },
    ],
  },
];
