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
  "https://as1.ftcdn.net/v2/jpg/02/32/15/20/1000_F_232152041_MteUXPM1X4arQHQSCPPFFGE4I44SOCFb.jpg",
  "https://homerepairservicessite.files.wordpress.com/2017/03/cropped-home-repair-banner2.jpg",
  "https://homerepairservicessite.files.wordpress.com/2017/03/cropped-home-repair-banner2.jpg",
]);
</script>
<style lang="scss" scoped>
.carousel__item {
  width: 100%;
  height: calc(100vh);
  img {
    height: 100%;
    width: 100%;
    object-fit: cover;
  }
}
</style>
