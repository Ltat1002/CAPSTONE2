<template lang="">
  <h1>{{ props.title }}</h1>
</template>
<script setup>
import { defineProps } from "vue";
const props = defineProps(["title"]);
</script>
<style lang="scss" scoped>
h1 {
  text-align: center;
  color: var(--color-title);
  margin-bottom: 20px;
  font-size: 2rem;
  font-weight: 700;
}
</style>
