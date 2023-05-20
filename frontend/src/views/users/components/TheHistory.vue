<template lang="">
  <div class="wrap">
    <div
      v-if="!previewUser"
      class="mt-4 text-end flex items-center justify-end mr-[-32px] ml-[-32px]"
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
      <ul v-else class="wrap">
        <li v-for="history in historyRepair" :key="history?.id">
          <router-link :to="`/notify/preview/${history?.id}`">
            <article
              class="flex items-center space-x-6 p-6 my-[20px] rounded-lg text-white"
              :class="
                history.status >= statusReport.finishUser
                  ? 'bg-[#222a39]'
                  : 'bg-[#2255a4]'
              "
            >
              <img
                :src="history.images"
                alt=""
                class="flex-none rounded-md bg-slate-100 h-[130px] w-[160px] object-cover"
              />
              <div class="min-w-0 relative flex-auto">
                <h2 class="font-semibold truncate pr-20">
                  {{ history.name }}
                </h2>
                <dl class="mt-2 flex flex-wrap text-sm leading-6 font-medium">
                  <div
                    class="absolute top-0 right-0 flex items-center space-x-1"
                  >
                    <dt class="text-sky-500">
                      <p class="text-sm text-white flex items-center mb-2">
                        <box-icon
                          class="mr-1"
                          color="#fff"
                          name="graphql"
                          type="logo"
                          animation="spin"
                          rotate="90"
                        ></box-icon>
                        {{
                          history?.review?.rating
                            ? "Đã đánh giá"
                            : "Chưa đánh giá"
                        }}
                      </p>
                      <div>
                        <Rating
                          :modelValue="history?.review?.rating || 0"
                          readonly
                          :cancel="false"
                        />
                      </div>
                    </dt>
                  </div>
                  <div>
                    <dt class="sr-only">Rating</dt>
                    <dd class="px-1.5 ring-1 ring-slate-200 rounded">
                      {{
                        history.status >= statusReport.finishUser
                          ? "Hoàn thành"
                          : "Đang tiến hành"
                      }}
                    </dd>
                  </div>
                  <div class="ml-2">
                    <dt class="sr-only">Year</dt>
                    <dd>{{ history.user_send.email }}</dd>
                  </div>
                  <div>
                    <dt class="sr-only">Genre</dt>
                    <dd class="flex items-center">
                      <svg
                        width="2"
                        height="2"
                        fill="currentColor"
                        class="mx-2"
                        aria-hidden="true"
                      >
                        <circle cx="1" cy="1" r="1" />
                      </svg>
                      {{ history.repair_equipment.name }}
                    </dd>
                  </div>
                  <div class="ml-2">
                    <dt class="sr-only">Rating</dt>
                    <dd>
                      {{ history.mobile }}
                    </dd>
                  </div>
                  <div>
                    <dt class="sr-only">Runtime</dt>
                    <dd class="flex items-center">
                      <svg
                        width="2"
                        height="2"
                        fill="currentColor"
                        class="mx-2 text-slate-300"
                        aria-hidden="true"
                      >
                        <circle cx="1" cy="1" r="1" />
                      </svg>
                      {{ history.runtime }}
                    </dd>
                  </div>
                  <div
                    class="flex w-full justify-between mt-2 font-normal gap-3 items-center"
                  >
                    <dt class="sr-only">Cast</dt>
                    <dd class="line-clamp-2 w-[70%]">
                      {{ history.description.body }}
                    </dd>
                  </div>
                  <div class="flex justify-between items-center w-full">
                    <div class="flex">
                      <p class="mr-2">Ngày tạo đơn:</p>
                      <dd>
                        {{
                          new Date(history.created_at).toLocaleDateString(
                            "en-GB",
                            {
                              day: "numeric",
                              month: "numeric",
                              year: "numeric",
                              hour: "numeric",
                              minute: "2-digit",
                            }
                          )
                        }}
                      </dd>
                    </div>
                    <div class="flex gap-3 shrink-0">
                      <Button
                        :loading="
                          loadingBtnList[3] && reportActive.id === history.id
                        "
                        @click.prevent="
                          confirmFinish(
                            history.id,
                            history?.key || '',
                            history.status - 1,
                            3
                          )
                        "
                        icon="pi pi-thumbs-up"
                        v-if="
                          history.status === statusReport.finishEngineer ||
                          history.status === statusReport.enforcementEngineer
                        "
                        size="small"
                        label="Từ chối"
                        severity="danger"
                      />
                      <Button
                        :loading="
                          loadingBtnList[0] && reportActive.id === history.id
                        "
                        @click.prevent="() => handleShowContract(history, 0)"
                        icon="pi pi-th-large"
                        v-if="
                          history.status === statusReport.enforcementEngineer
                        "
                        size="small"
                        label="Đơn giá"
                        severity="warning"
                      />
                      <Button
                        :loading="
                          loadingBtnList[1] && reportActive.id === history.id
                        "
                        @click.prevent="
                          confirmFinish(
                            history.id,
                            history?.key || '',
                            statusReport.finishUser,
                            1
                          )
                        "
                        icon="pi pi-share-alt"
                        v-if="history.status === statusReport.finishEngineer"
                        size="small"
                        label="Xác nhận hoàn thành"
                        severity="warning"
                      />
                      <Button
                        :loading="
                          loadingBtnList[2] && reportActive.id === history.id
                        "
                        @click.prevent="() => handleRating(history, 2)"
                        icon="pi pi-thumbs-up"
                        v-if="history.status >= statusReport.finishUser"
                        size="small"
                        :label="
                          history.status > statusReport.finishUser
                            ? 'Thay đổi đánh giá'
                            : 'Đánh giá'
                        "
                        severity="warning"
                      />
                      <div
                        class="text-[#F59E0B]"
                        v-if="
                          history.status !== statusReport.enforcementEngineer &&
                          history.status !== statusReport.finishUser &&
                          history.status !== statusReport.finishEngineer &&
                          history.status !== statusReport.rating
                        "
                      >
                        Đang tiến hành...
                      </div>
                    </div>
                  </div>
                </dl>
              </div>
            </article>
          </router-link>
        </li>
        <div
          class="text-center m-auto leading-[50vh]"
          v-if="historyRepair.length === 0"
        >
          Không có thông báo
        </div>
      </ul>
    </div>
    <router-view v-else></router-view>
  </div>
  <Dialog v-model:visible="visible" modal header="Đánh giá">
    <TheRating @confirmFinish="confirmFinish" :reportActive="reportActive" />
  </Dialog>
  <Dialog v-model:visible="displayContract" modal header="Chi phí thanh toán">
    <TheContract @confirmFinish="confirmFinish" :reportActive="reportActive" />
  </Dialog>
</template>
<script setup>
import Dialog from "primevue/dialog";
import TheRating from "../components/TheRating.vue";
import TheContract from "./TheContract.vue";
import Rating from "primevue/rating";
import { useRoute } from "vue-router";
import Button from "primevue/button";
import InputText from "primevue/inputtext";
import { updateReportById } from "@/helper/realtime.js";
import { getReportById } from "@/helper/report.js";
import { statusReport } from "@/helper/enumStatus";
import TheLoading from "@/components/TheLoading.vue";
import { ref, computed, watch, onMounted } from "vue";
import { useEngineerStore } from "@/store/engineer";
import { toastMessage } from "@/helper/toastMessage.js";
import { getReport } from "@/helper/realtime.js";
import { useReportStore } from "@/store/report";
const engineerStore = useEngineerStore();
const reportStore = useReportStore();
const route = useRoute();
const previewUser = computed(() => route.path.includes("/notify/preview"));
const visible = ref(false);
const displayContract = ref(false);
const reportActive = ref(null);
const historyRepair = ref([]);
const loading = ref(false);
const loadingBtnList = ref([false, false, false, false]);
const report = ref([]);
onMounted(() => {
  getReport(report);
});
watch(
  () => report.value,
  () => {
    reportHistoryRepair();
  }
);

const handleRating = (rp, stt) => {
  reportActive.value = {
    ...rp,
    stt: stt,
  };
  visible.value = true;
};

// const hiddenDialog = () => {
//   visible.value = false;
//   displayContract.value = false;
// };

const handleShowContract = (rp, stt) => {
  displayContract.value = true;
  reportActive.value = {
    ...rp,
    stt: stt,
  };
};

const confirmFinish = (id, key, status, stt) => {
  reportActive.value = {
    id: id,
  };
  console.log("ok");
  loadingBtnList.value[stt] = true;
  visible.value = false;
  displayContract.value = false;
  setTimeout(() => {
    engineerStore
      .receive({
        id,
        status: status,
      })
      .then(() => {
        updateReportById(key, {
          ...getReportById(report.value, key),
          status: status,
        }).then(() => {
          reportHistoryRepair();
          toastMessage("success", "Thành công", "Thao tác thành công");
          loadingBtnList.value[stt] = false;
        });
      })
      .catch(() => {
        toastMessage("error", "Thất bại", "Thao tác thất bại");
        loadingBtnList.value[stt] = false;
      });
  }, 2000);
};
const reportHistoryRepair = async () => {
  await reportStore
    .reportHistoryRepair()
    .then((res) => {
      historyRepair.value =
        res.data?.map((rp) => {
          const newRp = report.value.find((rprt) => rprt.report_id === rp.id);
          // console.log(report.value);
          return {
            ...rp,
            key: newRp?.key || "",
          };
        }) || [];
    })
    .finally(() => {
      loading.value = false;
    });
};
const search = ref("");
loading.value = true;
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
    color: #fad02c;
  }

  :deep(.p-rating .p-rating-item .p-rating-icon) {
    color: #fad02c;
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
:deep(.p-rating .p-rating-item .p-rating-icon) {
  color: #fad02c !important;
}
.list {
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  grid-gap: 20px;
}
a {
  text-decoration: none;
}
:deep(.p-button) {
  height: 40px !important;
  width: 220px !important;
}
:deep(.p-rating) {
  justify-content: end;
}
</style>
