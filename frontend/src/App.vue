<template>
  <router-view />
  <Toast />
  <big-loading v-if="load"></big-loading>
</template>

<script setup>
import Toast from "primevue/toast";
import BigLoading from "./components/BigLoading.vue";
import { useRegisterStore } from "@/store/register.js";
import { useLoadingStore } from "@/store/loading.js";
import { computed } from "vue";
const register = useRegisterStore();
const load = computed(() => useLoadingStore().load);
register.profile();
</script>

<style lang="scss"></style>
