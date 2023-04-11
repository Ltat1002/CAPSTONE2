import ReportProblem from "@/views/users/report-problem/ReportProblem.vue";
import CompHome from "@/views/users/home/CompHome.vue";
import DeviceType from "@/views/users/report-problem/DeviceType.vue";
import DeviceName from "@/views/users/report-problem/DeviceName.vue";
import DeviceProblem from "@/views/users/report-problem/DeviceProblem.vue";
import DeviceLocation from "@/views/users/report-problem/DeviceLocation.vue";
import DeviceDescription from "@/views/users/report-problem/DeviceDescription.vue";
import TheProfile from "@/views/users/components/TheProfile.vue";
import EditProfile from "@/views/users/components/EditProfile.vue";
import TimeLine from "@/views/users/components/TimeLine.vue";
import TheHistory from "@/views/users/components/TheHistory.vue";

import TheNotify from "@/components/TheNotify.vue";
import ReportPreview from "@/views/users/ReportPreview";
export const routerUsers = [
  {
    path: "/",
    component: CompHome,
  },
  {
    path: "/profile",
    component: TheProfile,
  },
  {
    path: "/time-line",
    component: TimeLine,
  },
  {
    path: "/history",
    component: TheHistory,
  },
  {
    path: "/notify",
    component: TheNotify,
  },
  {
    path: "/edit-profile",
    component: EditProfile,
  },
  {
    path: "/report-problem",
    component: ReportProblem,
    children: [
      {
        path: "",
        component: DeviceType,
      },
      {
        path: "device",
        component: DeviceName,
      },
      {
        path: "problem",
        component: DeviceProblem,
      },
      {
        path: "location",
        component: DeviceLocation,
      },
      {
        path: "description",
        component: DeviceDescription,
      },
    ],
  },
  {
    path: "/preview",
    component: ReportPreview,
  },
];
