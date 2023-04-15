<template lang="">
  <div class="wrap">
    <div class="list my-5" v-if="!previewUser">
      <router-link to="/notify/preview">
        <div class="cursor-pointer rounded-md overflow-hidden item">
          <div class="lg:flex">
            <div
              class="w-48 flex-none bg-cover text-center overflow-hidden"
              style="
                background-image: url('https://cdn.tgdd.vn/Files/2014/09/23/568616/broken-iphone-600x400.jpg');
              "
              title="Mountain"
            ></div>
            <div
              class="active border-gray-400 lg:border-gray-400 bg-white p-4 flex flex-col justify-between leading-normal flex-1"
            >
              <div>
                <div class="flex justify-between">
                  <div>
                    <p class="text-sm text-gray-600 flex items-center mb-2">
                      <box-icon
                        name="lock-open"
                        type="solid"
                        animation="tada"
                        class="mr-1"
                        color="#ffffff"
                      ></box-icon>
                      Chưa hoàn thành
                    </p>
                    <div class="text-gray-900 font-bold text-xl">
                      Điện thoại
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
                    <div class="text-gray-900 text-sm">2:16 30-04-2001</div>
                  </div>
                </div>
                <p class="text-gray-700 text-base w-full mt-3">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                </p>
              </div>
            </div>
          </div>
        </div>
      </router-link>
      <router-link to="/notify/preview">
        <div class="cursor-pointer rounded-md overflow-hidden item">
          <div class="lg:flex">
            <div
              class="w-48 flex-none bg-cover text-center overflow-hidden"
              style="
                background-image: url('https://cdn.tgdd.vn/Files/2014/09/23/568616/broken-iphone-600x400.jpg');
              "
              title="Mountain"
            ></div>
            <div
              class="border-gray-400 lg:border-gray-400 bg-white p-4 flex flex-col justify-between leading-normal flex-1"
            >
              <div>
                <div class="flex justify-between">
                  <div>
                    <p class="text-sm text-gray-600 flex items-center mb-2">
                      <box-icon
                        name="lock"
                        type="solid"
                        animation="tada"
                        class="mr-1"
                      ></box-icon>
                      Đã hoàn thành
                    </p>
                    <div class="text-gray-900 font-bold text-xl">
                      Điện thoại
                    </div>
                  </div>
                  <div class="h-full">
                    <p class="text-sm text-gray-600 flex items-center mb-2">
                      <box-icon
                        class="mr-1"
                        name="graphql"
                        type="logo"
                        animation="spin"
                        rotate="90"
                      ></box-icon>
                      Đánh giá
                    </p>
                    <div>
                      <Rating v-model="rating" :cancel="false" readonly />
                    </div>
                  </div>
                  <div>
                    <p class="text-sm text-gray-600 flex items-center mb-2">
                      <i
                        class="pi pi-spin pi-clock mr-2 text-black"
                        style="font-size: 1rem"
                        color="#000"
                      ></i>
                      Thời gian
                    </p>
                    <div class="text-gray-900 text-sm">2:16 30-04-2001</div>
                  </div>
                </div>
                <p class="text-gray-700 text-base w-full mt-3">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit.
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
const route = useRoute();
const previewUser = computed(() => route.path.includes("/notify/preview"));
const rating = ref(4);
const rating2 = ref();
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
