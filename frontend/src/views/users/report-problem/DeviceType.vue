<template lang="">
  <h3 class="title">Chọn loại thiết bị của bạn</h3>
  <div class="device_type_list">
    <div
      v-for="(type, index) of deviceTypeList"
      :key="index"
      class="device_type_item"
      :class="indexActive === index ? 'device_type_active' : ''"
      @click="handleActive(index)"
      ref="deviceType"
    >
      <img :src="type.imageUrl" alt="" />
      <div class="device_type_name">
        <h4>{{ type.type }}</h4>
      </div>
      <p class="device_type_desc">
        {{ type.description }}
      </p>
    </div>
  </div>
</template>
<script setup>
import { ref, onMounted } from "vue";
let indexActive = ref(null);
const deviceTypeList = [
  {
    imageUrl: "https://cdn-icons-png.flaticon.com/512/806/806281.png",
    type: "Thiết bị điện tử",
    description:
      "Have you been always searching for the trustful company that can do all the electrician deals for you?",
  },
  {
    imageUrl: "https://cdn-icons-png.flaticon.com/512/432/432797.png",
    type: "Thiết bị điện tử",
    description:
      "Have you been always searching for the trustful company that can do all the electrician deals for you?",
  },
  {
    imageUrl: "https://cdn-icons-png.flaticon.com/512/1028/1028907.png",
    type: "Thiết bị điện tử",
    description:
      "Have you been always searching for the trustful company that can do all the electrician deals for you?",
  },
  {
    imageUrl: "https://cdn-icons-png.flaticon.com/512/2824/2824790.png",
    type: "Thiết bị điện tử",
    description:
      "Have you been always searching for the trustful company that can do all the electrician deals for you?",
  },
  {
    imageUrl: "https://cdn-icons-png.flaticon.com/512/603/603157.png",
    type: "Thiết bị điện tử",
    description:
      "Have you been always searching for the trustful company that can do all the electrician deals for you?",
  },
  {
    imageUrl: "https://cdn-icons-png.flaticon.com/512/1205/1205495.png",
    type: "Thiết bị điện tử",
    description:
      "Have you been always searching for the trustful company that can do all the electrician deals for you?",
  },
];

const deviceType = ref(null);

onMounted(() => {
  // console.log(deviceType.value);
});

function handleActive(index) {
  indexActive.value = index;
}
</script>
<style lang="scss" scoped>
.device_type_list {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
  .device_type_item {
    background-color: #e0e5eb;
    border-radius: 5px;
    position: relative;
    cursor: pointer;
    // box-shadow: 0 0 8px 2px #000;
    padding: 30px 20px;
    transition: all 0.1s ease-in;
    img {
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 50%;
      border: 2px solid #e0e5eb;
    }
    .device_type_name {
      margin-top: 10px;
      font-size: 20px;
      font-weight: bold;
    }
    .device_type_desc {
      margin-top: 10px;
      font-size: 16px;
    }

    &:hover {
      transform: translateY(-5px);
      box-shadow: 0 0 6px 2px rgba($color: #cac7c7, $alpha: 0.7);
      img {
        box-shadow: 0 0 8px 2px #ccc;
      }
      color: #fff;
      background-color: rgba($color: #000000, $alpha: 0.7);
    }

    &::after {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      border-radius: 5px;
    }
  }
}
.device_type_active {
  background-color: var(--primary-color) !important;
  color: #fff;
}
</style>
