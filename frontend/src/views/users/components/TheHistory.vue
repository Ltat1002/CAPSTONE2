<template lang="">
  <div class="wrap">
    <div
      v-if="!previewUser"
      class="mt-4 text-end flex justify-end mr-[-32px] ml-[-32px]"
    >
      <span class="p-input-icon-left flex-1 mr-8 ml-8">
        <i class="pi pi-search" />
        <InputText v-model="search" placeholder="Tìm kiếm" class="w-full" />
      </span>
      <router-link to="/report-problem" class="mr-8 ml-8">
        <Button label="Tạo báo cáo"
      /></router-link>
    </div>
    <div class="list my-5" v-if="!previewUser">
      <div v-if="loading" class="text-center"><TheLoading /></div>
      <router-link
        v-else
        v-for="his in historyRepair"
        :key="his?.id"
        :to="`/notify/preview/${his?.id}`"
      >
        <div class="cursor-pointer rounded-md overflow-hidden item">
          <div class="lg:flex">
            <div
              class="w-48 flex-none bg-cover text-center overflow-hidden"
              :style="{
                'background-image': `url('${his.images}')`,
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
                      Hoàn thành
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
                      {{
                        new Date(his.updated_at).toLocaleDateString("en-GB", {
                          day: "numeric",
                          month: "numeric",
                          year: "numeric",
                          hour: "numeric",
                          minute: "2-digit",
                        })
                      }}
                    </div>
                  </div>
                </div>
                <p class="text-gray-700 text-base w-full mt-3 line-clamp-2">
                  {{ his.description.body }}
                </p>
              </div>
            </div>
          </div>
        </div>
      </router-link>
      <div
        class="text-center leading-[50vh]"
        v-if="!loading && !(historyRepair.length > 0)"
      >
        Không có báo cáo
      </div>
    </div>
    <router-view v-else></router-view>
  </div>
</template>
<script setup>
import Rating from "primevue/rating";
import { useRoute } from "vue-router";
import Button from "primevue/button";
import InputText from "primevue/inputtext";
import TheLoading from "@/components/TheLoading.vue";
import { ref, computed, watch } from "vue";
import { useReportStore } from "@/store/report";
const reportStore = useReportStore();
const route = useRoute();
const previewUser = computed(() => route.path.includes("/notify/preview"));
const rating2 = ref();
const historyRepair = ref([]);
const loading = ref(false);
const reportHistoryRepair = async () => {
  loading.value = true;
  await reportStore
    .reportHistoryRepair()
    .then((res) => {
      console.log(res.data);
      historyRepair.value = res.data;
    })
    .finally(() => {
      loading.value = false;
    });
};
const search = ref("");
reportHistoryRepair();
watch(search, () => {
  reportStore
    .searchReport(search.value)
    .then((res) => {
      historyRepair.value = res.data;
    })
    .catch(() => {
      historyRepair.value = [];
    });
});
</script>
<style lang="scss" scoped>
.wrap {
  min-height: 50vh;
}
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
