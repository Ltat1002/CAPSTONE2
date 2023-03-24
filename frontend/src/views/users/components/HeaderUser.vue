<template lang="">
  <div id="header">
    <header class="header wrap">
      <router-link to="/" href="" class="logo"
        ><img
          src="http://mauweb.monamedia.net/painting/wp-content/uploads/2019/01/logo1.png"
          alt=""
      /></router-link>
      <input class="menu-btn" type="checkbox" id="menu-btn" />
      <label class="menu-icon" for="menu-btn"
        ><span class="navicon"></span
      ></label>
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
  background: linear-gradient(
    to right,
    #00d39f 0,
    #008bd3 25%,
    #d40063 75%,
    #d4be00 100%
  );
  box-shadow: 1px 1px 4px 0 rgba(0, 0, 0, 0.1);
  position: fixed;
  z-index: 3;
  left: 0;
  right: 0;
  top: 0;
}
.header ul {
  margin: 0;
  padding: 0;
  list-style: none;
  overflow: hidden;
}
.header li a {
  display: block;
  padding: 20px 20px;
  text-decoration: none;
  color: #fff;
  font-size: 1.6rem;
}

.header .logo {
  display: block;
  float: left;
  font-size: 2em;
  padding: 10px 20px;
  text-decoration: none;
} /* menu */
.header .menu {
  clear: both;
  max-height: 0;
  transition: max-height 0.2s ease-out;
} /*
menu icon */
.header .menu-icon {
  cursor: pointer;
  display: inline-block;
  float: right;
  padding: 28px 20px;
  position: relative;
  user-select: none;
}
.header .menu-icon .navicon {
  background: #333;
  display: block;
  height: 2px;
  position: relative;
  transition: background 0.2s ease-out;
  width: 18px;
}
.header .menu-icon .navicon:before,
.header .menu-icon .navicon:after {
  background: #333;
  content: "";
  display: block;
  height: 100%;
  position: absolute;
  transition: all 0.2s ease-out;
  width: 100%;
}
.header .menu-icon .navicon:before {
  top: 5px;
}
.header .menu-icon .navicon:after {
  top: -5px;
}
.header .menu-btn {
  display: none;
}
.header .menu-btn:checked ~ .menu {
  max-height: 240px;
}
.header .menu-btn:checked ~ .menu-icon .navicon {
  background: transparent;
}
.header .menu-btn:checked ~ .menu-icon .navicon:before {
  transform: rotate(-45deg);
}
.header .menu-btn:checked ~ .menu-icon .navicon:after {
  transform: rotate(45deg);
}
.header .menu-btn:checked ~ .menu-icon:not(.steps) .navicon:before,
.header .menu-btn:checked ~ .menu-icon:not(.steps) .navicon:after {
  top: 0;
} /* 48em = 768px */
@media (min-width: 48em) {
  .header li {
    float: left;
  }
  .header li a {
    padding: 20px 30px;
  }
  .header .menu {
    clear: none;
    float: right;
    max-height: none;
  }
  .header .menu-icon {
    display: none;
  }
}
</style>
