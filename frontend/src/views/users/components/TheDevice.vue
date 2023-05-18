<template lang="">
  <section class="cursor-pointer" @click="handleClickDevice($event, device.id)">
    <div class="blog-post">
      <img :src="device.photo_url" :alt="device.name" />
      <p class="category">{{ device.name }}</p>
      <div class="text-content">
        <h2 class="post-title">
          {{ device.description }}
        </h2>
        <div class="tags">
          <a href="h#" target="_blank">#{{ device.name }}</a>
        </div>
      </div>
    </div>
  </section>
</template>
<script setup>
import { defineProps, defineEmits } from "vue";
defineProps(["device"]);
const emit = defineEmits(["chooseDevice"]);
function handleClickDevice($event, id) {
  $event.target.classList.add("active");
  emit("chooseDevice", id);
}
</script>
<style lang="scss" scoped>
.active {
  background-color: chocolate;
}
section {
  padding: 10px;
  width: 25%;
  margin-bottom: 20px;
}
.blog-post {
  box-shadow: 2px 2px 8px 2px #9c9797;
  border-radius: 10px;
  position: relative;
}
.blog-post img {
  width: 100%;
  height: 450px;
  object-fit: cover;
  border-radius: 10px;
}
.blog-post .category {
  position: absolute;
  top: 20px;
  left: 20px;
  padding: 10px 15px;
  font-size: 14px;
  text-decoration: none;
  background-color: #e67e22;
  color: #fff;
  border-radius: 5px;
  box-shadow: 1px 1px 8px rgba(0, 0, 0, 0.1);
  text-transform: uppercase;
}
.text-content {
  position: absolute;
  bottom: 10px;
  padding: 20px;
  background-color: rgba($color: #000000, $alpha: 0.7);
  width: calc(100% - 20px);
  left: 50%;
  transform: translateX(-50%);
  border-radius: 10px;
  box-shadow: 1px 1px 8px rgba(0, 0, 0, 0.08);
  color: #fff;
}
.text-content h2 {
  font-size: 16px;
  line-height: 25px;
  font-weight: 400;
  margin-bottom: 30px;
}
.text-content img {
  height: 70px;
  width: 70px;
  border: 5px solid rgba(0, 0, 0, 0.1);
  border-radius: 50%;
  position: absolute;
  top: -35px;
  left: 35px;
}
.tags a {
  color: #fff;
  font-weight: 700;
  text-decoration: none;
  margin-right: 15px;
  transition: 0.3s ease;
}
.tags a:hover {
  color: #2a5aea;
}
@media screen and (max-width: 1100px) {
  .container {
    grid-template-columns:
      1fr
      1fr;
    grid-row-gap: 60px;
  }
}
@media screen and (max-width: 600px) {
  .container {
    grid-template-columns: 1fr;
    grid-row-gap: 60px;
  }
}
</style>
