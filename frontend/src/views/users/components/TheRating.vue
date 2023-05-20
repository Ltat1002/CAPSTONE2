<template lang="">
  <div class="bg-gray-300 flex flex-col justify-center">
    <div class="overflow-hidden">
      <div class="bg-white flex flex-col rounded-xl shadow-lg">
        <div class="bg-gray-200 w-full flex flex-col items-center">
          <div class="flex flex-col items-center py-6 space-y-3">
            <span class="text-lg text-gray-800"
              >Chất lượng về kỹ sư này như thế nào?</span
            >
            <div class="flex space-x-3">
              <Rating v-model="ratingContent.rating" :cancel="false" />
            </div>
          </div>
          <div class="w-3/4 flex flex-col">
            <textarea
              v-model="ratingContent.comment"
              rows="3"
              class="p-4 text-gray-500 rounded-xl resize-none"
            ></textarea>
            <button
              @click="submitRating"
              class="py-2 my-6 text-lg bg-gradient-to-r from-purple-500 to-indigo-600 rounded-xl text-white"
            >
              Đánh giá
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

import { statusReport } from "@/helper/enumStatus";
import { defineProps, defineEmits, watchEffect } from "vue";
import { useReportStore } from "@/store/report.js";
const props = defineProps(["reportActive"]);
const emit = defineEmits(["confirmFinish"]);
const rp = useReportStore();
const ratingContent = ref({ rating: 0, comment: "" });
watchEffect(() => {
  if (props.reportActive.review) {
    ratingContent.value = {
      rating: props.reportActive.review.rating,
      comment: props.reportActive.review.comment,
    };
  }
});
const submitRating = () => {
  updateRp();
  rp.createRating({
    ...ratingContent.value,
    report_id: props.reportActive?.id,
  });
};
const updateRp = () => {
  emit(
    "confirmFinish",
    props.reportActive?.id,
    props.reportActive?.key,
    statusReport.rating,
    props.reportActive?.stt
  );
};
</script>
<style>
.p-dialog {
  width: 50vw;
}
</style>
