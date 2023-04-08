<template lang="">
  <header-user />
  <router-view></router-view>
  <the-footer />
</template>
<script setup>
import HeaderUser from "./components/HeaderUser.vue";
import TheFooter from "./components/TheFooter.vue";
</script>
<style lang="scss" scoped></style>
