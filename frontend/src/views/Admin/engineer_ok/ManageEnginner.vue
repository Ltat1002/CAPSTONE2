<template lang="">
  <div>
    <CustomTitle title="Quản lý người dùng" />

    <DataTable :value="listUser" scrollable lazy :loading="loading">
      <Column field="email" header="Email"></Column>
      <Column field="fullname" header="Họ và tên"></Column>
      <Column field="mobile" header="Số điện thoại"></Column>
      <Column field="address" header="Địa chỉ"></Column>
      <Column field="status" header="Trạng thái">
        <template #body="slot">
          <div
            v-if="slot.data.status === 'activate'"
            class="bg-green-600 text-white p-2 rounded-[26px] text-center"
          >
            Activate
          </div>
          <div
            v-else-if="slot.data.status === 'deactivate'"
            class="bg-red-600 text-white p-2 rounded-[26px] text-center"
          >
            Deactivate
          </div>
          <div
            v-else
            class="text-center bg-yellow-600 text-white p-2 rounded-[26px]"
          >
            Pending
          </div>
        </template>
      </Column>
      <Column header="Hành động">
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
              v-if="slot.data.status !== 'activate'"
              @click="handleClickActive(slot)"
            />
            <Button
              v-else
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
import AddUser from "../manage-users/AddUser.vue";
import CustomTitle from "@/components/CustomTitle.vue";

const loading = ref(false);
const visible = ref(false);
const headerTitle = ref("");
const adminStore = useAdminStore();
const listUser = ref();
const detailUser = ref();
function handleSetVisible(data) {
  visible.value = data;
  getAllEngineer();
}
function getAllEngineer() {
  loading.value = true;
  adminStore
    .getAllEngineerok()
    .then((res) => {
      listUser.value = res.data.map((value) => {
        return { ...value, fullname: value.last_name + " " + value.first_name };
      });
    })
    .finally(() => {
      loading.value = false;
    });
}
getAllEngineer();
function handleClickDetail(slot) {
  visible.value = true;
  headerTitle.value = "Cập nhật";
  adminStore.getUser(slot.data.id).then((res) => {
    detailUser.value = res.data;
  });
}
function handleClickActive(slot) {
  adminStore
    .setActiveUser("admin/activate_user", { id: slot.data.id })
    .then(() => {
      toastMessage("success", "Thành công", "Thêm thành công");
      getAllEngineer();
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
      getAllEngineer();
    })
    .catch(() => {
      toastMessage("error", "Thất bại", "Xóa thất bại");
    });
}
</script>
<style lang="scss" scoped></style>
