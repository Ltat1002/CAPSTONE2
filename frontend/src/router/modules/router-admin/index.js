import ManageUsers from "@/views/Admin/manage-users/ManageUsers.vue";
import ManageReport from "@/views/Admin/manage-report/ManageReport.vue";
import DetailReport from "@/views/Admin/manage-report/DetailReport.vue";
import ManageEngineer from "@/views/Admin/manage-engineer/ManageEngineer.vue";
import RepairEquipments from "@/views/Admin/repair-equipments/RepairEquipments.vue";
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
  {
    path: "manage-engineer",
    name: "manage-engineer",
    component: ManageEngineer,
  },
  {
    path: "repair-equipments",
    name: "repair-equipments",
    component: RepairEquipments,
  },
];
