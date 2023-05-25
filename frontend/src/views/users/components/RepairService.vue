<template lang="">
  <div class="repair">
    <div class="wrap">
      <div class="content">
        <div class="head_repair">
          <div class="border-left"></div>
          <h5>DỊCH VỤ CỦA CHÚNG TÔI</h5>
        </div>
        <h2>Chúng tôi sẽ làm gì</h2>
      </div>
      <div class="service wrap">
        <service-item
          v-for="(value, index) in dataRe"
          :key="index"
          :data="value"
        />
      </div>
    </div>
  </div>
</template>
<script setup>
import ServiceItem from "./ServiceItem.vue";
import { useReportStore } from "@/store/report";
import { onMounted, ref } from "vue";
const reportStore = useReportStore();
const dataRe = ref([]);
onMounted(() => {
  reportStore.repairEquipments().then((data) => {
    dataRe.value = data?.data?.filter((e, index) => {
      return index < 8;
    });
  });
});
</script>
<style lang="scss" scoped>
.content {
  width: 70%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.service {
  cursor: pointer;
  margin-top: 40px;
  display: flex;
  flex-wrap: wrap;
  margin-right: -10px;
  margin-left: -10px;
}
.repair {
  background-color: #222431;
  padding: 100px 0 100px;
}
.head_repair {
  display: flex;
  align-items: center;
  h5 {
    font-size: 45px;
    line-height: 75px;
    font-weight: 900;
    text-transform: uppercase;
    letter-spacing: 0;
    color: var(--red);
  }
}
h2 {
  font-size: 1.8rem;
  line-height: 1.2em;
  font-weight: 900;
  text-transform: none;
  color: #fff;
}
p {
  font-size: 18px;
  color: #fff;
}
</style>
