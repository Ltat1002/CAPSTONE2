<template lang="">
  <div v-if="!route.path.includes('manage-report/detail-report')">
    <CustomTitle title="Quản lý báo cáo" />

    <DataTable :value="listUser">
      <Column field="fullName" header="Họ và tên"></Column>
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
          </div>
        </template>
      </Column>
      <template #empty>
        <div class="text-center">Không có dữ liệu</div>
      </template>
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
import CustomTitle from "@/components/CustomTitle.vue";

import { useRouter, useRoute } from "vue-router";
const adminStore = useAdminStore();
const router = useRouter();
const route = useRoute();
const listUser = ref();
function getAllReport() {
  adminStore.getAllReport().then((res) => {
    listUser.value = res.data.map((value) => {
      console.log(value);
      return {
        ...value,
        fullName: value.user_send.last_name + " " + value.user_send.first_name,
      };
    });
  });
}
getAllReport();
function handleClickDetail(slot) {
  router.push("/admin/manage-report/detail-report/" + slot.data.id);
}
</script>
<style lang="scss" scoped></style>
