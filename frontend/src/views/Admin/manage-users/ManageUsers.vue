<template lang="">
  <div>
    <DataTable :value="listUser" scrollable lazy :loading="loading">
      <Column field="email" header="Email"></Column>
      <Column field="fullname" header="Họ và tên"></Column>
      <Column field="mobile" header="Số điện thoại"></Column>
      <Column field="address" header="Địa chỉ"></Column>
      <Column field="status" header="Địa chỉ"></Column>
      <Column header="hành động">
        <template #body="slot">
          <div class="flex mx-[-8px]">
            <Button
              icon="pi pi-file-edit"
              size="small"
              class="mx-2"
              severity="success"
              @click="handleClickDetail(slot)"
            />
            <Button
              icon="pi pi-stop-circle"
              size="small"
              class="mx-2"
              severity="success"
              @click="handleClickActive(slot)"
            />
            <Button
              icon="pi pi-trash"
              size="small"
              class="mx-2"
              severity="danger"
              @click="handleClickUnactive(slot)"
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
    <AddUser :edit="detailUser" @visibi="handleSetVisible" />
  </Dialog>
</template>
<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import Dialog from "primevue/dialog";
import { useAdminStore } from "@/store/admin";
import Button from "primevue/button";
import { ref } from "vue";
import { toastMessage } from "@/helper/toastMessage.js";
import AddUser from "./AddUser.vue";
const loading = ref(false);
const visible = ref(false);
const headerTitle = ref("");
const adminStore = useAdminStore();
const listUser = ref();
const detailUser = ref();
function handleSetVisible(data) {
  visible.value = data;
  getAllUser();
}
function getAllUser() {
  loading.value = true;
  adminStore
    .getAllUser()
    .then((res) => {
      listUser.value = res.data.map((value) => {
        return { ...value, fullname: value.last_name + " " + value.first_name };
      });
    })
    .finally(() => {
      loading.value = false;
    });
}
getAllUser();
function handleClickDetail(slot) {
  visible.value = true;
  headerTitle.value = "Update";
  adminStore.getUser(slot.data.id).then((res) => {
    detailUser.value = res.data;
  });
}
function handleClickActive(slot) {
  adminStore
    .setActiveUser("admin/activate_user", { id: slot.data.id })
    .then(() => {
      toastMessage("success", "Thành công", "Thêm thành công");
      getAllUser();
    })
    .catch(() => {
      toastMessage("error", "Thất bại", "Thêm thất bại");
    });
}
function handleClickUnactive(slot) {
  adminStore
    .setActiveUser("admin/deactivate_user", { id: slot.data.id })
    .then(() => {
      toastMessage("success", "Thành công", "Xóa thành công");
      getAllUser();
    })
    .catch(() => {
      toastMessage("error", "Thất bại", "Xóa thất bại");
    });
}
</script>
<style lang="scss" scoped></style>
