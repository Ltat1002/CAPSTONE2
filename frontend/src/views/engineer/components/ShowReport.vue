<template lang="">
  <section class="py-10 lg:py-16">
    <div class="max-w-[800px] mx-auto px-4">
      <article
        class="p-6 mb-6 text-base bg-white rounded-lg dark:bg-gray-900"
        v-for="index in 10"
        :key="index"
      >
        <footer class="mb-2">
          <div class="flex items-center justify-between">
            <div class="inline-flex items-center mr-3 text-sm text-gray-90">
              <img
                class="mr-2 w-10 h-10 rounded-full"
                src="https://flowbite.com/docs/images/people/profile-picture-2.jpg"
                alt="Michael Gough"
              />
              <p>
                <span>Michael Gough</span>
                <Rating v-model="rating" :cancel="false" readonly />
              </p>
            </div>
            <p class="text-sm flex flex-col">
              <time pubdate datetime="2022-02-08" title="February 8th, 2022"
                >Feb. 8, 2022</time
              >
            </p>
          </div>
        </footer>
        <p class="text-gray-700">
          Very straight-to-point article. Really worth time reading. Thank you!
          But tools are just the instruments for the UX designers. The knowledge
          of the design tools are as important as the creation of the design
          strategy.
        </p>
        <router-link :to="`/preview/${index}`" class="flex justify-end mt-2">
          <p
            class="bg-green-500 text-center text-[#fff] rounded-[16px] cursor-pointer px-3 py-1"
          >
            Chi tiết
          </p>
        </router-link>
      </article>
    </div>
  </section>
</template>
<script setup>
import Rating from "primevue/rating";
import { ref } from "vue";
const rating = ref(4);
</script>
<style lang="scss" scoped>
:deep(.p-rating .p-rating-item.p-rating-item-active .p-rating-icon) {
  color: #fad02c;
}
</style>
