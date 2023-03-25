<template lang="">
  <Carousel :wrap-around="true" :autoplay="3000">
    <Slide v-for="slide in image" :key="slide">
      <div class="carousel__item">
        <img :src="slide" alt="" />
      </div>
    </Slide>
  </Carousel>
</template>
<script setup>
import "vue3-carousel/dist/carousel.css";
import { Carousel, Slide } from "vue3-carousel";
import { ref } from "vue";
const image = ref([
  "https://haycafe.vn/wp-content/uploads/2022/02/Anh-gai-xinh-de-thuong.jpg",
  "https://thuthuatnhanh.com/wp-content/uploads/2019/10/hinh-anh-gai-xinh-ha-noi.jpg",
  "https://internetviettel.vn/wp-content/uploads/2017/05/1-2.jpg",
  "https://img.meta.com.vn/Data/image/2022/01/13/anh-dep-thien-nhien-3.jpg",
]);
</script>
<style lang="scss" scoped>
.carousel__item {
  margin-top: 58px;
  width: 100%;
  height: calc(100vh - 60px);
  img {
    height: 100%;
    width: 100%;
    object-fit: cover;
  }
}
</style>
