<template lang="">
  <div class="wrap">
    <div class="list my-5" v-if="!previewUser">
      <router-link
        v-for="his in historyRepair"
        :key="his?.id"
        to="/notify/preview"
      >
        <div class="cursor-pointer rounded-md overflow-hidden item">
          <div class="lg:flex">
            <div
              class="w-48 flex-none bg-cover text-center overflow-hidden"
              :style="{
                'background-image': 'url(' + his.images + ')',
              }"
              title="Mountain"
            ></div>
            <div
              class="active border-gray-400 lg:border-gray-400 bg-white p-4 flex flex-col justify-between leading-normal flex-1"
            >
              <div>
                <div class="flex justify-between">
                  <div>
                    <p
                      v-if="his.status === 0"
                      class="text-sm text-gray-600 flex items-center mb-2"
                    >
                      <box-icon
                        name="lock-open"
                        type="solid"
                        animation="tada"
                        class="mr-1"
                        color="#ffffff"
                      ></box-icon>
                      Chưa hoàn thành
                    </p>
                    <p
                      v-else
                      class="text-sm text-gray-600 flex items-center mb-2"
                    >
                      <box-icon
                        name="lock-open"
                        type="solid"
                        animation="tada"
                        class="mr-1"
                        color="#ffffff"
                      ></box-icon>
                      hoàn thành
                    </p>

                    <div class="text-gray-900 font-bold text-xl">
                      {{ his.name }}
                    </div>
                  </div>
                  <div class="h-full">
                    <p class="text-sm text-gray-600 flex items-center mb-2">
                      <box-icon
                        class="mr-1"
                        color="#fff"
                        name="graphql"
                        type="logo"
                        animation="spin"
                        rotate="90"
                      ></box-icon>
                      Đánh giá
                    </p>
                    <div>
                      <Rating v-model="rating2" :cancel="false" />
                    </div>
                  </div>
                  <div>
                    <p class="text-sm text-gray-600 flex items-center mb-2">
                      <i
                        class="pi pi-spin pi-clock mr-2"
                        style="font-size: 1rem"
                      ></i>
                      Thời gian
                    </p>
                    <div class="text-gray-900 text-sm">
                      {{ his.updated_at }}
                    </div>
                  </div>
                </div>
                <p class="text-gray-700 text-base w-full mt-3">
                  {{ his.description.body }}
                </p>
              </div>
            </div>
          </div>
        </div>
      </router-link>
    </div>
    <router-view v-else></router-view>
  </div>
</template>
<script setup>
import Rating from "primevue/rating";
import { useRoute } from "vue-router";
import { ref, computed } from "vue";
import { useReportStore } from "@/store/report";
const reportStore = useReportStore();
const route = useRoute();
const previewUser = computed(() => route.path.includes("/notify/preview"));
const rating2 = ref();
const historyRepair = ref([]);
const reportHistoryRepair = async () => {
  await reportStore.reportHistoryRepair().then((res) => {
    historyRepair.value = res.data;
    console.log(res.data);
  });
};
reportHistoryRepair();
</script>
<style lang="scss" scoped>
.item {
  box-shadow: 0 0 8px 2px #ccc;
}
:deep(.p-rating .p-rating-item.p-rating-item-active .p-rating-icon) {
  color: #fad02c;
}

:deep(
    .p-rating:not(.p-disabled):not(.p-readonly)
      .p-rating-item:hover
      .p-rating-icon
  ) {
  filter: brightness(0.8);
  color: #fad02c;
}
.active {
  background-color: #577a6d !important;
  :deep(.p-rating .p-rating-item.p-rating-item-active .p-rating-icon) {
    color: #fff;
  }

  :deep(.p-rating .p-rating-item .p-rating-icon) {
    color: #fff;
  }

  :deep(
      .p-rating:not(.p-disabled):not(.p-readonly)
        .p-rating-item:hover
        .p-rating-icon
    ) {
    filter: brightness(0.8);
    color: #fff;
  }
  p {
    color: #fff !important;
  }
  div {
    color: #fff !important;
  }
  svg {
    color: #fff !important;
  }
}
.list {
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  grid-gap: 20px;
}
a {
  text-decoration: none;
}
</style>
