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
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d251637.95196238213!2d105.6189045!3d9.779349!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1681275081254!5m2!1svi!2s"
            width="100%"
            height="100%"
            style="border: 0"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
          ></iframe>
        </div>
      </div>
      <div class="flex flex-col">
        <div class="p-2 mt-4">
          <h3 class="text-[20px] text-[#333] font-semibold mb-2">Mô tả</h3>
          <p class="ml-4">
            HOME REPAIR SERVICE là một doanh nghiệp do một gia đình sở hữu và
            điều hành trong gần 70 năm. Chúng tôi cam kết chất lượng tay nghề
            thủ công và sự hài lòng của khách hàng Chúng tôi rất mong được phục
            vụ bạn.
          </p>
        </div>
        <div class="p-2 flex justify-between mt-4">
          <div class="w-[30%]">
            <h3 class="text-[20px] text-[#333] font-semibold mb-2">Thiết bị</h3>
            <ul class="ml-[2.7rem]">
              <li class="list-disc">
                <span>Thiết bị:</span><span>Thiết bị điện tử</span>
              </li>
              <li class="list-disc">
                <span>Tên thiết bị:</span><span>Điện thoại</span>
              </li>
            </ul>
          </div>
          <Timeline :value="events" layout="horizontal" align="top">
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
        <div class="p-2">
          <h3 class="text-[20px] text-[#333] font-semibold mb-2"></h3>
          <div class="flex flex-wrap justify-end mx-[-5px]">
            <span
              class="bg-[#6366F1] rounded-[26px] px-2 py-1 text-[#fff] text-[14px] cursor-pointer mx-[5px] flex items-center"
              @click="handleConfirm"
              ><i class="bx bx-check-circle mr-1"></i>Xác nhận</span
            >
            <span
              @click="visible = !visible"
              class="bg-[#6366F1] rounded-[26px] px-2 py-1 text-[#fff] text-[14px] cursor-pointer mx-[5px] flex items-center"
              ><i class="bx bxs-message-rounded-dots mr-1"></i>Đánh giá</span
            >
            <span
              class="bg-[#6366F1] rounded-[26px] px-2 py-1 text-[#fff] text-[14px] cursor-pointer mx-[5px] flex items-center"
              ><i class="bx bx-message-alt-x mr-1"></i>Hủy</span
            >
          </div>
        </div>
      </div>
    </div>
  </div>
  <Dialog v-model:visible="visible" modal header="Đánh giá">
    <TheRating />
  </Dialog>
</template>

<script setup>
import { ref, computed, onMounted } from "vue";
import Dialog from "primevue/dialog";
import Timeline from "primevue/timeline";
import { useReportStore } from "@/store/report.js";
import TheRating from "../components/TheRating.vue";
import Galleria from "primevue/galleria";
import Button from "primevue/button";
const reportStore = useReportStore();
const visible = ref(false);
const events = ref([
  {
    status: "Gửi yêu cầu",
    date: "15/10/2020 16:15",
    icon: "bx bxs-compass bx-spin",
    color: "#6366F1",
  },
  {
    status: "Xác nhận",
    date: "15/10/2020 10:30",
    icon: "bx bx-cog bx-spin",
    color: "#6366F1",
    image: "game-controller.jpg",
  },
  {
    status: "Tiến hành",
    date: "15/10/2020 14:00",
    icon: "bx bx-bolt-circle bx-spin",
    color: "#6366F1",
  },
  {
    status: "Hoàn thành",
    icon: "bx bxs-sun bx-spin",
    color: "#333",
  },
]);
function handleConfirm() {
  console.log(reportStore.report);
}
onMounted(() => {
  bindDocumentListeners();
});

const galleria = ref();
const images = ref([
  {
    itemImageSrc:
      "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
    thumbnailImageSrc:
      "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
    alt: "Description for Image 1",
    title: "Title 1",
  },
  {
    itemImageSrc:
      "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
    thumbnailImageSrc:
      "https://media.istockphoto.com/id/504566177/photo/video-camera-lens.jpg?s=612x612&w=0&k=20&c=gx3jDUBxoD3pDtA6PymcIuhQADeoY2C8sJTikKMKPf0=",
    alt: "Description for Image 1",
    title: "Title 1",
  },
  {
    itemImageSrc:
      "https://static.fotor.com/app/features/img/aiimage/scenes/a%20realistic%20fox%20in%20the%20lake%20generated%20by%20ai%20image%20creator.png",
    thumbnailImageSrc:
      "https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg",
    alt: "Description for Image 1",
    title: "Title 1",
  },
  {
    itemImageSrc:
      "https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg",
    thumbnailImageSrc:
      "https://media.istockphoto.com/id/504566177/photo/video-camera-lens.jpg?s=612x612&w=0&k=20&c=gx3jDUBxoD3pDtA6PymcIuhQADeoY2C8sJTikKMKPf0=",
    alt: "Description for Image 1",
    title: "Title 1",
  },
  {
    itemImageSrc:
      "https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg",
    thumbnailImageSrc:
      "https://media.istockphoto.com/id/504566177/photo/video-camera-lens.jpg?s=612x612&w=0&k=20&c=gx3jDUBxoD3pDtA6PymcIuhQADeoY2C8sJTikKMKPf0=",
    alt: "Description for Image 1",
    title: "Title 1",
  },
]);

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
  }
}
:deep(.p-galleria-thumbnail-items) {
  margin-right: -10px;
  margin-left: -10px;
}
</style>
