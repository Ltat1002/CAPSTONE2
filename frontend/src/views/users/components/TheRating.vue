<template lang="">
  <div class="bg-gray-300 flex flex-col justify-center">
    <div class="sm:max-w-xl sm:mx-auto overflow-hidden">
      <div class="bg-white flex flex-col rounded-xl shadow-lg">
        <div class="px-4 py-3">
          <h2 class="text-gray-800 text-3xl font-semibold">
            Your opinion matters to us!
          </h2>
        </div>
        <div class="bg-gray-200 w-full flex flex-col items-center">
          <div class="flex flex-col items-center py-6 space-y-3">
            <span class="text-lg text-gray-800"
              >How was quality of the call?</span
            >
            <div class="flex space-x-3">
              <Rating v-model="rating" :cancel="false" />
            </div>
          </div>
          <div class="w-3/4 flex flex-col">
            <textarea rows="3" class="p-4 text-gray-500 rounded-xl resize-none">
Leave a message, if you want</textarea
            >
            <button
              class="py-3 my-8 text-lg bg-gradient-to-r from-purple-500 to-indigo-600 rounded-xl text-white"
            >
              Rate now
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import Rating from "primevue/rating";
import { ref } from "vue";
const rating = ref(4);
</script>
