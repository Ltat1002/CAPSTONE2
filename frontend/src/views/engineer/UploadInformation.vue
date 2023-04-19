<template lang="">
  <div class="wrap" :class="{ 'my-5': !pathProfile }">
    <div class="flex gap-5" :class="{ 'flex-col-reverse': pathProfile }">
      <div class="form flex-1 flex flex-col">
        <Dropdown
          v-model="selectedDevices"
          :options="deviceList"
          filter
          optionLabel="name"
          placeholder="Chọn thiết bị"
          class="w-full md:w-20rem mb-4"
        />
        <Editor
          v-model="description"
          class="flex-1"
          editorStyle="height: 350px"
        />
      </div>
      <div class="flex-1 h-[500px]">
        <div class="h-[416px] overflow-hidden">
          <map-comp :coor="coor" @setAddress="setAddress"></map-comp>
        </div>
        <div
          class="h-[60px] address mt-4 border border-solid border-[#fff] w-full text-white rounded-md px-3 overflow-y-auto flex items-center"
        >
          Địa chỉ của bạn: {{ address }}
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
import Dropdown from "primevue/dropdown";
import Editor from "primevue/editor";
import MapComp from "./components/MapComp.vue";
import Button from "primevue/button";
import { ref, watch, computed } from "vue";
import { useEquipmentsStore } from "@/store/equipments";
import { useRegisterStore } from "@/store/register";
import { toastMessage } from "@/helper/toastMessage";
import { useRouter, useRoute } from "vue-router";
const equipments = useEquipmentsStore();
const register = useRegisterStore();
const router = useRouter();
const route = useRoute();
const pathProfile = computed(() => {
  return route.path.includes("profile");
});
const description = ref("");
const loading = ref(false);
const address = ref("");
const deviceList = ref([]);
const selectedDevices = ref([]);
const coor = ref({});
let coordinates;

if (pathProfile.value) {
  selectedDevices.value = register.account.repair_equipment;
  description.value = register.account.description;
  coor.value = {
    lat: register.account.latitude,
    lng: register.account.longitude,
  };
}

function setAddress(addressProps, coor) {
  address.value = addressProps;
  coordinates = coor;
}

function handleRegisterEngineer() {
  loading.value = true;
  const data = {
    repair_equipment_id: selectedDevices.value.id,
    latitude: coordinates?.lat || "",
    longitude: coordinates?.lng || "",
    description: description.value,
    role: "engineer",
    status: 2,
  };
  console.log(data);
  setTimeout(() => {
    register
      .updateProfile(data)
      .then((data) => {
        console.log(data);
        router.push("/");
        register.profile();
        toastMessage("success", "Thành công", "Đăng ký thành công");
      })
      .catch(() => {
        toastMessage("error", "Thất bại", "Đăng ký thất bại");
      })
      .finally(() => {
        loading.value = false;
      });
  }, 2000);
}

equipments.getEquipments().then((data) => {
  console.log(data.data);
  deviceList.value = data.data;
});

watch(selectedDevices, () => {
  console.log(selectedDevices.value);
});
</script>
<style lang="scss" scoped>
.p-editor-container {
  display: flex;
  min-height: 350px;
  flex-direction: column;
  :deep(.p-editor-content) {
    flex: 1;
  }
}

:deep(.p-multiselect) {
  background-color: #567e7e;
  .p-multiselect-label.p-placeholder,
  .p-multiselect-trigger {
    color: #fff;
  }
}
.address {
  background-color: #3e6363;
}
</style>
