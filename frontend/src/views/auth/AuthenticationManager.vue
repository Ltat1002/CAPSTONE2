<template lang="">
  <div>
    <router-view></router-view>
    <div v-for="value in data" :key="value.value">{{ value.value }}</div>
  </div>
</template>
<script setup>
const data = [{ value: "Name" }];
</script>
<style lang=""></style>
