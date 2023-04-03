<template lang="">
  <div class="wrap">
    <div class="nav">
      <div class="logo">
        <router-link to="/"> HOME REPAIR SERVICES </router-link>
      </div>
      <div>
        <i class="bx bx-location-plus"></i>
        <span>5604 Willow Crossing Ct, Clifton, VA, 20124</span>
      </div>
      <div>
        <i class="bx bx-location-plus"></i>
        <span>5604 Willow Crossing Ct, Clifton, VA, 20124</span>
      </div>
      <div>
        <i class="bx bx-location-plus"></i>
        <span>5604 Willow Crossing Ct, Clifton, VA, 20124</span>
      </div>
    </div>
  </div>
</template>
<script setup></script>
<style lang="scss" scoped>
.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 0;
  .logo {
    a {
      font-size: 3.3rem;
      color: black;
    }
  }
  div {
    text-align: center;
    padding-right: 10px;
    i {
      font-size: 1.8rem;
    }
    span {
      font-size: 1.6rem;
    }
  }
}
</style>
