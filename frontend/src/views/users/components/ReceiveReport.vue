<template lang="">
  <ul
    class="wrap"
    v-if="!route.path.includes('engineer/receive-report/preview')"
  >
    <li v-for="receive in listReceive" :key="receive.id">
      <router-link :to="`/engineer/receive-report/preview/${receive.id}`">
        <article
          class="flex items-start space-x-6 p-6 bg-[#89cdfa] my-[20px] rounded-lg"
        >
          <img
            :src="receive.images"
            alt=""
            class="flex-none rounded-md bg-slate-100 h-[130px] w-[160px] object-cover"
          />
          <div class="min-w-0 relative flex-auto">
            <h2 class="font-semibold text-slate-900 truncate pr-20">
              {{
                receive.user_send.first_name + " " + receive.user_send.last_name
              }}
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
                    Đánh giá
                  </p>
                  <div>
                    <Rating v-model="rating2" :cancel="false" />
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
              <div class="flex w-full justify-between mt-2 font-normal">
                <dt class="sr-only">Cast</dt>
                <dd>{{ receive.description.body }}</dd>
                <div>
                  <Button
                    size="small"
                    label="Chấp nhận"
                    @click="
                      () => {
                        handleClickSuccess(receive.id);
                      }
                    "
                    severity="success"
                  />
                  <Button
                    size="small"
                    label="Tiến hành"
                    @click="
                      () => {
                        handleClickProceed(receive.id);
                      }
                    "
                    severity="success"
                  />
                </div>
              </div>
              <div class="flex">
                <p class="mr-2">Ngày tạo đơn:</p>
                <dd>
                  {{
                    new Date(
                      receive.repair_equipment.created_at
                    ).toLocaleDateString("en-GB", {
                      day: "numeric",
                      month: "numeric",
                      year: "numeric",
                      hour: "numeric",
                      minute: "2-digit",
                    })
                  }}
                </dd>
              </div>
            </dl>
          </div>
        </article>
      </router-link>
    </li>
  </ul>
  <router-view v-else></router-view>
  <Dialog
    v-model:visible="visible"
    modal
    header="Tiến hành"
    :style="{ width: '50vw' }"
  >
    <BillMoney />
  </Dialog>
</template>
<script setup>
import { ref, onMounted } from "vue";
import { useEngineerStore } from "@/store/engineer.js";
import Button from "primevue/button";
import { useRoute } from "vue-router";
import { toastMessage } from "@/helper/toastMessage.js";
import Dialog from "primevue/dialog";
import BillMoney from "@/views/engineer/components/BillMoney.vue";
const route = useRoute();
const visible = ref(false);
const engineerStore = useEngineerStore();
const listReceive = ref();
const listReceiveReport = async () => {
  engineerStore
    .receiveReport()
    .then((res) => {
      listReceive.value = res.data;
    })
    .catch((e) => {
      console.log(e);
    });
};
const handleClickSuccess = async (id) => {
  console.log({
    id,
    status: 1,
  });
  engineerStore
    .receive({
      id,
      status: 1,
    })
    .then(() => {
      toastMessage("success", "Thành công", "Nhận đơn thành công");
    })
    .catch(() => {
      toastMessage("success", "Thất bại", "Nhận đơn thất bại");
    });
};
function handleClickProceed() {
  visible.value = true;
}
onMounted(() => {
  listReceiveReport();
});
</script>
