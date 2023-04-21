<template lang="">
  <div class="device--name">
    <div class="content">
      <!-- <h1 class="heading">Thiết bị</h1> -->
      <div v-if="loading" class="text-center"><TheLoading /></div>
      <div v-else class="image-container">
        <TheDevice
          @chooseDevice="handleDeviceEmit"
          v-for="value in device"
          :key="value.id"
          :device="value"
        />
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref } from "vue";
import TheDevice from "../components/TheDevice.vue";
import { useReportStore } from "@/store/report.js";
import { useRouter } from "vue-router";
import TheLoading from "@/components/TheLoading.vue";
const router = useRouter();
const reportStore = useReportStore();
const device = ref();
const loading = ref(false);
const dataRepair = async () => {
  loading.value = true;
  reportStore
    .repairEquipments()
    .then((res) => {
      device.value = res.data;
    })
    .finally(() => {
      loading.value = false;
    });
};
dataRepair();
function handleDeviceEmit(id) {
  reportStore.report.repair_equipment_id = id;
  router.push(`report-problem/description/${id}`);
}
</script>
<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600&display=swap");

.heading {
  font-size: 2.5rem;
  color: var(--red);
  text-align: center;
  margin: 20px 0;
}
.image-container {
  display: flex;
  flex-wrap: wrap;
  margin-right: -10px;
  margin-left: -10px;
}
.device--name {
  display: flex;
  flex-direction: column;
  margin: 30px 0px;
}
.content {
  margin-top: 10px;
}
.side-bar {
  margin: 0 20px;
  margin-top: 44px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  > div {
    display: flex;
    flex-direction: column;
    width: 25%;
    margin-right: -20px;
    margin-left: -20px;
    label {
      font-size: 1rem;
      font-weight: 500;
    }
    input {
      height: 35px;
      width: 100%;
      padding: 0px 20px;
    }
  }
}
:deep(.p-dropdown) {
  width: 100%;
  height: 35px;
  display: flex;
  align-items: center;
}
</style>
