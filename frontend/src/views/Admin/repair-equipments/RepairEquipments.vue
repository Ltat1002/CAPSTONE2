<template lang="">
  <CustomTitle title="Quản lý thiết bị" />

  <div class="flex justify-end mb-4">
    <Button
      icon="pi pi-plus"
      size="small"
      @click="addRepair"
      class="mx-2"
      severity="success"
    />
  </div>
  <DataTable :value="listRepairEquipment">
    <Column field="id" header="Mã"></Column>
    <Column field="name" header="Tên thiết bị"></Column>
    <Column field="description" header="mô tả"></Column>
    <Column field="created_at" header="Ngày tạo">
      <template #body="slot">
        <div>
          {{
            new Date(slot.data.created_at).toLocaleDateString("en-GB", {
              day: "numeric",
              month: "numeric",
              year: "numeric",
            })
          }}
        </div>
      </template>
    </Column>
    <Column field="updated_at" header="Ngày sửa">
      <template #body="slot">
        <div>
          {{
            new Date(slot.data.updated_at).toLocaleDateString("en-GB", {
              day: "numeric",
              month: "numeric",
              year: "numeric",
            })
          }}
        </div>
      </template>
    </Column>
    <Column header="hành động">
      <template #body="slot">
        <div class="flex mx-[-8px]">
          <Button
            icon="pi pi-file-export"
            size="small"
            class="mx-2"
            severity="success"
            @click="handleClickUpdate(slot)"
          />
          <Button
            icon="pi pi-trash"
            size="small"
            class="mx-2"
            severity="success"
          />
        </div>
      </template>
    </Column>
    <template #empty>
      <div class="text-center">Không có dữ liệu</div>
    </template>
  </DataTable>
  <Dialog
    v-model:visible="adminStore.repair"
    modal
    :header="headerTitle"
    :style="{ width: '50vw' }"
  >
    <AddRepair :edit="detail" :check="check" />
  </Dialog>
</template>
<script setup>
import DataTable from "primevue/datatable";
import AddRepair from "./AddRepair.vue";
import Column from "primevue/column";
// import { toastMessage } from "@/helper/toastMessage";
import CustomTitle from "@/components/CustomTitle.vue";

import { useAdminStore } from "@/store/admin";
import Button from "primevue/button";
import Dialog from "primevue/dialog";
import { ref, watch, onMounted } from "vue";
const detail = ref();
const headerTitle = ref();
const adminStore = useAdminStore();
const listRepairEquipment = ref([]);
function getRepairEquipment() {
  adminStore.getRepairEquipment().then((res) => {
    listRepairEquipment.value = res.data;
  });
}
watch(
  () => adminStore.repair,
  () => {
    getRepairEquipment();
  }
);
onMounted(() => {
  getRepairEquipment();
});
const check = ref();
function addRepair() {
  check.value = true;
  adminStore.repair = true;
  detail.value = { name: "", photo: "", description: "" };
  headerTitle.value = "Thêm thiết bị";
}
function handleClickUpdate(slot) {
  check.value = false;
  headerTitle.value = "Chỉnh sửa thiết bị";
  adminStore.repair = true;
  detail.value = slot.data;
}
</script>
<style lang="scss" scoped></style>
