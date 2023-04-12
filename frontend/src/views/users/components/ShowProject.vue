<template>
  <div class="wrap">
    <div class="container">
      <carousel
        :items-to-show="5"
        :autoplay="10000000"
        :wrap-around="true"
        :transition="500"
      >
        <slide v-for="(value, index) in images" :key="index">
          <div class="card">
            <img :src="value" alt="Nature Image" />
            <div class="info">
              <h3>Travel round the world instantly</h3>
              <p>
                Visit Italy with our services on your holiday to experience a
                great joy and fun!
              </p>
              <a href="#" class="btn">Order Now</a>
            </div>
          </div>
        </slide>
      </carousel>
    </div>
  </div>
</template>
<script setup>
import "vue3-carousel/dist/carousel.css";
import { Carousel, Slide } from "vue3-carousel";
import { ref } from "vue";
const images = ref([
  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
  "https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg",
  "https://static.fotor.com/app/features/img/aiimage/scenes/a%20realistic%20fox%20in%20the%20lake%20generated%20by%20ai%20image%20creator.png",
  "https://media.istockphoto.com/id/504566177/photo/video-camera-lens.jpg?s=612x612&w=0&k=20&c=gx3jDUBxoD3pDtA6PymcIuhQADeoY2C8sJTikKMKPf0=",
  "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
  "https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg",
  "https://static.fotor.com/app/features/img/aiimage/scenes/a%20realistic%20fox%20in%20the%20lake%20generated%20by%20ai%20image%20creator.png",
  "https://media.istockphoto.com/id/504566177/photo/video-camera-lens.jpg?s=612x612&w=0&k=20&c=gx3jDUBxoD3pDtA6PymcIuhQADeoY2C8sJTikKMKPf0=",
]);
</script>
<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&display=swap");
.container {
  margin-top: 40px;
  margin-bottom: 40px;
  margin-right: -10px;
  margin-left: -10px;
}
.card {
  position: relative;
  padding: 20px;
  margin-right: 10px;
  margin-left: 10px;
  width: 100%;
  aspect-ratio: 9/14;
  overflow: hidden;
  border-radius: 20px;
  display: flex;
  align-items: flex-end;
  justify-content: flex-end;
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
  color: #fff;
}
.card img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  z-index: 0;
  transition: 0.4s;
}
.info {
  width: 100%;
  padding: 10px 5px;
  background: linear-gradient(
    to bottom,
    transparent,
    rgba(0, 0, 0, 0.2),
    rgba(0, 0, 0, 0.4),
    rgba(0, 0, 0, 0.5)
  );
  transform: translateY(50%);
  transition: 0.4s;
}
.info h3 {
  font-size: 20px;
  line-height: 110%;
}
.info p {
  padding: 10px 0;
  font-size: 16px;
  opacity: 0;
  transition: 0.4s;
}
.btn {
  display: inline-block;
  font-size: 16px;
  text-decoration: none;
  background: #03a9f4;
  color: #fff;
  padding: 5px 15px;
  border-radius: 5px;
  cursor: pinter;
  opacity: 0;
  transition: 0.4s;
}
.card:hover .info {
  transform: translateY(0);
}

.card:hover p,
.card:hover a {
  opacity: 1;
}

.card:hover img {
  transform: scale(1.15);
}
</style>
