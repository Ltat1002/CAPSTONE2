<template lang="">
  <div>
    <the-banner></the-banner>
    <about-user></about-user>
    <repair-service />
    <show-project />
  </div>
</template>
<script setup>
import TheBanner from "../components/TheBanner.vue";
import AboutUser from "@/views/users/components/AboutUser.vue";
import RepairService from "../components/RepairService.vue";
import ShowProject from "../components/ShowProject.vue";
</script>
<style lang="scss" scoped></style>
