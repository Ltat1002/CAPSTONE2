<template lang="">
  <div id="header">
    <header class="header wrap">
      <router-link to="/" href="" class="logo"
        ><img
          src="https://mehedi.asiandevelopers.com/demo/roofan-html/assets/images/resources/logo-1.png"
          alt=""
      /></router-link>
      <ul class="menu">
        <li>
          <router-link to="/" active-class="nav-link">Trang chủ</router-link>
        </li>
        <li
          v-if="checkLogin && registerStore.account.status === status.approved"
        >
          <router-link to="/engineer/receive-report" active-class="nav-link"
            >Thông báo</router-link
          >
        </li>
        <li
          v-if="checkLogin && registerStore.account.status === status.approved"
        >
          <router-link to="/engineer/my-report" active-class="nav-link"
            >Đơn của tôi</router-link
          >
        </li>
        <li>
          <router-link to="/notify" active-class="nav-link"
            >Báo cáo</router-link
          >
        </li>
        <!-- <li>
          <router-link
            to="/report-problem"
            href="#about"
            active-class="nav-link"
            >Báo cáo</router-link
          >
        </li> -->
        <li
          v-if="checkLogin && registerStore.account.status === status.activate"
        >
          <router-link
            to="/engineer/upload-information"
            href="#contact"
            active-class="nav-link"
          >
            Trở thành đối tác của HRS
          </router-link>
        </li>
        <li
          v-if="checkLogin && registerStore.account.status === status.pending"
        >
          <Button label="Chờ duyệt" />
        </li>
        <li
          v-if="checkLogin && registerStore.account.status === status.approved"
        >
          <Button label="Đối tác" />
        </li>
        <li v-if="!checkLogin">
          <router-link to="/auth/login" href="#contact">Đăng nhập</router-link>
        </li>
        <li v-if="!checkLogin">
          <router-link to="/auth/register" href="#contact">Đăng ký</router-link>
        </li>
        <li
          :class="{ online: isOnline }"
          @click="showDropdown = !showDropdown"
          v-else
        >
          <div class="w-[50px] h-[50px] rounded-full overflow-hidden">
            <the-avt :size="25" />
          </div>
          <div class="down"><i class="bx bx-check"></i></div>
          <div v-if="showDropdown" class="drop_down">
            <ul>
              <li>
                <a href="#">
                  <i class="bx bxs-user"></i>
                  <span>{{ registerStore.account.email }}</span>
                </a>
              </li>
              <li>
                <router-link to="/profile">
                  <i class="bx bxs-contact"></i> Hồ sơ
                </router-link>
              </li>
              <li>
                <a href="#" @click="handleLogout"
                  ><i class="bx bxs-log-out"></i>Đăng xuất</a
                >
              </li>
              <li
                v-if="registerStore.account.role === 'engineer'"
                class="flex-col items-start status"
              >
                <a><i class="bx bxs-analyse"></i>Trạng thái</a>
                <ul>
                  <li @click="handleUpdateOnline">
                    <span class="active"><i class="bx bx-check"></i></span>
                    Online
                  </li>
                  <li @click="handleUpdateOffline">
                    <span></span>
                    Offline
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </li>
      </ul>
    </header>
  </div>
</template>
<script setup>
import TheAvt from "@/components/TheAvt.vue";
import { useRegisterStore } from "@/store/register.js";
import Button from "primevue/button";
import { ref, computed, watchEffect } from "vue";
import { useRouter } from "vue-router";
import { status } from "@/helper/enumStatus";
const registerStore = useRegisterStore();
const checkLogin = computed(() => (registerStore.account?.id ? true : false));
const showDropdown = ref(false);
const isOnline = ref(true);
const router = useRouter();
watchEffect(() => {
  console.log(registerStore.account);
});
function handleLogout() {
  localStorage.removeItem("token");
  router.push("/auth/login");
}

function handleUpdateOnline() {
  isOnline.value = true;
  registerStore.updateProfile({
    onl_status: 0,
  });
}

function handleUpdateOffline() {
  isOnline.value = false;
  registerStore.updateProfile({
    onl_status: 1,
  });
}
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
  &:last-child {
    cursor: pointer;
    & > img {
      border: 1px solid #000;
    }
    .down {
      top: 55%;
      left: 60%;
      position: absolute;
      background-color: #fff;
      border-radius: 50%;
      width: 18px;
      padding-bottom: 4px;
      height: 18px;
      display: flex;
      align-items: center;
      justify-content: center;
      border: 1px solid #000;
      color: #fff;
    }
  }
  &.online {
    & > img {
      border: 2px solid var(--sub-color);
    }
    .down {
      background-color: var(--sub-color);
    }
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
  width: 300px;
  right: 0;
  background-color: #fff;
  border-radius: 5px;
  padding: 0 20px;
  box-shadow: 0 0 8px 2px #706b6b;
  & > ul {
    display: flex;
    flex-direction: column;
    overflow-x: hidden;
    & > li {
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
        flex-direction: column;
        align-items: start;
      }
    }
  }
}

a.nav-link.router-link-exact-active {
  color: var(--sub-color) !important;
  position: relative;
  &::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    border-radius: 2px;
    height: 2px;
    background-color: var(--sub-color);
  }
}

.status {
  ul {
    flex-direction: column;
    li {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 25px 0 0px 45px;
      span {
        width: 20px;
        height: 20px;
        border: 1px solid #000;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        &.active {
          background-color: var(--sub-color);
          color: #fff;
        }
      }
      &:hover {
        color: var(--sub-color);
        // span {
        //   border-color: var(--sub-color);
        //   background-color: var(--sub-color);
        // }
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
