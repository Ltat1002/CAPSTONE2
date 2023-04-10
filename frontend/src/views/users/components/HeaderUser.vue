<template lang="">
  <div id="header">
    <header class="header wrap">
      <router-link to="/" href="" class="logo"
        ><img
          src="https://mehedi.asiandevelopers.com/demo/roofan-html/assets/images/resources/logo-1.png"
          alt=""
      /></router-link>
      <ul class="menu">
        <li><router-link to="/">Trang chủ</router-link></li>
        <li><router-link to="/" href="#about">Giới thiệu</router-link></li>
        <li>
          <router-link to="/report-problem" href="#about">Báo cáo</router-link>
        </li>
        <li><router-link to="/" href="#careers">Dịch vụ</router-link></li>
        <li><router-link to="/" href="#contact">Liên hệ</router-link></li>
        <li>
          <router-link to="/auth/login" href="#contact">Đăng nhập</router-link>
        </li>
        <li>
          <router-link to="/auth/register" href="#contact">Đăng ký</router-link>
        </li>
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
  background-color: #fff;
  position: sticky;
  max-height: 68px;
  height: 68px;
  z-index: 999;
  left: 0;
  right: 0;
  top: 0;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
  color: #111e37;
  line-height: 20px;
  font-weight: 600;
  &:hover {
    color: var(--red);
  }
}

.header .logo {
  display: block;
  font-size: 2em;
  padding: 10px 0px;
  text-decoration: none;
}
</style>
