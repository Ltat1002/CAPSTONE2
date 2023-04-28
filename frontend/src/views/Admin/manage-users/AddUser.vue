<template lang="">
  <form action="">
    <div class="flex flex-col mt-3">
      <label for="">Email</label>
      <InputText v-model="user.email" />
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Họ</label>
      <InputText v-model="user.last_name" />
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Tên</label>
      <InputText v-model="user.first_name" />
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Địa chỉ</label>
      <InputText v-model="user.address" />
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Số điện thoại</label>
      <InputText v-model="user.mobile" />
    </div>
    <div class="mt-4 flex justify-center">
      <Button label="Hủy" size="small" class="mx-2 w-32" severity="secondary" />
      <Button label="Lưu" size="small" class="mx-2 w-32" severity="success" />
    </div>
  </form>
</template>
<script setup>
import InputText from "primevue/inputtext";
import Button from "primevue/button";
import { ref, defineProps, watchEffect } from "vue";
const props = defineProps(["edit"]);
const user = ref({
  email: "",
  first_name: "",
  last_name: "",
  address: "",
  mobile: "",
});
watchEffect(() => {
  user.value = {
    ...user.value,
    ...props.edit,
  };
});
</script>
<style lang="scss" scoped></style>
