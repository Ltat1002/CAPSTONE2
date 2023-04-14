<template lang="">
  <div class="wrap my-5">
    <div class="flex gap-5">
      <div class="form flex-1 flex flex-col">
        <MultiSelect
          v-model="selectedDevices"
          :options="deviceList"
          filter
          optionLabel="name"
          placeholder="Chọn thiết bị"
          :maxSelectedLabels="3"
          class="w-full md:w-20rem mb-4"
        />
        <Editor v-model="value" class="flex-1" editorStyle="height: 320px" />
      </div>
      <div class="flex-1 h-[500px]">
        <div class="h-[416px] overflow-hidden"><map-comp></map-comp></div>
        <div
          class="h-[60px] mt-4 border border-solid border-[#fff] w-full bg-[#3e6363] text-white rounded-md px-3 overflow-y-auto flex items-center"
        >
          Địa chỉ của bạn: Tổ 4, thôn quan nam 2, Xã hoà liên, huyện hoà vang,
          TP Đà Nẵng
        </div>
      </div>
    </div>
    <div class="text-end">
      <Button
        class="mt-3 sign_up"
        type="button"
        label="ĐĂNG KÝ"
        size="small"
        :loading="loading"
        @click="handleRegisterEngineer"
      />
    </div>
  </div>
</template>
<script setup>
import Editor from "primevue/editor";
import MultiSelect from "primevue/multiselect";
import MapComp from "./components/MapComp.vue";
import Button from "primevue/button";
import { ref, watch } from "vue";
const value = ref("");
const loading = ref(false);
const deviceList = ref([
  { name: "New York", code: "NY" },
  { name: "Rome", code: "RM" },
  { name: "London", code: "LDN" },
  { name: "Istanbul", code: "IST" },
  { name: "Paris", code: "PRS" },
]);
const selectedDevices = ref([]);

function handleRegisterEngineer() {
  loading.value = true;
  setTimeout(() => {
    loading.value = false;
  }, 2000);
}

watch(selectedDevices, () => {
  console.log(selectedDevices.value[0].name);
});
</script>
<style lang="scss" scoped>
.p-editor-container {
  display: flex;
  flex-direction: column;
  :deep(.p-editor-content) {
    flex: 1;
  }
}
</style>
