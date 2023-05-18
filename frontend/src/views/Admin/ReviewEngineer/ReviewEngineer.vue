<template lang="">
  <div class="flex justify-end mb-4">
    <Button
      icon="pi pi-plus"
      size="small"
      @click="addRepair"
      class="mx-2"
      severity="success"
    />
  </div>
  <DataTable :value="listReview">
    <Column field="id" header="Mã"></Column>
    <Column field="name" header="Tên thiết bị"></Column>
    <Column field="description" header="mô tả"></Column>
    <Column field="created_at" header="Ngày tạo"></Column>
    <Column field="updated_at" header="Ngày sửa"></Column>
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
</template>
<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import { useAdminStore } from "@/store/admin";
import Button from "primevue/button";
import { ref, watchEffect } from "vue";
const detail = ref();
const headerTitle = ref();
const adminStore = useAdminStore();
const listReview = ref([]);
function getReviewEngineer() {
  adminStore.getReviewEngineer().then((res) => {
    listReview.value = res.data;
  });
}
watchEffect(() => {
  getReviewEngineer();
});
const check = ref();
function addRepair() {
  check.value = true;
  adminStore.repair = true;
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
