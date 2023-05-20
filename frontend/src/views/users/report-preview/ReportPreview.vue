<template>
  <div class="my-10">
    <div class="wrap">
      <div class="preview flex galleria">
        <Galleria
          ref="galleria"
          v-model:activeIndex="activeIndex"
          :value="images"
          :numVisible="5"
          :containerClass="galleriaClass"
          :showThumbnails="showThumbnails"
          :showItemNavigators="true"
          containerStyle="width: 60%"
          :showItemNavigatorsOnHover="true"
          :circular="true"
          :autoPlay="true"
          :transitionInterval="3000"
        >
          <template #item="slotProps">
            <img
              :src="slotProps.item.itemImageSrc"
              :alt="slotProps.item.alt"
              :style="[
                {
                  height: !fullScreen ? '50vh' : '',
                  objectFit: 'cover',
                  width: !fullScreen ? '100%' : '',
                  display: !fullScreen ? 'block' : '',
                },
              ]"
            />
          </template>
          <template #thumbnail="slotProps">
            <div class="grid grid-nogutter h-full justify-content-center">
              <img
                :src="slotProps.item.thumbnailImageSrc"
                :alt="slotProps.item.alt"
                style="display: block; height: 100%"
              />
            </div>
          </template>
          <template #footer>
            <div class="custom-galleria-footer">
              <Button icon="pi pi-list" @click="onThumbnailButtonClick" />
              <span v-if="images" class="title-container">
                <span>{{ activeIndex + 1 }}/{{ images.length }}</span>
                <span class="title">{{ images[activeIndex].title }}</span>
                <span>{{ images[activeIndex].alt }}</span>
              </span>
              <Button
                :icon="fullScreenIcon"
                @click="toggleFullScreen"
                class="fullscreen-button"
              />
            </div>
          </template>
        </Galleria>
        <div class="w-[40%]">
          <map-comp
            :coor="{ lat: preview.latitude, lng: preview.longitude }"
          ></map-comp>
        </div>
      </div>
      <div class="flex flex-col mt-4">
        <div>
          <h3 class="text-[20px] text-[#333] font-semibold mb-2">Thiết bị</h3>
          <ul class="ml-[2.7rem]">
            <li class="list-disc">
              <span>Thiết bị:</span><span>{{ preview.name }}</span>
            </li>
          </ul>
        </div>
        <div class="mt-4">
          <h3 class="text-[20px] text-[#333] font-semibold mb-2">Địa chỉ</h3>
          <ul class="ml-[2.7rem]">
            <li class="list-disc">
              <span></span><span>{{ preview.address }}</span>
            </li>
          </ul>
        </div>
        <div class="flex justify-between flex-col">
          <div class="mt-4">
            <h3 class="text-[20px] text-[#333] font-semibold mb-2">Mô tả</h3>
            <ul class="ml-[2.7rem]">
              <li class="list-disc">
                <span></span><span>{{ preview.description }}</span>
              </li>
            </ul>
          </div>

          <Timeline :value="timeline" layout="horizontal" align="top">
            <template #marker="slotProps">
              <span
                class="flex w-2rem h-2rem align-items-center justify-content-center text-white border-circle z-1 shadow-1 p-[8px] rounded-[50%]"
                :style="{ backgroundColor: slotProps.item.color }"
              >
                <i :class="slotProps.item.icon" class="text-[25px]"></i>
              </span>
            </template>
            <template #content="slotProps">
              <div>
                <p>{{ slotProps.item.status }}</p>
                <p class="h-3">{{ slotProps.item.date }}</p>
              </div>
            </template>
            <template #connector="slotProps">
              <div
                class="h-[2px] w-full"
                :style="{ backgroundColor: slotProps.item.color }"
              ></div>
            </template>
          </Timeline>
        </div>
        <div class="p-2" v-if="!checkAdmin">
          <h3 class="text-[20px] text-[#333] font-semibold mb-2"></h3>
          <div class="flex flex-wrap gap-3 justify-end mx-[-5px]">
            <Button
              :loading="loading"
              v-if="route.path === '/preview'"
              class="bg-[#6366F1]"
              @click="handleConfirm"
              label="Đăng"
            ></Button>
            <!-- <Button
              v-if="route.path.includes('notify/preview/4')"
              label="Xác nhận"
              class="bg-[#6366F1]"
              @click="handleConfirm"
            ></Button>
            <Button
              v-if="route.path.includes('notify/preview')"
              @click="visible = !visible"
              label="Đánh giá"
              severity="warning"
              class="bg-[#6366F1]"
            ></Button>
            <Button
              v-if="!route.path.includes('notify/preview')"
              label="Hủy"
              class="bg-[#6366F1]"
            ></Button> -->
          </div>
        </div>
      </div>
    </div>
  </div>
  <Dialog v-model:visible="visible" modal header="Đánh giá">
    <TheRating />
  </Dialog>
  <Dialog
    v-model:visible="bill"
    modal
    header="Tiến hành"
    :style="{ width: '50vw' }"
  >
    <BillMoney />
  </Dialog>
</template>

<script setup>
import Button from "primevue/button";
import { ref, watchEffect, watch, computed, onMounted } from "vue";
import Dialog from "primevue/dialog";
import Timeline from "primevue/timeline";
import { useReportStore } from "@/store/report.js";
import TheRating from "../components/TheRating.vue";
import Galleria from "primevue/galleria";
import { getDistance } from "@/helper/map.js";
import { statusReport } from "@/helper/enumStatus";
import { useEngineerStore } from "@/store/engineer.js";
import MapComp from "@/views/engineer/components/MapComp.vue";
import { toastMessage } from "@/helper/toastMessage.js";
import BillMoney from "@/views/engineer/components/BillMoney.vue";
import { sendReport } from "@/helper/realtime.js";
import { useRegisterStore } from "@/store/register";
import axios from "axios";
import { useRoute, useRouter } from "vue-router";
const router = useRouter();
const route = useRoute();
const engineer = useEngineerStore();
const loading = ref(false);
const reportStore = useReportStore();
const preview = ref(engineer.repair);
const visible = ref(false);
const bill = ref(false);
const timeline = ref([
  {
    status: "Gửi yêu cầu",
    icon: "bx bxs-compass bx-spin",
    color: "#333",
  },
  {
    status: "Xác nhận",
    icon: "bx bx-cog bx-spin",
    color: "#333",
  },
  {
    status: "Tiến hành",
    icon: "bx bx-bolt-circle bx-spin",
    color: "#333",
  },
  {
    status: "Chấp thuận",
    icon: "bx bx-radar bx-spin bx-flip-vertical",
    color: "#333",
  },
  {
    status: "Hoàn thành",
    icon: "bx bxl-steam bx-spin",
    color: "#333",
  },
  {
    status: "Chấp thuận",
    icon: "bx bxs-sun bx-spin",
    color: "#333",
  },
]);
const checkAdmin = computed(() => route.fullPath.includes("admin"));
watchEffect(async () => {
  await reportStore
    .getReportDetail(route.fullPath, route.params.id)
    .then((res) => {
      preview.value = {
        ...res.data,
        description: res.data.description.body,
        img: [...res.data.images],
      };
    });
});
watch(preview, () => {
  console.log(preview.value.status);
  for (let key in timeline.value) {
    if (Number(key) === preview.value.status) {
      timeline.value[key] = {
        ...timeline.value[key],
        date: new Date(preview.value.created_at).toLocaleDateString("en-GB", {
          day: "numeric",
          month: "numeric",
          year: "numeric",
        }),
        color: "#6366F1",
      };
    }
    if (Number(key) < preview.value.status) {
      timeline.value[key] = {
        ...timeline.value[key],
        color: "#6366F1",
      };
    }
    if (Number(key) > preview.value.status) {
      timeline.value[key] = {
        ...timeline.value[key],
        color: "#333",
      };
    }
  }
});
reportStore.report.images = [];
function base64ToFile() {
  const data = engineer.repair.img?.map((data, index) => {
    const file = dataURLtoFile(data, index);
    // await axios.get(data, { responseType: "blob" }).then((blob) => {
    //   const file = new File([blob], "File name", { type: "image/png" });
    // const f = URL.createObjectURL(file);
    // console.log(f);
    reportStore.report.images.push(file);
    // });
  });
  return data;
}
function dataURLtoFile(dataurl, filename) {
  var arr = dataurl.split(","),
    mime = arr[0].match(/:(.*?);/)[1],
    bstr = atob(arr[1]),
    n = bstr.length,
    u8arr = new Uint8Array(n);

  while (n--) {
    u8arr[n] = bstr.charCodeAt(n);
  }

  return new File([u8arr], filename, { type: mime });
}
base64ToFile();
async function handleConfirm() {
  loading.value = true;
  const datas = {
    ...reportStore.report,
    ...engineer.repair,
    images: reportStore.report.images,
  };
  const formData = new FormData();
  Object.keys(datas).forEach((val) => {
    console.log(datas["images"]);
    if (val === "images") {
      datas["images"].forEach((e) => {
        console.log(e);
        formData.append(`images[]`, e);
      });
    } else if (val !== "img") {
      formData.append(val, datas[val]);
    }
  });
  try {
    const localToken = localStorage.getItem("token") || "";
    const report = await axios.post(
      "http://localhost:3000/api/v1/reports",
      formData,
      {
        headers: {
          Authorization: `Bearer ${localToken}`,
        },
      }
    );
    let engineerRes = await engineer.getAllEngineer();
    engineerRes.data = engineerRes.data.filter((item) => {
      return (
        item.id !== useRegisterStore().account.id &&
        Number(item.repair_equipment_id) ===
          Number(report.data.repair_equipment_id)
      );
    });
    const engineerList = await engineerRes.data.map(async (item) => {
      const distance = await getDistance(
        {
          lat: item.latitude,
          lng: item.longitude,
        },
        {
          lat: report.data.latitude,
          lng: report.data.longitude,
        }
      );
      console.log(distance);
      return {
        duration: distance.rows[0].elements[0].distance?.value || 0,
        duration_text: distance.rows[0].elements[0].duration?.text || 0,
        distance_text: distance.rows[0].elements[0].duration?.text || 0,
        engineer_id: item.id,
      };
    });

    Promise.all(engineerList).then((data) => {
      console.log(data);
      data.sort((a, b) => {
        return a.duration - b.duration;
      });
      const engineerList = data.filter((item, index) => index < 2);
      const realtimeRp = {
        duration: engineerList.map((item) => item.duration_text).join(", "),
        distance: engineerList.map((item) => item.distance_text).join(", "),
        report_id: report.data.id,
        engineer_id: engineerList.map((item) => item.engineer_id).join(", "),
        status: statusReport.pending,
      };
      sendReport(realtimeRp);
    });
    router.push("/notify");
    toastMessage("success", "thanh cong", "report");
    loading.value = false;
    engineer.setRepair({});
  } catch (err) {
    toastMessage("error", "Thất bại", "report");
    loading.value = false;
  }
}

onMounted(() => {
  bindDocumentListeners();
});

const galleria = ref();
const images = computed(() => {
  return preview.value.img?.map((val, index) => {
    return {
      itemImageSrc: val,
      thumbnailImageSrc: val,
      alt: `Ảnh ${index}`,
      title: `Ảnh ${index}`,
    };
  });
});

const activeIndex = ref(0);
const showThumbnails = ref(true);
const fullScreen = ref(false);

const onThumbnailButtonClick = () => {
  showThumbnails.value = !showThumbnails.value;
};

const toggleFullScreen = () => {
  if (fullScreen.value) {
    closeFullScreen();
  } else {
    openFullScreen();
  }
};
const onFullScreenChange = () => {
  fullScreen.value = !fullScreen.value;
};
const openFullScreen = () => {
  let elem = galleria.value.$el;

  if (elem.requestFullscreen) {
    elem.requestFullscreen();
  } else if (elem.mozRequestFullScreen) {
    /* Firefox */
    elem.mozRequestFullScreen();
  } else if (elem.webkitRequestFullscreen) {
    /* Chrome, Safari & Opera */
    elem.webkitRequestFullscreen();
  } else if (elem.msRequestFullscreen) {
    /* IE/Edge */
    elem.msRequestFullscreen();
  }
};
const closeFullScreen = () => {
  if (document.exitFullscreen) {
    document.exitFullscreen();
  } else if (document.mozCancelFullScreen) {
    document.mozCancelFullScreen();
  } else if (document.webkitExitFullscreen) {
    document.webkitExitFullscreen();
  } else if (document.msExitFullscreen) {
    document.msExitFullscreen();
  }
};
const bindDocumentListeners = () => {
  document.addEventListener("fullscreenchange", onFullScreenChange);
  document.addEventListener("mozfullscreenchange", onFullScreenChange);
  document.addEventListener("webkitfullscreenchange", onFullScreenChange);
  document.addEventListener("msfullscreenchange", onFullScreenChange);
};
// const unbindDocumentListeners = () => {
//   document.removeEventListener("fullscreenchange", onFullScreenChange);
//   document.removeEventListener("mozfullscreenchange", onFullScreenChange);
//   document.removeEventListener("webkitfullscreenchange", onFullScreenChange);
//   document.removeEventListener("msfullscreenchange", onFullScreenChange);
// };

const galleriaClass = computed(() => {
  return ["custom-galleria", { fullscreen: fullScreen.value }];
});
const fullScreenIcon = computed(() => {
  return `pi ${fullScreen.value ? "pi-window-minimize" : "pi-window-maximize"}`;
});
</script>

<style lang="scss" scoped>
:deep(.custom-galleria .p-galleria-thumbnail-wrapper) {
  top: 0;
}
:deep(.p-galleria-thumbnail-container) {
  height: 100%;
}
:deep(.p-timeline-event-opposite) {
  padding: 0;
}
:deep(.p-timeline-event-content) {
  white-space: nowrap;
}
:deep(.p-timeline-event-connector) {
  background-color: red;
}
.p-dialog .p-dialog-content {
  padding: 0;
}
:deep(.p-dialog .p-dialog-header) {
  display: 2px;
}

:deep(.p-button) {
  height: 40px !important;
  width: 220px !important;
}
.preview {
  margin-right: -10px;
  margin-left: -10px;
  > div {
    padding: 0px 10px;
  }
}
:deep(.custom-galleria) {
  &.fullscreen {
    display: flex;
    flex-direction: column;

    .p-galleria-content {
      flex-grow: 1;
      justify-content: center;
    }
  }

  .p-galleria-content {
    position: relative;
  }

  .p-galleria-thumbnail-wrapper {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
  }

  .p-galleria-thumbnail-items-container {
    width: 100%;
  }

  .custom-galleria-footer {
    display: flex;
    align-items: center;
    background-color: rgba(0, 0, 0, 0.9);
    color: #ffffff;

    > button {
      background-color: transparent;
      color: #ffffff;
      border: 0 none;
      border-radius: 0;
      margin: 0.2rem 0;

      &.fullscreen-button {
        margin-left: auto;
      }

      &:hover {
        background-color: rgba(255, 255, 255, 0.1);
      }
    }
  }

  .title-container {
    > span {
      font-size: 0.9rem;
      padding-left: 0.829rem;

      &.title {
        font-weight: bold;
      }
    }
  }
}
:deep(.p-galleria-thumbnail-item) {
  padding: 0px 10px;
  .p-galleria-thumbnail-item-content {
    height: 100%;
    > div {
      &:first-child {
        overflow-y: hidden;
      }
    }
  }
}
:deep(.p-galleria-thumbnail-items) {
  margin-right: -10px;
  margin-left: -10px;
  height: 100%;
  overflow-y: hidden;
}
</style>
