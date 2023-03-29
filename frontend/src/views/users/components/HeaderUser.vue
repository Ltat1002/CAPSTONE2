<template lang="">
  <div id="header">
    <header class="header wrap">
      <router-link to="/" href="" class="logo"
        ><img
          src="http://mauweb.monamedia.net/painting/wp-content/uploads/2019/01/logo1.png"
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
  object-fit: contain;
}
#header {
  background-color: #1e1e1e;
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
