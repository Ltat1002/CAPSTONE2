<template>
  <div>
    <TheHeader />
    <router-view />
    <the-footer />
  </div>
</template>

<script setup>
import TheHeader from "../users/components/HeaderUser.vue";
import TheFooter from "../users/components/TheFooter.vue";
</script>
