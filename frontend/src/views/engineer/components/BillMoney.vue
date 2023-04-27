<template lang="">
  <div>
    <form @submit="onSubmit" class="flex flex-column">
      <label for="">Số tiền</label>
      <InputText type="text" v-model="value" />
      <label for="value">Nội dung</label>
      <Textarea id="value" v-model="value" class="w-full h-40" />
      <small id="text-error" class="p-error">{{
        errorMessage || "&nbsp;"
      }}</small>
      <div class="text-center">
        <Button type="submit" label="Submit" severity="success" />
      </div>
    </form>
  </div>
</template>
<script setup>
import Button from "primevue/button";
import Textarea from "primevue/textarea";
import InputText from "primevue/inputtext";
</script>
<style lang="scss"></style>
