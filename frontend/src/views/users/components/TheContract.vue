<template lang="">
  <div class="bg-gray-300 min-w-[50vw] flex flex-col justify-center">
    <div class="overflow-hidden">
      <div class="bg-white flex flex-col rounded-xl shadow-lg">
        <!-- <div class="px-4 py-3">
          <h2 class="text-gray-800 text-3xl font-semibold">
            Chi phí thanh toán
          </h2>
        </div> -->
        <div class="bg-gray-200 w-full flex flex-col items-center">
          <div class="flex flex-col items-center py-6 space-y-3">
            <span class="text-[28px] text-gray-800"
              >{{ props.reportActive?.amount_pay }} đ</span
            >
            <div class="flex space-x-3">
              <Rating v-model="rating" :cancel="false" />
            </div>
          </div>
          <div class="w-3/4 flex flex-col">
            <button
              @click.prevent="updateRp"
              class="py-3 my-8 text-lg bg-gradient-to-r from-purple-500 to-indigo-600 rounded-xl text-white"
            >
              Chấp nhận
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { statusReport } from "@/helper/enumStatus";
import { defineProps, defineEmits } from "vue";
const props = defineProps(["reportActive"]);
const emit = defineEmits(["confirmFinish"]);
const updateRp = () => {
  emit(
    "confirmFinish",
    props.reportActive?.id,
    props.reportActive?.key,
    statusReport.acceptedUser,
    props.reportActive?.stt
  );
};
</script>
<style lang=""></style>
