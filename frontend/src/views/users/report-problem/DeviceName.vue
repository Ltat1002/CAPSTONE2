<template lang="">
  <div class="device--name">
    <div class="content">
      <!-- <h1 class="heading">Thiết bị</h1> -->
      <div class="image-container">
        <TheDevice v-for="value in images" :key="value" :img="value" />
      </div>
    </div>
  </div>
</template>
<script setup>
import TheDevice from "../components/TheDevice.vue";

const images = [
  "https://cdn11.dienmaycholon.vn/filewebdmclnew/public//userupload/images/dien-thoai-Samsung-Galaxy-S10-Plus-1.jpg",
  "https://img.websosanh.vn/v2/users/review/images/0smhaniff09ui.jpg?compress=85",
  "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2020/05/laptop-cu-cau-hinh-cao.jpg",
  "https://cdn.tgdd.vn/Files/2022/04/22/1427870/mung-le-30-3-table-slae-h2_1280x720-800-resize.jpg",
  "https://media.cnn.com/api/v1/images/stellar/prod/210921222249-3-9th-gen-ipad-review-underscored.jpg?q=w_3748,h_2108,x_0,y_0,c_fill",
];
</script>
<style lang="scss" scoped>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600&display=swap");

.heading {
  font-size: 2.5rem;
  color: var(--red);
  text-align: center;
  margin: 20px 0;
}
.image-container {
  display: flex;
  flex-wrap: wrap;
  margin-right: -10px;
  margin-left: -10px;
}
.device--name {
  display: flex;
  flex-direction: column;
  margin: 30px 0px;
}
.content {
  margin-top: 10px;
}
.side-bar {
  margin: 0 20px;
  margin-top: 44px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  > div {
    display: flex;
    flex-direction: column;
    width: 25%;
    margin-right: -20px;
    margin-left: -20px;
    label {
      font-size: 1rem;
      font-weight: 500;
    }
    input {
      height: 35px;
      width: 100%;
      padding: 0px 20px;
    }
  }
}
:deep(.p-dropdown) {
  width: 100%;
  height: 35px;
  display: flex;
  align-items: center;
}
</style>
