<template lang="">
  <form action="" @submit.prevent="handleSubmit">
    <div class="flex flex-col mt-3">
      <label for="">Tên thiết bị</label>
      <InputText v-model="dataRepair.name" />
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Mô tả</label>
      <Textarea v-model="dataRepair.description" />
    </div>
    <div class="flex flex-col mt-3">
      <label for="">Ảnh</label>
      <div class="choose_img" @click="handleUploadFile">
        <img
          :src="
            img ||
            dataRepair.photo_url ||
            'https://cdn.pixabay.com/photo/2016/01/03/00/43/upload-1118929_1280.png'
          "
          alt=""
        />
      </div>
      <file-upload
        name="demo[]"
        accept="image/*"
        auto
        :max-file-size="1000000"
        :show-cancel-button="false"
        :show-upload-button="false"
        mode="basic"
        custom-upload
        @uploader="customUploader"
      />
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
import Textarea from "primevue/textarea";
import FileUpload from "primevue/fileupload";
import { ref, defineProps, watchEffect } from "vue";
import { toastMessage } from "@/helper/toastMessage";
import axios from "axios";
import { useAdminStore } from "@/store/admin";
const adminStore = useAdminStore();
const props = defineProps(["edit", "check"]);
const dataRepair = ref({
  name: "",
  photo: "",
  description: "",
});
const img = ref("");
const handleSubmit = async () => {
  const form_data = new FormData();
  for (let key in dataRepair.value) {
    if (key === "photo" && dataRepair.value[key]) {
      console.log(dataRepair.value[key]);
      form_data.append("photo", dataRepair.value[key]);
    } else if (key !== "photo") {
      form_data.append(key, dataRepair.value[key]);
    }
  }
  const localToken = localStorage.getItem("token") || "";
  if (props.check) {
    await axios
      .post("http://localhost:3000/api/v1/admin/repair_equipments", form_data, {
        headers: {
          Authorization: `Bearer ${localToken}`,
        },
      })
      .then(() => {
        toastMessage("success", "Thành công", "Thêm thiết bị thành công");
        adminStore.repair = false;
      })
      .catch(() => {
        toastMessage("error", "Thất bại", "Thêm thiết bị thất bại");
      });
  } else {
    await axios
      .put(
        `http://localhost:3000/api/v1/admin/repair_equipments/${props.edit.id}`,
        form_data,
        {
          headers: {
            Authorization: `Bearer ${localToken}`,
          },
        }
      )
      .then(() => {
        toastMessage("success", "Thành công", "Cập nhật thiết bị thành công");
        adminStore.repair = false;
      })
      .catch(() => {
        toastMessage("error", "Thất bại", "Cập nhật thiết bị thất bại");
      });
  }
};
function handleUploadFile() {
  const fileUpload = document.querySelector(
    ".p-fileupload-basic input[type='file']"
  );
  fileUpload.click();
}
const customUploader = async (event) => {
  const file = event.files[0];
  img.value = file.objectURL;
  dataRepair.value.photo = file;
};
watchEffect(() => {
  dataRepair.value = {
    ...dataRepair.value,
    ...props.edit,
  };
});
</script>
<style lang="scss" scoped>
:deep(.p-fileupload-choose) {
  display: none;
}
.choose_img {
  width: 200px;
  height: 200px;
  line-height: 200px;
  text-align: center;
  cursor: pointer;
  margin-bottom: 10px;
  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
}
</style>
