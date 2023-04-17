<template lang="">
  <div>
    <div class="card flex justify-content-center">
      <form @submit="onSubmit" class="flex flex-column gap-2">
        <span class="p-float-label">
          <Textarea
            id="value"
            v-model="value"
            :class="{ 'p-invalid': errorMessage }"
            rows="4"
            cols="30"
            aria-describedby="text-error"
          />
          <label for="value">Description</label>
        </span>
        <small id="text-error" class="p-error">{{
          errorMessage || "&nbsp;"
        }}</small>
        <InputText type="text" v-model="value" />
        <Button type="submit" label="Submit" />
      </form>
    </div>
  </div>
</template>
<script setup>
import Button from "primevue/button";
import Textarea from "primevue/textarea";
import InputText from "primevue/inputtext";
</script>
<style lang="scss"></style>
