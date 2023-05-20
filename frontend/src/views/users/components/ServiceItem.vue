<template lang="">
  <div class="item">
    <div>
      <img class="w-full h-[200px] mb-2" :src="props.data.photo_url" alt="" />
      <h3>{{ props.data.name }}</h3>
    </div>
  </div>
</template>
<script setup>
import { defineProps } from "vue";
const props = defineProps(["data"]);
</script>
<style lang="scss" scoped>
.item {
  width: 25%;
  margin-top: 10px;
  font-size: 20px;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  position: relative;
  z-index: 10;
  padding: 10px;
  div {
    padding: 10px;
    height: 100%;
    border-radius: 10px;
    overflow: hidden;
    background-color: #fff;
    width: 100%;
    text-align: center;
  }
  h3 {
    position: relative;
    display: block;
    display: -webkit-box;
    max-width: 100%;
    height: 24px;
    margin: 0 auto;
    font-size: 19px;
    line-height: 1;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  &:hover::after {
    height: 100%;
  }
  &:hover::after + h3 {
    color: #fff;
  }
  &:hover::before {
    display: block;
  }
}
</style>
