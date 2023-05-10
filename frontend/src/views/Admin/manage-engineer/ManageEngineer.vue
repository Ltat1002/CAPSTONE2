<template lang="">
  <DataTable :value="listEngineer">
    <Column field="id" header="Mã"></Column>
    <Column field="email" header="Email"></Column>
    <Column field="last_name" header="Họ"></Column>
    <Column field="first_name" header="Tên"></Column>
    <Column field="mobile" header="Số điện thoại"></Column>
    <Column field="address" header="Địa chỉ"></Column>
    <Column header="hành động">
      <template #body="slot">
        <div class="flex mx-[-8px]">
          <Button
            icon="pi pi-file-export"
            size="small"
            class="mx-2"
            severity="success"
            @click="handleClickAccept(slot)"
          />
          <Button
            icon="pi pi-trash"
            size="small"
            class="mx-2"
            severity="success"
            @click="handleClickAccept(slot)"
          />
        </div>
      </template>
    </Column>
  </DataTable>
  <!-- <Dialog
    v-model:visible="visible"
    modal
    :header="headerTitle"
    :style="{ width: '50vw' }"
  >
    <AddUser :edit="detailUser" />
  </Dialog> -->
</template>
<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import { toastMessage } from "@/helper/toastMessage";
import { useAdminStore } from "@/store/admin";
import Button from "primevue/button";
import { ref } from "vue";
const adminStore = useAdminStore();
const listEngineer = ref([]);
function getAllEngineer() {
  adminStore.getAllEngineer().then((res) => {
    listEngineer.value = res.data;
  });
}
getAllEngineer();
function handleClickAccept(slot) {
  console.log(slot);
  adminStore
    .setAcceptCv({ id: slot.data.id })
    .then(() => {
      toastMessage("success", "Thành công", "Trở thành engineer thành công");
    })
    .catch(() => {
      toastMessage("error", "Thất bại", "Trở thành engineer thất bại");
    });
  console.log(slot.data.id);
}
</script>
<style lang="scss" scoped></style>
