<template>
  <router-view />
  <Toast />
</template>

<script setup>
import Toast from "primevue/toast";
import { useRegisterStore } from "@/store/register.js";
const register = useRegisterStore();
register.profile();
</script>

<style lang="scss"></style>
