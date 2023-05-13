<template lang="">
  <div>
    <form @submit.prevent="onSubmit" class="flex flex-column">
      <label for="">Số tiền</label>
      <InputNumber
        v-model="billMoney.amount_pay"
        mode="currency"
        currency="VND"
        inputId="currency-germany"
        locale="en-US"
        :minFractionDigits="3"
      />
      <label for="value">Nội dung</label>
      <Textarea
        id="value"
        v-model="billMoney.description"
        class="w-full h-40"
      />
      <div class="text-center mt-3">
        <Button
          type="submit"
          label="Submit"
          @click="handleClickOffer"
          severity="success"
        />
      </div>
    </form>
  </div>
</template>
<script setup>
import Button from "primevue/button";
import Textarea from "primevue/textarea";
import InputNumber from "primevue/inputnumber";
import { reactive, defineProps, defineEmits } from "vue";
import { updateReportById } from "@/helper/realtime.js";
import { useEngineerStore } from "@/store/engineer.js";
import { toastMessage } from "@/helper/toastMessage.js";
import { statusReport } from "@/helper/enumStatus";

const engineerStore = useEngineerStore();
const props = defineProps(["idBill"]);
const emit = defineEmits(["setVisible"]);
const billMoney = reactive({ amount_pay: "", description: "" });

function handleClickOffer() {
  engineerStore
    .offer({
      ...billMoney,
      id: props.idBill.id,
      status: statusReport.enforcementEngineer,
    })
    .then(() => {
      toastMessage("success", "Thành công", "Tiến hành thành công");
    })
    .catch(() => {
      toastMessage("error", "Thất bại", "Tiến hành thất bại");
    })
    .finally(() => {
      emit("setVisible", false);
    });

  updateReportById(props.idBill.key, {
    ...props.idBill.reportRealtime,
    status: statusReport.enforcementEngineer,
  });
}
</script>
<style lang="scss"></style>
