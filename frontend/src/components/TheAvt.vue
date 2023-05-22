<template lang="">
  <div ref="avt" class="avt">{{ character }}</div>
</template>
<script setup>
import { useRegisterStore } from "@/store/register";
import { computed, defineProps, ref, onMounted } from "vue";
const avt = ref(null);
const register = useRegisterStore();
const props = defineProps(["size"]);
const character = computed(() => {
  return register?.account?.first_name[0].toUpperCase();
});
onMounted(() => {
  avt.value.style.fontSize = props.size + "px";
});
</script>
<style lang="scss" scoped>
.avt {
  width: 100%;
  height: 100%;
  background-image: linear-gradient(to right, #f4d03f, #f76b1c);
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
