<template lang="">
  <div v-if="!route.path.includes('manage-report/detail-report')">
    <DataTable :value="listUser">
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
  <div v-else>
    <router-view></router-view>
  </div>
</template>
<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import { useAdminStore } from "@/store/admin";
import Button from "primevue/button";
import { ref } from "vue";
import { useRouter, useRoute } from "vue-router";
const adminStore = useAdminStore();
const router = useRouter();
const route = useRoute();
const listUser = ref();
function getAllReport() {
  adminStore.getAllReport().then((res) => {
    listUser.value = res.data;
  });
}
getAllReport();
function handleClickDetail(slot) {
  router.push("/admin/manage-report/detail-report/" + slot.data.id);
}
</script>
<style lang="scss" scoped></style>
