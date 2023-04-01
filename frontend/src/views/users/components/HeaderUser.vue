<template lang="">
  <div id="header">
    <header class="header wrap">
      <router-link to="/" href="" class="logo"
        ><img
          src="https://static.wixstatic.com/media/96b204_3f208a5237f2474f8e5d8c44adf2845f~mv2.png/v1/fill/w_560,h_228,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/96b204_3f208a5237f2474f8e5d8c44adf2845f~mv2.png"
          alt=""
      /></router-link>
      <ul class="menu">
        <li><router-link to="/">Trang chủ</router-link></li>
        <li><router-link to="/" href="#about">Giới thiệu</router-link></li>
        <li><router-link to="/" href="#careers">Dịch vụ</router-link></li>
        <li><router-link to="/" href="#contact">Liên hệ</router-link></li>
        <li><router-link to="/" href="#contact">Đăng nhập</router-link></li>
      </ul>
    </header>
  </div>
</template>
<script setup></script>
<style lang="scss" scoped>
img {
  width: 150px;
  object-fit: cover;
}
#header {
  background-color: #2e89ff;
  position: sticky;
  max-height: 68px;
  height: 6.8rem;
  z-index: 3;
  left: 0;
  right: 0;
  top: 0;
}
.header {
  height: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.header ul {
  display: flex;
  list-style: none;
}

.header li a {
  display: block;
  padding: 25px 20px;
  text-decoration: none;
  color: #fff;
  font-size: 1.6rem;
  &:hover {
    color: orangered;
  }
}

.header .logo {
  display: block;
  font-size: 2em;
  padding: 10px 0px;
  text-decoration: none;
}
</style>
