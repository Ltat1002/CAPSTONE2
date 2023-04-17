<template lang="">
  <div class="pt-5 report">
    <div class="wrap">
      <div class="device">
        <div>
          <Steps :model="items" :readonly="false" aria-label="Form Steps" />
        </div>
        <router-view></router-view>
      </div>
      <div class="action">
        <div>
          <Button
            v-if="!(route.path === items[0].to)"
            @click="handleBackByStep()"
            label="Quay lại"
            size="small"
          />
        </div>
        <div>
          <Button
            v-if="!(route.path === items[items.length - 1].to)"
            @click="handleNextByStep()"
            label="Tiếp theo"
            size="small"
          />
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref } from "vue";
import { useRouter, useRoute } from "vue-router";
import Steps from "primevue/steps";
import Button from "primevue/button";
const items = ref([
  {
    label: "Thiết bị",
    to: "/report-problem",
  },
  {
    label: "Mô tả",
    to: "/report-problem/description/0",
  },
  {
    label: "Địa điểm",
    to: "/report-problem/location",
  },
]);
const router = useRouter();
const route = useRoute();

function handleNextByStep() {
  items.value.forEach((item, index) => {
    if (route.path === item.to && index < items.value.length - 1) {
      router.push(items.value[index + 1].to);
    }
  });
}

function handleBackByStep() {
  items.value.forEach((item, index) => {
    if (route.path === item.to && index > 0) {
      router.push(items.value[index - 1].to);
    }
  });
}
</script>
<style lang="scss" scoped>
.p-button {
  background: var(--sub-color);
}
.report {
  width: 100%;
  background-color: #fff;
  padding-top: 30px;
}

:deep(.p-steps .p-steps-item .p-menuitem-link .p-steps-number) {
  min-width: 1rem;
  height: 1rem;
}

:deep(.p-timeline-event-content) {
  font-weight: bold;
  white-space: nowrap;
}

:deep(.p-steps .p-steps-item.p-highlight .p-steps-number) {
  background: var(--sub-color);
  color: #fff;
}

:deep(.p-steps .p-steps-item.p-highlight .p-steps-number) {
  color: var(--sub-color);
}

:deep(.p-steps-title) {
  font-size: 12px;
}
:deep(.p-steps .p-steps-item .p-menuitem-link .p-steps-number) {
  color: #fff;
  border: 2px solid var(--sub-color);
  font-size: 1px;
  &:hover {
    background-color: var(--sub-color);
    color: var(--sub-color);
  }
}
:deep(.p-steps .p-steps-item:before) {
  border: 1px solid var(--sub-color);
  top: 57%;
}
.action {
  display: flex;
  justify-content: space-between;
  padding: 20px 0;
}
</style>
