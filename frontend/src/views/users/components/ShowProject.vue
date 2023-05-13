<template>
  <div class="wrap">
    <div class="container">
      <carousel
        :items-to-show="5"
        :autoplay="1000"
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
  "https://lh3.googleusercontent.com/B87ppilk_YreDqS2C1t7wZ5mL9Hl6wFNqaT31Uxj-VSJU2oYM7BjZMtY-lRW4S0DJJNkoObhD6U6ZWiFBWFex0O1ZqxwsxgpsZEoDJ7UY4IOWGECJyfCxG8G1pJEB_ethIM3ZRGG",
  "https://baocantho.com.vn/image/fckeditor/upload/2020/20200329/images/11-2.gif",
  "https://news.oto-hui.com/wp-content/uploads/2020/09/chuyen-nghe-o-to-de-tro-thanh-nguoi-tho-sua-chua-o-to-sao-gian-nan-den-the-3.jpg",
  "https://icdn.dantri.com.vn/thumb_w/640/2020/07/07/thosuadieuhoa-1594102516477.jpg",
  "https://www.bienphong.com.vn/images/media//730/2020/10/30/image001_1.jpg",
  "https://tttctt.1cdn.vn/2022/04/28/sua-iphone-tai-gia.jpg",
  "https://images.hcmcpv.org.vn/res/news/2020/12/05-12-2020-trao-tang-he-thong-dien-nang-luong-mat-troi-thuc-hien-sua-chua-dien-cho-nguoi-dan-F4CF9A46.jpg",
  "https://suachuadien.net/upload/images/001.jpg",
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
