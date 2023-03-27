<template lang="">
  <div>
    <div class="wrap">
      <div class="devices">
        <DeviceRepair v-for="index in 6" :key="index" />
      </div>
    </div>
  </div>
</template>
<script setup>
import DeviceRepair from "./DeviceRepair.vue";
</script>
<style lang="scss" scoped>
.devices {
  display: flex;
  flex-wrap: wrap;
  margin-right: -20px;
  margin-left: -20px;
  border-radius: 10px;
}
</style>
