<template lang="">
  <TheHeader>
    <TheNavbar></TheNavbar>
    <router-view />
  </TheHeader>
</template>
<script setup>
import TheHeader from "./components/TheHeader.vue";
import TheNavbar from "./components/TheNavbar.vue";
</script>
<style lang="scss" scoped></style>
