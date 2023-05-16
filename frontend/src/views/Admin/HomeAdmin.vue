<template lang="">
  <TheNavbar :sidebar="sidebar"></TheNavbar>
  <TheHeader @click="handleSide">
    <router-view />
  </TheHeader>
</template>
<script setup>
import TheHeader from "./components/TheHeader.vue";
import TheNavbar from "./components/TheNavbar.vue";
import { ref } from "vue";
const sidebar = ref(false);
function handleSide() {
  sidebar.value = !sidebar.value;
}
</script>
<style lang="scss" scoped></style>
