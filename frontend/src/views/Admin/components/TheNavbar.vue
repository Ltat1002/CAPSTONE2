<template>
  <section id="sidebar" :class="{ hide: props.sidebar }">
    <router-link to="/" class="brand">
      <i class="bx bxs-smile"></i>
      <span class="text">Repair service</span>
    </router-link>
    <ul class="side-menu top">
      <li :class="{ active: currentPage.includes('/manage-users') }">
        <router-link to="/admin/manage-users">
          <i class="bx bxs-user"></i>
          <span class="text">Quản lý người dùng</span>
        </router-link>
      </li>
      <li :class="{ active: currentPage.includes('/manage-enginee') }">
        <router-link to="/admin/manage-engineer">
          <i class="bx bxs-shopping-bag-alt"></i>
          <span class="text">Quản lý Kỹ sư</span>
        </router-link>
      </li>
      <li :class="{ active: currentPage.includes('/manage-report') }">
        <router-link to="/admin/manage-report">
          <i class="bx bxs-shopping-bag-alt"></i>
          <span class="text">Báo Cáo</span>
        </router-link>
      </li>
      <li :class="{ active: currentPage.includes('/repair-equipments') }">
        <router-link to="/admin/repair-equipments">
          <i class="bx bxs-shopping-bag-alt"></i>
          <span class="text">Quản lý thiết bị</span>
        </router-link>
      </li>
      <li :class="{ active: currentPage.includes('/manage-reportsss') }">
        <router-link to="/admin/manage-report">
          <i class="bx bxs-shopping-bag-alt"></i>
          <span class="text">Quản lý kỹ sư</span>
        </router-link>
      </li>
    </ul>
    <ul class="side-menu">
      <li>
        <router-link to="/">
          <i class="bx bxs-cog"></i>
          <span class="text">Settings</span>
        </router-link>
      </li>
      <li>
        <router-link to="/auth" class="logout">
          <i class="bx bxs-log-out-circle"></i>
          <span class="text">Logout</span>
        </router-link>
      </li>
    </ul>
  </section>
</template>

<script setup>
import { defineProps, computed } from "vue";
import { useRoute } from "vue-router";
const route = useRoute();
const props = defineProps({
  sidebar: {
    type: Boolean,
  },
});
const currentPage = computed(() => route.path);
</script>

<style lang="scss" scoped>
/* SIDEBAR */
#sidebar {
  position: fixed;
  top: 0;
  left: 0;
  width: 280px;
  height: 100%;
  background: var(--light);
  z-index: 888;
  font-family: var(--lato);
  transition: 0.3s ease;
  overflow-x: hidden;
  scrollbar-width: none;
}
#sidebar::--webkit-scrollbar {
  display: none;
}
#sidebar.hide {
  width: 60px;
}
#sidebar .brand {
  font-size: 24px;
  font-weight: 700;
  height: 56px;
  display: flex;
  align-items: center;
  color: var(--blue);
  position: sticky;
  top: 0;
  left: 0;
  background: var(--light);
  z-index: 500;
  padding-bottom: 20px;
  box-sizing: content-box;
}
#sidebar .brand .bx {
  min-width: 60px;
  display: flex;
  justify-content: center;
}
#sidebar .side-menu {
  width: 100%;
  margin-top: 20px;
}
#sidebar .side-menu li {
  height: 48px;
  background: transparent;
  margin-left: 6px;
  border-radius: 48px 0 0 48px;
  padding: 4px;
}
#sidebar .side-menu li.active {
  background: #d7d5d5;
  position: relative;
}
#sidebar .side-menu li.active::before {
  content: "";
  position: absolute;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  top: -40px;
  right: 0;
  box-shadow: 20px 20px 0 var(--grey);
  z-index: -1;
}
#sidebar .side-menu li.active::after {
  content: "";
  position: absolute;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  bottom: -40px;
  right: 0;
  box-shadow: 20px -20px 0 var(--grey);
  z-index: -1;
}
#sidebar .side-menu li a {
  width: 100%;
  height: 100%;
  background: var(--light);
  display: flex;
  align-items: center;
  border-radius: 48px;
  font-size: 16px;
  color: var(--dark);
  white-space: nowrap;
  overflow-x: hidden;
}
#sidebar .side-menu.top li.active a {
  color: var(--blue);
}
#sidebar.hide .side-menu li a {
  width: calc(48px - (4px * 2));
  transition: width 0.3s ease;
}
#sidebar .side-menu li a.logout {
  color: var(--red);
}
#sidebar .side-menu.top li a:hover {
  color: var(--blue);
}
#sidebar .side-menu li a .bx {
  min-width: calc(60px - ((4px + 6px) * 2));
  display: flex;
  justify-content: center;
}

@media screen and (max-width: 768px) {
  #sidebar {
    width: 200px;
  }
}
</style>
