<template lang="">
  <form action="" @submit.prevent="submitAddUser">
    <div class="flex flex-col mt-3">
      <label for="">Email</label>
      <InputText v-model="user.email" />
      <p class="text-red-800 w-[350px] text-start">
        {{ v$.email?.$errors[0]?.$message }}
      </p>
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Họ</label>
      <InputText v-model="user.last_name" />
      <p class="text-red-800 w-[350px] text-start">
        {{ v$.last_name?.$errors[0]?.$message }}
      </p>
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Tên</label>
      <InputText v-model="user.first_name" />
      <p class="text-red-800 w-[350px] text-start">
        {{ v$.first_name?.$errors[0]?.$message }}
      </p>
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Địa chỉ</label>
      <InputText v-model="user.address" />
      <p class="text-red-800 w-[350px] text-start">
        {{ v$.address?.$errors[0]?.$message }}
      </p>
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Số điện thoại</label>
      <InputText v-model="user.mobile" />
      <p class="text-red-800 w-[350px] text-start">
        {{ v$.mobile?.$errors[0]?.$message }}
      </p>
    </div>
    <div class="mt-4 flex justify-center">
      <Button label="Hủy" size="small" class="mx-2 w-32" severity="secondary" />
      <Button
        label="Lưu"
        size="small"
        type="submit"
        class="mx-2 w-32"
        severity="success"
      />
    </div>
  </form>
</template>
<script setup>
import InputText from "primevue/inputtext";
import Button from "primevue/button";
import { ref, defineProps, watchEffect, defineEmits, computed } from "vue";
import { useAdminStore } from "@/store/admin";
import { toastMessage } from "@/helper/toastMessage.js";
import { useVuelidate } from "@vuelidate/core";
import { required, email, helpers } from "@vuelidate/validators";
const adminStore = useAdminStore();
const emit = defineEmits(["visibi"]);
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
const ruleUser = computed(() => {
  return {
    email: {
      required: helpers.withMessage(`Email Không để trống`, required),
      email: helpers.withMessage(`Email Không hợp lệ`, email),
    },
    first_name: {
      required: helpers.withMessage(`Họ Không để trống`, required),
    },
    last_name: {
      required: helpers.withMessage(`Tên Không để trống`, required),
    },
    address: {
      required: helpers.withMessage(`Địa chỉ Không để trống`, required),
    },
    mobile: {
      required: helpers.withMessage(`Số điện thoại Không để trống`, required),
    },
  };
});
const v$ = useVuelidate(ruleUser, user);
async function submitAddUser() {
  const result = await v$.value.$validate();
  if (result) {
    adminStore
      .setUser(`admin/edit_user/${user.value.id}`, user.value)
      .then(() => {
        toastMessage("success", "Thành công", "Cập nhật thành công");
      })
      .catch(() => {
        toastMessage("error", "Thất bại", "Cập nhật thất bại");
      });
    emit("visibi", false);
  }
}
</script>
<style lang="scss" scoped></style>
