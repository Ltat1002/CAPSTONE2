<template lang="">
  <keep-alive>
    <div class="description">
      <div class="flex flex-col">
        <span class="p-float-label">
          <InputText id="name" v-model="description.name" />
          <label for="name">Tên chi tiết</label>
        </span>
        <span class="p-float-label">
          <InputText id="mobile" v-model="description.mobile" />
          <label for="mobile">Số điện thoại</label>
        </span>
        <span class="p-float-label">
          <Textarea v-model="description.description" rows="10" />
          <label>Mô tả</label>
        </span>
      </div>
      <div class="images">
        <div class="upload_image">
          <FileUpload
            mode="basic"
            accept="image/*"
            customUpload
            :multiple="true"
            auto
            @uploader="customBase64Uploader"
          >
          </FileUpload>
        </div>

        <Image
          v-for="value in description.img"
          :key="value"
          :src="value"
          alt="Image"
          width="200"
          preview
        />
      </div>
    </div>
  </keep-alive>
</template>
<script setup>
import Textarea from "primevue/textarea";
import FileUpload from "primevue/fileupload";
import Image from "primevue/image";
import InputText from "primevue/inputtext";
import { useReportStore } from "@/store/report.js";
import { reactive, watch, watchEffect } from "vue";
import { useEngineerStore } from "@/store/engineer.js";
const engineerStore = useEngineerStore();
const reportStore = useReportStore();
const description = reactive({
  name: "",
  mobile: "",
  description: "",
  images: [],
  img: [],
  ...engineerStore.repair,
});
watch(description, () => {
  reportStore.report = {
    ...reportStore.report,
    ...description,
  };
});
watchEffect(() => {
  engineerStore.setRepair({
    ...engineerStore.repair,
    ...description,
  });
});
function blobToBase64(blob) {
  return new Promise((resolve) => {
    const reader = new FileReader();
    reader.onloadend = () => resolve(reader.result);
    reader.readAsDataURL(blob);
  });
}
const customBase64Uploader = async (event) => {
  const file = event.files;
  file.forEach((el) => {
    description.images.push(el);
    blobToBase64(el).then((data) => {
      description.img.push(data);
    });
  });
};
</script>
<style lang="scss" scoped>
.images {
  position: relative;
  height: 500px;
  z-index: 1;
  overflow-y: auto;
  flex: 1;
  border-radius: 7px;
  margin-left: 20px;
  margin-right: -10px;
  border: 1px solid #ced4da;
  background-color: #e8ecf2;
  padding: 20px;
  display: grid;
  grid-template-columns: repeat(2, 200px);
  grid-template-rows: repeat(2, 200px);
  grid-gap: 20px;
  .p-image {
    width: 200px;
    height: 200px;
    border: 1px solid #ced4da;
    border-radius: 7px;
  }
  :deep(.p-image-preview-container) > img {
    height: 200px;
    border-radius: 7px;
    object-fit: cover;
  }
  :deep(.p-image-preview-indicator) {
    height: 200px;
    border-radius: 7px;
  }
}
.description {
  display: flex;
  height: 500px;
  justify-content: space-between;
  margin-top: 40px;
  .p-inputtextarea,
  .p-inputtext {
    width: 400px;
    margin-right: 10px;
  }
}
.p-float-label {
  margin-bottom: 30px;
  &:last-child {
    flex: 1;
    margin-bottom: 0;
    :deep(.p-inputtextarea) {
      height: 100%;
    }
  }
}
.upload_image {
  position: absolute;
  right: 20px;
  top: 20px;
}
.p-fileupload {
  height: 50px;
}
</style>
