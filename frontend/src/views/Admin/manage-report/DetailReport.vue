<template lang="">
  <div class="card">
    <DataTable :value="listUser" ref="dt">
      <Column field="user_send.first_name" header="Họ"></Column>
      <Column field="user_send.last_name" header="Tên"></Column>
      <Column field="user_send.email" header="Email"></Column>
      <Column field="repair_equipment.name" header="Tên thiết bị"></Column>
      <Column field="mobile" header="SDT"></Column>
      <Column field="address" header="Địa chỉ"></Column>
      <Column header="hành động">
        <template #body="slot">
          <div class="flex mx-[-8px]">
            <Button
              icon="pi pi-file"
              size="small"
              class="mx-2"
              severity="success"
              @click="handleClickDetail(slot)"
            />
            <Button
              icon="pi pi-file-edit"
              size="small"
              class="mx-2"
              severity="success"
              @click="handleClickUpdate($event)"
            />
            <Button
              icon="pi pi-trash"
              size="small"
              class="mx-2"
              severity="danger"
            />
          </div>
        </template>
      </Column>
    </DataTable>
  </div>
</template>
<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import { useAdminStore } from "@/store/admin";
// import Row from "primevue/row";
import Button from "primevue/button";
import { ref } from "vue";
const dt = ref();
const adminStore = useAdminStore();
const listUser = ref();
function getDetailReport() {
  adminStore.getDetailReport().then((res) => {
    listUser.value = res.data;
    console.log(res);
  });
}
const handleClickUpdate = () => {
  console.log(1);
  dt.value.exportCSV();
};
getDetailReport();
</script>
<style lang="scss" scoped></style>
