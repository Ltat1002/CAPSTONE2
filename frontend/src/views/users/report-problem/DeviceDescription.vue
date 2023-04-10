<template lang="">
  <keep-alive>
    <div class="description">
      <div class="card flex justify-content-center">
        <span class="p-float-label">
          <Textarea v-model="value" rows="10" />
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
          v-for="value in images"
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
import { ref } from "vue";
const images = ref([]);

const customBase64Uploader = async (event) => {
  const file = event.files;
  file.forEach((el) => {
    images.value.push(el.objectURL);
  });
};

const value = ref("");
</script>
<style lang="scss" scoped>
.images {
  position: relative;
  display: flex;
  height: 500px;
  z-index: 1;
  overflow-y: auto;
  flex: 1;
  border-radius: 7px;
  margin-left: 20px;
  flex-wrap: wrap;
  justify-content: center;
  margin-right: -10px;
  box-shadow: 0 0 3px #c2b5b5;
  padding: 70px 20px 20px 20px;
  .p-image {
    margin-right: 10px;
    margin-left: 10px;
    margin-bottom: 10px;
  }
  :deep(.p-image-preview-container) > img {
    height: 200px;
    border-radius: 7px;
    box-shadow: 0px 0px 5px #c2b5b5;
    object-fit: cover;
  }
  :deep(.p-image-preview-indicator) {
    height: 200px;
    border-radius: 7px;
  }
}
.description {
  display: flex;
  margin-top: 40px;
  .p-inputtextarea {
    width: 400px;
    margin-right: 10px;
    height: 500px;
  }
}
.upload_image {
  position: absolute;
  right: 5px;
  top: 5px;
}
.p-fileupload {
  height: 50px;
}
</style>
