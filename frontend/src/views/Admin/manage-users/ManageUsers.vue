<template lang="">
  <div class="card">
    <DataTable :value="listUser">
      <Column field="id" header="Mã"></Column>
      <Column field="email" header="Email"></Column>
      <Column field="last_name" header="Họ"></Column>
      <Column field="first_name" header="Tên"></Column>
      <Column field="mobile" header="Số điện thoại"></Column>
      <Column field="address" header="Địa chỉ"></Column>
      <Column field="onl_status" header="Trạng thái"></Column>
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
  <Dialog
    v-model:visible="visible"
    modal
    :header="headerTitle"
    :style="{ width: '50vw' }"
  >
    <AddUser :edit="detailUser" />
  </Dialog>
</template>
<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import Dialog from "primevue/dialog";
import { useAdminStore } from "@/store/admin";
import Button from "primevue/button";
import { ref } from "vue";
import AddUser from "./AddUser.vue";
const visible = ref(false);
const headerTitle = ref("");
const adminStore = useAdminStore();
const listUser = ref();
const detailUser = ref();
function getAllUser() {
  adminStore.getAllUser().then((res) => {
    listUser.value = res.data;
  });
}
getAllUser();
function handleClickDetail(slot) {
  visible.value = true;
  headerTitle.value = "Chi tiết";
  adminStore.getUser(slot.data.id).then((res) => {
    detailUser.value = res.data;
    console.log(res);
  });
  console.log(slot.data.id);
}
</script>
<style lang="scss" scoped></style>
