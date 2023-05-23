<template lang="">
  <CustomTitle title="Dashboard" />
  <!-- <div class="mx-[-5px] mb-5 text-center">
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
  </div> -->
  <main class="main-content">
    <div class="bottom-container">
      <div class="bottom-container__left">
        <div class="box spending-box">
          <div class="header-container">
            <h3 class="section-header">Doanh thu</h3>
            <div class="year-selector">
              <svg
                @click="handlePrev"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <rect
                  opacity="0.8"
                  width="24"
                  height="24"
                  rx="6"
                  fill="#F6F7F9"
                />
                <path
                  d="M13.4999 15.96L10.2399 12.7C9.85492 12.315 9.85492 11.685 10.2399 11.3L13.4999 8.04004"
                  stroke="#1A202C"
                  stroke-width="1.5"
                  stroke-miterlimit="10"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
              </svg>
              <span>{{ year }}</span>
              <svg
                @click="handleNext"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <rect
                  opacity="0.8"
                  width="24"
                  height="24"
                  rx="6"
                  fill="#F6F7F9"
                />
                <path
                  d="M10.4551 15.96L13.7151 12.7C14.1001 12.315 14.1001 11.685 13.7151 11.3L10.4551 8.04004"
                  stroke="#1A202C"
                  stroke-width="1.5"
                  stroke-miterlimit="10"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
              </svg>
            </div>
          </div>
          <div class="bar-chart">
            <div class="w-[700px]">
              <Bar :data="data" :options="options" />
            </div>
          </div>
        </div>
        <div class="box total-box">
          <div class="total-box__left">
            <div class="header-container">
              <h3 class="section-header">Tổng đơn thành công</h3>
              <svg
                class="up-arrow"
                width="42"
                height="42"
                viewBox="0 0 42 42"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <rect width="42" height="42" rx="8" fill="#F6F7F9" />
                <path
                  d="M27.0702 18.57L21.0002 12.5L14.9302 18.57"
                  stroke="#7FB519"
                  stroke-width="2"
                  stroke-miterlimit="10"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
                <path
                  d="M21 29.5V12.67"
                  stroke="#7FB519"
                  stroke-width="2"
                  stroke-miterlimit="10"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
              </svg>
            </div>
            <h1 class="price">
              {{ dataReport[0] }}<span class="price-currency">(VND)</span>
            </h1>
          </div>
          <div class="total-box__right">
            <div class="header-container">
              <h3 class="section-header">Tổng đơn hủy</h3>
              <svg
                width="42"
                height="42"
                viewBox="0 0 42 42"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <rect width="42" height="42" rx="8" fill="#F6F7F9" />
                <path
                  d="M27.0702 23.43L21.0002 29.5L14.9302 23.43"
                  stroke="#FF4423"
                  stroke-width="2"
                  stroke-miterlimit="10"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
                <path
                  d="M21 12.5V29.33"
                  stroke="#FF4423"
                  stroke-width="2"
                  stroke-miterlimit="10"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
              </svg>
            </div>
            <h1 class="price">
              {{ dataReport[1] }}<span class="price-currency">(VND)</span>
            </h1>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>
<script setup>
import { useAdminStore } from "@/store/admin";
// import Button from "primevue/button";
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
import { onMounted, ref } from "vue";
import { Bar } from "vue-chartjs";
const date = new Date();
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
  DoanhThuNam();
  adminStore.getDashboard("/admin/report_counting").then((data) => {
    dataReport.value = [data.data.cancel || 0, data.data.done || 0];
  });
  const navItems = document.querySelectorAll(".side-nav__item");
  const removeClasses = () => {
    navItems.forEach((eachItem) => {
      eachItem.classList.remove("side-nav__item-active");
    });
  };

  navItems.forEach((eachItem) => {
    eachItem.addEventListener("click", function () {
      removeClasses();
      eachItem.classList.add("side-nav__item-active");
    });
  });
});
const year = ref(date.getFullYear());
const DoanhThuNam = async () => {
  console.log(year.value);
  adminStore
    .getDashboard(`/admin/amount_pay_counting?year=${year.value}`)
    .then((val) => {
      data.value = {
        ...data.value,
        datasets: [
          {
            data: Object.values(val.data),
            borderWidth: 2,
            borderRadius: 30,
            barThickness: 12,
            backgroundColor: ["rgba(114, 92, 255, 1)"],
            borderColor: ["rgba(114, 92, 255, 1)"],
            hoverBackgroundColor: ["rgba(28, 30, 35, 1)"],
            hoverBorderColor: ["rgba(28, 30, 35, 1)"],
          },
        ],
      };
    });
};
function handlePrev() {
  year.value = year.value - 1;
  DoanhThuNam();
}
function handleNext() {
  year.value = year.value + 1;
  DoanhThuNam();
}
const data = ref({
  labels: [
    "T1",
    "T2",
    "T3",
    "T4",
    "T5",
    "T6",
    "T7",
    "T8",
    "T9",
    "T10",
    "T11",
    "T12",
  ],
  datasets: [
    {
      data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      borderWidth: 2,
      borderRadius: 30,
      barThickness: 12,
      backgroundColor: ["rgba(114, 92, 255, 1)"],
      borderColor: ["rgba(114, 92, 255, 1)"],
      hoverBackgroundColor: ["rgba(28, 30, 35, 1)"],
      hoverBorderColor: ["rgba(28, 30, 35, 1)"],
    },
  ],
});
const options = ref({
  responsive: true,
  scales: {
    y: {
      beginAtZero: true,
      ticks: {
        // Include a dollar sign in the ticks
        callback: function (value) {
          return value + "đ";
        },
        stepSize: 5,
      },
    },
    x: {
      grid: {
        display: false,
      },
    },
  },
  plugins: {
    legend: {
      display: false,
      labels: {
        font: {
          size: 12,
          family: "'Plus Jakarta Sans', sans-serif",
          lineHeight: 18,
          weight: 600,
        },
      },
    },
  },
});
</script>
<style lang="scss" scoped>
// .p-button {
//   margin-right: 5px;
//   margin-left: 5px;
//   height: 40px;
// }

/* -------------- MAIN CONTENT -------------- */
.main-content {
  display: flex;
  flex-direction: column;
  width: 100%;
  overflow: auto;
}

/* -------------- TOP CONTAINER -------------- */
.top-container {
  border-bottom: 1px solid #f3f5f7;
  padding: 18px 32px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* -------------- SEARCH -------------- */
.search {
  display: flex;
  align-items: center;
  padding: 11px 0 11px 24px;
  max-width: 492px;
  width: 100%;
  border: 1px solid #c3d4e9;
  border-radius: 70px;
  gap: 26px;
  background: #ffffff;
  opacity: 0.8;
}

.search__input {
  border: none;
  outline: none;
  width: calc(100% - 78px);
}

/* -------------- USER NAV -------------- */
.user-nav,
.user-info {
  display: flex;
  align-items: center;
}

.user-name {
  font-weight: 600;
  font-size: 16px;
  line-height: 24px;
  letter-spacing: -2%;
  margin: 0 37px 0 12px;
}

.user-image {
  height: 44px;
  width: 44px;
}

/* -------------- NOTIFICATION -------------- */
.notification {
  border: 1px solid #c3d4e9;
  background-color: transparent;
  position: relative;
  margin-right: 32px;
  height: 44px;
  width: 44px;
  border-radius: 50%;
  padding: 10px;
  cursor: pointer;

  display: flex;
  align-items: center;
  justify-content: center;
}

.notification::after {
  content: "";
  position: absolute;
  width: 10px;
  height: 10px;
  background-color: red;
  border-radius: 50%;
  top: -2px;
  right: 3px;
}

/* -------------- BOTTOM CONTAINER -------------- */
.bottom-container {
  display: flex;
  gap: 24px;
  padding: 32px;
  background-color: #f3f5f7;
}

.box {
  background-color: #ffffff;
  border-radius: 10px;
  padding: 24px;
  margin-bottom: 24px; /*fix later*/
}

.bottom-container__left {
  width: 70%;
}

.bottom-container__right {
  width: 30%;
}

.spending-statistics {
  max-height: 338px;
}

/* -------------- BAR CHART -------------- */
.bar-chart {
  min-height: 223px;
  width: 100%;
  display: flex;
  justify-content: center;
}

/* -------------- HEADER -------------- */
.header-container {
  color: #1a202c;
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;

  font-weight: 600;
  letter-spacing: -2%;
}

.section-header {
  line-height: 24px;
  font-size: 16px;
}

.header-container span {
  line-height: 21px;
  font-size: 14px;
}

.year-selector {
  display: flex;
  align-items: center;
  gap: 24px;
}

.total-box {
  display: flex;
}

.total-box__left {
  border-right: 1px solid #f0f0f0;
  flex: 1;
}

.total-box__right {
  flex: 1;
}

.up-arrow,
.total-box__left {
  margin-right: 24px;
}

.price {
  line-height: 150%;
  margin-bottom: 14px;
}

.price-currency {
  line-height: 21px;
  font-size: 14px;
  font-weight: 600;
  color: #90a3bf;
  margin-left: 8px;
}

.total-box p,
.box p {
  font-weight: 700;
  font-size: 12px;
  line-height: 15px;
  letter-spacing: -0.02em;
  color: #90a3bf;
}

.percentage-increase {
  color: #7fb519;
}

.percentage-decrease {
  color: #ff4423;
}

.date-selector {
  padding: 10px 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid #c3d4e9;
  border-radius: 6px;
}

.date-selector span {
  font-weight: 600;
  font-size: 12px;
  line-height: 15px;
  margin-left: 8px;
}

.transaction-box {
  margin-bottom: 0;
}

.transaction-history {
  width: 100%;
  text-align: left;
  vertical-align: middle;
  margin-top: 24px;
}

/* -------------- TABLE -------------- */
tr > th {
  font-weight: 500;
  font-size: 12px;
  line-height: 150%;
  color: #90a3bf;
  padding-bottom: 24px;
}

tr > td {
  font-weight: 600;
  font-size: 14px;
  letter-spacing: -2%;
  padding: 8px 0;
}

tr > td:first-child {
  display: flex;
  align-items: center;
  gap: 9px;
}

.status {
  margin-right: 8px;
}

/* -------------- BUTTON -------------- */
.button-box {
  display: flex;
  justify-content: space-between;
  margin-top: 56px;
}

.btn {
  padding: 16px 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 15px;
  border: none;
  border-radius: 10px;
  cursor: pointer;
}

.btn-purple {
  background-color: #7c5cfc;
  color: white;
}

.btn-white {
  background-color: white;
  color: black;
  border: 2px solid #7c5cfc;
}

/* -------------- PIE CHART -------------- */
.pie-chart {
  height: 220px;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.spending-box {
  position: relative;
}

.overall-spending {
  position: absolute;
  transform: translate(-50%, -50%);
  top: 32%;
  left: 50%;
  text-align: center;
}

.overall-spending > h4 {
  color: #596780;
  font-weight: 500;
  font-size: 14px;
  line-height: 150%;
}

.overall-spending > span {
  font-weight: 700;
  font-size: 24px;
  line-height: 150%;
}

.pie-chart__labels {
  display: flex;
  flex-direction: column;
  gap: 17px;
  margin-top: 40px;
}

.pie-chart__labels-item {
  font-weight: 600;
  font-size: 14px;
  line-height: 150%;
}

.pie-chart__labels-item,
.label {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.label {
  gap: 12px;
  font-weight: 600;
  font-size: 12px;
  line-height: 15px;
  color: #596780;
}

.label__color {
  width: 12px;
  height: 12px;
  border-radius: 50%;
}

.first {
  background: #eb7ca6;
}

.second {
  background: #ffacc8;
}

.third {
  background: #cc6ff8;
}

.fourth {
  background: #7c5cfc;
}

.fifth {
  background: #5caffc;
}

.sixth {
  background: #a1a9fe;
}

@media (max-width: 1300px) {
  .bottom-container {
    flex-direction: column;
    height: auto;
  }

  .bottom-container__left,
  .bottom-container__right {
    width: 100%;
  }

  .btn {
    width: 45%;
  }
}

@media (max-width: 900px) {
  .top-container {
    gap: 24px;
  }
  .total-box {
    flex-direction: column;
  }

  .total-box__left {
    margin-right: 0;
    border-right: none;
    border-bottom: 1px solid #f3f5f7;
    padding-bottom: 24px;
    margin-bottom: 24px;
  }

  .up-arrow {
    margin-right: 0;
  }
}

@media (max-width: 780px) {
  .top-container {
    flex-direction: column;
    gap: 18px;
  }

  .user-nav {
    justify-content: space-between;
  }

  .section-header {
    font-size: 18px;
  }

  table,
  tbody,
  th,
  td,
  tr {
    display: block;
  }

  tr > th {
    position: absolute;
    top: -9999px;
    left: -9999px;
  }

  td {
    /* Behave  like a "row" */
    border: none;
    border-bottom: 1px solid #f3f5f7;
    position: relative;
    padding-left: 50%;
  }

  td::before {
    position: absolute;
    left: 0;
  }

  tr > td {
    text-align: end;
  }

  tr > td:first-child {
    justify-content: end;
  }

  td:nth-of-type(1):before {
    content: "Transactions";
  }
  td:nth-of-type(2):before {
    content: "Date";
  }
  td:nth-of-type(3):before {
    content: "Amount";
  }
  td:nth-of-type(4):before {
    content: "Status";
  }

  .total-box p,
  .box p {
    font-size: 14px;
  }

  .pie-chart__labels-item {
    font-size: 16px;
  }
}

@media (max-width: 600px) {
  .sidebar {
    display: none;
  }

  .year-selector {
    gap: 12px;
  }

  .button-box {
    flex-direction: column;
    gap: 20px;
    margin-top: 28px;
  }

  .btn {
    width: 100%;
    font-size: 15px;
  }
}
</style>
