<template lang="">
  <ul
    class="wrap"
    v-if="!route.path.includes('engineer/receive-report/preview')"
  >
    <li v-for="receive in listReceive" :key="receive.id">
      <router-link :to="`/engineer/receive-report/preview/${receive.id}`">
        <article
          class="flex items-center space-x-6 p-6 my-[20px] rounded-lg"
          :class="
            receive.status >= statusReport.finishUser
              ? 'bg-[#222a39] text-[#fff]'
              : 'bg-[#89cdfa] text-black'
          "
        >
          <img
            :src="receive.images"
            alt=""
            class="flex-none rounded-md bg-slate-100 h-[130px] w-[160px] object-cover"
          />
          <div class="min-w-0 relative flex-auto">
            <h2 class="font-semibold truncate pr-20">
              {{ receive.name }}
            </h2>
            <dl class="mt-2 flex flex-wrap text-sm leading-6 font-medium">
              <div class="absolute top-0 right-0 flex items-center space-x-1">
                <dt class="text-sky-500">
                  <p class="text-sm text-gray-600 flex items-center mb-2">
                    <box-icon
                      class="mr-1"
                      color="#fff"
                      name="graphql"
                      type="logo"
                      animation="spin"
                      rotate="90"
                    ></box-icon>
                    {{
                      receive?.review?.rating ? "Đã đánh giá" : "Chưa đánh giá"
                    }}
                  </p>
                  <div>
                    <Rating
                      :modelValue="receive?.review?.rating || 0"
                      readonly
                      :cancel="false"
                    />
                  </div>
                </dt>
              </div>
              <div>
                <dt class="sr-only">Rating</dt>
                <dd class="px-1.5 ring-1 ring-slate-200 rounded">
                  {{ receive.mobile }}
                </dd>
              </div>
              <div class="ml-2">
                <dt class="sr-only">Year</dt>
                <dd>{{ receive.user_send.email }}</dd>
              </div>
              <div>
                <dt class="sr-only">Genre</dt>
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
                  {{ receive.repair_equipment.name }}
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
                  {{ receive.runtime }}
                </dd>
              </div>
              <div
                class="flex w-full justify-between mt-2 font-normal gap-3 items-center"
              >
                <dt class="sr-only">Cast</dt>
                <dd class="line-clamp-2 w-[70%]">
                  {{ receive.description.body }}
                </dd>
              </div>
              <div class="flex items-center w-full justify-between">
                <div class="flex">
                  <p class="mr-2">Ngày tạo đơn:</p>
                  <dd>
                    {{
                      new Date(receive.created_at).toLocaleDateString("en-GB", {
                        day: "numeric",
                        month: "numeric",
                        year: "numeric",
                        hour: "numeric",
                        minute: "2-digit",
                      })
                    }}
                  </dd>
                </div>
                <div class="flex gap-3 shrink-0">
                  <Button
                    :loading="loadingBtnList[0]"
                    icon="pi pi-send"
                    v-if="
                      String(receive.status) === String(statusReport.pending)
                    "
                    size="small"
                    label="Chấp nhận"
                    @click.stop.prevent="
                      () => {
                        handleClickSuccess(
                          receive.id,
                          receive.key,
                          statusReport.acceptedEngineer,
                          0
                        );
                      }
                    "
                    severity="danger"
                  />
                  <Button
                    icon="pi pi-wrench"
                    v-if="
                      String(receive.status) ===
                      String(statusReport.acceptedEngineer)
                    "
                    size="small"
                    label="Tiến hành"
                    @click.stop.prevent="
                      () => {
                        handleClickProceed(receive.id, receive.key);
                      }
                    "
                    severity="warning"
                  />
                  <Button
                    icon="pi pi-tags"
                    @click.prevent="() => {}"
                    v-if="
                      String(receive.status) ===
                        String(statusReport.enforcementEngineer) ||
                      String(receive.status) ===
                        String(statusReport.finishEngineer)
                    "
                    size="small"
                    label="Đang chờ"
                    severity="help"
                  />
                  <Button
                    :loading="loadingBtnList[1]"
                    icon="pi pi-verified"
                    v-if="
                      String(receive.status) ===
                      String(statusReport.acceptedUser)
                    "
                    size="small"
                    label="Hoàn thành"
                    @click.stop.prevent="
                      () => {
                        handleClickSuccess(
                          receive.id,
                          receive.key,
                          statusReport.finishEngineer,
                          1
                        );
                      }
                    "
                    severity="success"
                  />
                  <Button
                    @click.stop.prevent="() => {}"
                    icon="pi pi-share-alt"
                    v-if="
                      String(receive.status) >= String(statusReport.finishUser)
                    "
                    size="small"
                    label="Đã hoàn thành"
                    severity="warning"
                  />
                </div>
              </div>
            </dl>
          </div>
        </article>
      </router-link>
    </li>
    <div
      class="text-center m-auto leading-[50vh]"
      v-if="listReceive.length === 0"
    >
      Không có thông báo
    </div>
  </ul>
  <router-view v-else></router-view>
  <Dialog
    v-model:visible="visible"
    modal
    header="Tiến hành"
    :style="{ width: '50vw' }"
  >
    <BillMoney
      @setVisible="
        (val) => {
          visible = val;
          getReports();
        }
      "
      :idBill="idBill"
    />
  </Dialog>
</template>
<script setup>
import { ref, watchEffect, onMounted } from "vue";
import { useEngineerStore } from "@/store/engineer.js";
import Button from "primevue/button";
import { useRoute } from "vue-router";
import { asyncComputed } from "@vueuse/core";
import Rating from "primevue/rating";
import { getReport, updateReportById } from "@/helper/realtime.js";
import { statusReport } from "@/helper/enumStatus";
import { toastMessage } from "@/helper/toastMessage.js";
import Dialog from "primevue/dialog";
import BillMoney from "@/views/engineer/components/BillMoney.vue";
import { useRegisterStore } from "@/store/register.js";
// import { useReportStore } from "@/store/report";
const engineerStore = useEngineerStore();
// const reportStore = useReportStore();
const route = useRoute();
const visible = ref(false);
const listReceive = ref([]);
const report = ref([]);
const loadingBtnList = ref([false, false]);

const profile = asyncComputed(
  async () => {
    return await useRegisterStore().account;
  },
  {
    email: "",
    first_name: "",
    last_name: "",
    mobile: "",
    address: "",
  }
);
onMounted(() => {
  getReport(report);
});
watchEffect(async () => {
  getReports();
});

const handleClickSuccess = async (id, key, status, stt) => {
  loadingBtnList.value[stt] = true;
  setTimeout(() => {
    engineerStore
      .receive({
        id,
        status: status,
      })
      .then(() => {
        updateReportById(key, {
          ...report.value.find((item) => {
            return String(item.report_id) === String(id);
          }),
          status: status,
          user_receive_id: String(profile.value.id),
        }).then(() => {
          toastMessage("success", "Thành công", "Thao tác thành công");
          loadingBtnList.value[stt] = false;
        });
      })
      .catch(() => {
        toastMessage("success", "Thất bại", "Thao tác thất bại");
      });
  }, 2000);
};
async function getReports() {
  const ReportIdList = report.value.reduce((accumulator, currenValue) => {
    if (
      currenValue.engineer_id.split(", ").includes(String(profile.value.id)) &&
      (currenValue.status === statusReport.pending ||
        String(currenValue.user_receive_id) === String(profile.value.id))
    ) {
      accumulator.push(currenValue.report_id);
    }
    return accumulator;
  }, []);
  if (ReportIdList.length > 0) {
    const res = await engineerStore.getReportByListId(ReportIdList);
    listReceive.value = res.data.map((item) => {
      const newRp = report.value.find(
        (rp) => String(rp.report_id) === String(item.id)
      );
      return {
        ...item,
        key: newRp?.key || "",
      };
    });
  }
}
const idBill = ref("");
function handleClickProceed(id, key) {
  idBill.value = {
    id: id,
    key: key,
    reportRealtime: report.value.find((item) => item.key === key),
  };
  visible.value = true;
}
</script>
<style scoped lang="scss">
.wrap {
  min-height: 50vh;
}
:deep(.p-button) {
  height: 40px !important;
  width: 220px !important;
}
:deep(.p-rating .p-rating-item.p-rating-item-active .p-rating-icon) {
  color: #f59e0b;
}
:deep(.p-rating) {
  justify-content: end;
}
</style>
