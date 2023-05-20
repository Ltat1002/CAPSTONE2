<template lang="">
  <CustomTitle title="Quản lý kỹ sư" />
  <DataTable :value="listEngineer">
    <Column field="fullname" header="Họ và tên"></Column>
    <Column field="mobile" header="Số điện thoại"></Column>
    <Column field="address" header="Địa chỉ"></Column>
    <Column field="repair_equipment.name" header="Thiết bị"></Column>
    <Column header="Mô tả">
      <template #body="slot">
        <div v-html="slot.data.description.body" class="description"></div>
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
            @click="handleClickAccept(slot)"
          />
          <Button
            icon="pi pi-file"
            size="small"
            class="mx-2"
            severity="success"
            @click="handleClickDetail(slot)"
          />
          <Button
            icon="pi pi-trash"
            size="small"
            class="mx-2"
            severity="success"
            @click="handleClickDeny(slot)"
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
import CustomTitle from "@/components/CustomTitle.vue";
import Column from "primevue/column";
import { toastMessage } from "@/helper/toastMessage";
import { useAdminStore } from "@/store/admin";
import Button from "primevue/button";
import { useRouter, useRoute } from "vue-router";
import { ref, onMounted } from "vue";
const adminStore = useAdminStore();
const router = useRouter();
const route = useRoute();
console.log(route.fullPath);
const listEngineer = ref([]);
function getAllEngineer() {
  adminStore.getAllEngineer().then((res) => {
    listEngineer.value = res.data.map((data) => {
      return {
        ...data,
        fullname: data.last_name + " " + data.first_name,
      };
    });
  });
}
onMounted(() => {
  getAllEngineer();
});

function handleClickAccept(slot) {
  adminStore
    .setAcceptCv({ id: slot.data.id })
    .then(() => {
      toastMessage("success", "Thành công", "Trở thành engineer thành công");
      getAllEngineer();
    })
    .catch(() => {
      toastMessage("error", "Thất bại", "Trở thành engineer thất bại");
    });
}
function handleClickDeny(slot) {
  adminStore
    .setDeny({ id: slot.data.id })
    .then(() => {
      getAllEngineer();
      toastMessage(
        "success",
        "Thành công",
        "Hủy bỏ trở thành Engineer thành công"
      );
    })
    .catch(() => {
      toastMessage("error", "Thất bại", "Hủy bỏ trở thành Engineer thất bại");
    });
}
function handleClickDetail(slot) {
  router.push(`/admin/manage-engineer/detail-cv/${slot.data.id}`);
}
</script>
<style lang="scss" scoped>
.description {
  display: -webkit-box;
  max-height: 3.2rem;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: normal;
  -webkit-line-clamp: 2;
  line-height: 1.6rem;
}
</style>
