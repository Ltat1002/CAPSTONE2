<template lang="">
  <keep-alive>
    <div class="description">
      <div class="flex flex-col">
        <span class="p-float-label">
          <InputText id="name" v-model="description.name" />
          <label for="name">Tên chi tiết</label>
          <p class="text-red-800 w-[350px] text-start">
            {{ v$.name?.$errors[0]?.$message }}
          </p>
        </span>
        <span class="p-float-label">
          <InputText id="mobile" v-model="description.mobile" />
          <label for="mobile">Số điện thoại</label>
          <p class="text-red-800 w-[350px] text-start">
            {{ v$.mobile?.$errors[0]?.$message }}
          </p>
        </span>
        <span class="p-float-label">
          <Textarea v-model="description.description" rows="10" />
          <label>Mô tả</label>
          <p class="text-red-800 w-[350px] text-start">
            {{ v$.description?.$errors[0]?.$message }}
          </p>
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
        <p class="text-red-800 w-[350px] text-start">
          {{ v$.images?.$errors[0]?.$message }}
        </p>
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
import { reactive, watch, computed, watchEffect } from "vue";
import { useEngineerStore } from "@/store/engineer.js";
const engineerStore = useEngineerStore();
const reportStore = useReportStore();
import { useVuelidate } from "@vuelidate/core";
import { required, helpers } from "@vuelidate/validators";
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
const rule = computed(() => {
  return {
    name: {
      required: helpers.withMessage(`Email Không để trống`, required),
    },
    mobile: {
      required: helpers.withMessage(`Mật khẩu Không để trống`, required),
    },
    description: {
      required: helpers.withMessage(`Mật khẩu Không để trống`, required),
    },
    images: {
      required: helpers.withMessage(`Mật khẩu Không để trống`, required),
    },
  };
});
const v$ = useVuelidate(rule, description);

function blobToBase64(blob) {
  return new Promise((resolve) => {
    const reader = new FileReader();
    reader.onloadend = () => resolve(reader.result);
    reader.readAsDataURL(blob);
  });
}
const customBase64Uploader = async (event) => {
  const file = event.files;
  console.log(file);
  file.forEach((el) => {
    description.images.push(el);
    engineerStore.setRepair({
      ...engineerStore.repair,
      images: [...engineerStore.repair.images, el],
    });
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
