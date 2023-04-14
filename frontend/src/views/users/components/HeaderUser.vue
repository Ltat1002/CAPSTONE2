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
        <li><router-link to="/notify" href="#about">Thông báo</router-link></li>
        <li>
          <router-link to="/report-problem" href="#about">Báo cáo</router-link>
        </li>
        <li>
          <router-link to="/history" href="#contact">Lịch sử</router-link>
        </li>
        <li v-if="checkLogin">
          <router-link to="/engineer/upload-information" href="#contact">
            <!-- <Button label="Trở thành đối tác của HRS" /> -->
            Trở thành đối tác của HRS
          </router-link>
        </li>
        <li v-if="!checkLogin">
          <router-link to="/auth/login" href="#contact">Đăng nhập</router-link>
        </li>
        <li v-if="!checkLogin">
          <router-link to="/auth/register" href="#contact">Đăng ký</router-link>
        </li>
        <li @click="showDropdown = !showDropdown" v-else>
          <img
            src="https://www.vinamilk.com.vn/sua-bot-nguoi-lon-vinamilk/wp-content/themes/suabotnguoilon/tpl/assets/img/profile/avt-default.jpg"
            alt=""
          />
          <div class="down">
            <img
              src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Arrow-down.svg/1024px-Arrow-down.svg.png"
              alt=""
            />
          </div>
          <div v-if="showDropdown" class="drop_down">
            <ul>
              <li>
                <a href="">
                  <i class="bx bxs-user"></i>
                  <span>{{ registerStore.account.email }}</span>
                </a>
              </li>
              <li>
                <a href=""> <i class="bx bxs-contact"></i> Profile </a>
              </li>
              <li>
                <a href=""><i class="bx bxs-log-out"></i>Logout</a>
              </li>
            </ul>
          </div>
        </li>
      </ul>
    </header>
  </div>
</template>
<script setup>
import { useRegisterStore } from "@/store/register.js";
import { ref, computed } from "vue";
// import Button from "primevue/button";
const registerStore = useRegisterStore();
const checkLogin = computed(() => (registerStore.account?.id ? true : false));
const showDropdown = ref(false);
</script>
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

.header li {
  display: flex;
  align-items: center;
  padding: 25px 20px;
  position: relative;
  .down {
    top: 55%;
    left: 60%;
    position: absolute;
    background-color: #fff;
    border-radius: 50%;
    width: 18px;
    padding-bottom: 4px;
    height: 18px;
    background-color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #ccc;
    img {
      border: none;
      width: 12px;
      height: 12px;
      margin-top: 4px;
      display: block;
    }
  }
  &:last-child {
    cursor: pointer;
  }
  a {
    display: block;
    text-decoration: none;
    color: #111e37;
    line-height: 20px;
    font-weight: 600;
    i {
      font-size: 24px;
    }
    &:hover {
      color: var(--sub-color);
    }
  }
}

.drop_down {
  position: absolute;
  top: 100%;
  left: 50%;
  width: 300px;
  transform: translateX(-50%);
  background-color: #fff;
  border-radius: 5px;
  padding: 0 20px;
  box-shadow: 0 0 8px 2px #706b6b;
  ul {
    display: flex;
    flex-direction: column;
    overflow-x: hidden;
    li {
      padding: 20px 20px;
      border-bottom: 1px solid #ccc;
      a {
        display: flex;
        align-items: center;
        gap: 20px;
        &:hover {
          color: var(--sub-color);
        }
      }
      &:last-child {
        border-bottom: none;
      }
    }
  }
}

li img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  border: 1px solid #ccc;
}

.header .logo {
  display: block;
  font-size: 2em;
  padding: 10px 0px;
  text-decoration: none;
}
</style>
