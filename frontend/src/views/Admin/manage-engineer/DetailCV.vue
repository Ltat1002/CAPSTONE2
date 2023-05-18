<template lang="">
  <div class="wrap" :class="{ 'my-5': !pathProfile }">
    <div class="flex gap-5" :class="{ 'flex-col-reverse': pathProfile }">
      <div class="form flex-1 flex flex-col">
        <Dropdown
          v-model="selectedDevices"
          :options="deviceList"
          filter
          optionValue="id"
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
          <map-comp
            :coor="coor"
            @setAddress="setAddress"
            :pathProfile="pathProfile"
          ></map-comp>
        </div>
        <div
          class="h-[60px] address mt-4 border border-solid border-[#fff] w-full text-white rounded-md px-3 overflow-y-auto flex items-center"
        >
          Địa chỉ của bạn: {{ address }}
        </div>
      </div>
    </div>
    <div class="text-end hidden" @click="handleRegisterEngineer"></div>
  </div>
</template>
<script setup>
import Dropdown from "primevue/dropdown";
import Editor from "primevue/editor";
import MapComp from "@/views/engineer/components/MapComp.vue";
import { ref, computed, onMounted } from "vue";
import { useEquipmentsStore } from "@/store/equipments";
import { useRegisterStore } from "@/store/register";
import { toastMessage } from "@/helper/toastMessage";
import { useRouter, useRoute } from "vue-router";
import { useAdminStore } from "@/store/admin.js";
const adminStore = useAdminStore();
const equipmentStore = useEquipmentsStore();
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
const selectedDevices = ref();
const coor = ref({});
let coordinates;

function setAddress(addressProps, coor) {
  console.log(coor);
  address.value = addressProps;
  coordinates = coor;
}
function fetchData() {
  adminStore.getReport(route.params.id).then((data) => {
    description.value = data.data.description.body;
    selectedDevices.value = data.data.repair_equipment_id;
    address.value = data.data.address;
    console.log(data);
  });
}
function handleRegisterEngineer() {
  console.log(selectedDevices.value);
  loading.value = true;
  const data = {
    repair_equipment_id: selectedDevices.value,
    latitude: coordinates?.lat || "",
    longitude: coordinates?.lng || "",
    description: description.value,
    role: "user",
    address: address.value,
    status: 1,
  };
  setTimeout(() => {
    register
      .updateProfile({ ...register.account, ...data })
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

equipmentStore.getEquipments().then((data) => {
  deviceList.value = data.data;
  if (pathProfile.value) {
    console.log(register.account);
    selectedDevices.value = register.account.repair_equipment_id;
    description.value = register.account.description.body || "";
    coor.value = {
      lat: register.account.latitude,
      lng: register.account.longitude,
    };
    // address.value = register.account.address;
    setAddress(register.account.address, {
      lat: register.account.latitude,
      lng: register.account.longitude,
    });
  }
});
onMounted(() => {
  fetchData();
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
