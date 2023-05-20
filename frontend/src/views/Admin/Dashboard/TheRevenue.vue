<template lang="">
  <CustomTitle title="Dashboard" />
  <div class="mx-[-5px] mb-5 text-center">
    <Button label="Năm trước" icon="pi pi-step-backward-alt" />
    <Button label="Năm hiện tại" severity="secondary" icon="pi pi-pause" />
    <Button
      label="Năm tiếp theo"
      severity="success"
      icon="pi pi-step-forward-alt"
    />
  </div>
  <div class="flex justify-between">
    <div class="w-[60%]"><Bar :data="data" :options="options" /></div>
    <div class="w-[30%]"><Pie :data="pie" :options="options" /></div>
  </div>
</template>
<script setup>
import { useAdminStore } from "@/store/admin";
import Button from "primevue/button";
import CustomTitle from "@/components/CustomTitle.vue";

import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
  ArcElement,
} from "chart.js";
import { Bar } from "vue-chartjs";
import { ref, onMounted, computed } from "vue";
import { Pie } from "vue-chartjs";
const adminStore = useAdminStore();
ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
  ArcElement
);
const dataReport = ref([0, 0]);
onMounted(() => {
  adminStore.getDashboard("/admin/report_counting").then((data) => {
    dataReport.value = [data.data.cancel || 0, data.data.done || 0];
  });
});

const pie = computed(() => {
  return {
    labels: ["Thành công", "Thất bại"],
    datasets: [
      {
        backgroundColor: ["#41B883", "#E46651"],
        data: [...dataReport.value],
      },
    ],
  };
});

const data = ref({
  labels: [
    "January",
    "February",
    "March",
    "Apr",
    "May",
    "jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ],
  datasets: [
    {
      label: "Doanh thu",
      backgroundColor: "#f87979",
      data: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120],
    },
  ],
});
const options = ref({
  responsive: true,
});
</script>
<style lang="scss" scoped>
.p-button {
  margin-right: 5px;
  margin-left: 5px;
  height: 40px;
}
</style>
