<template>
  <div>
    <the-navbar :sidebar="sidebar" />
    <the-header @sidebar="handleSidebar">
      <router-view />
    </the-header>
  </div>
</template>

<script setup>
import TheNavbar from "@/components/TheNavbar.vue";
import TheHeader from "@/components/TheHeader.vue";
import { ref } from "vue";
const sidebar = ref(false);
function handleSidebar() {
  sidebar.value = !sidebar.value;
}
</script>
