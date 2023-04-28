<template lang="">
  <div>
    <form @submit="onSubmit" class="flex flex-column">
      <label for="">Số tiền</label>
      <InputText type="text" v-model="billMoney.amount_pay" />
      <label for="value">Nội dung</label>
      <Textarea
        id="value"
        v-model="billMoney.description"
        class="w-full h-40"
      />
      <div class="text-center">
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
import InputText from "primevue/inputtext";
import { reactive, defineProps } from "vue";
import { useEngineerStore } from "@/store/engineer.js";
import { toastMessage } from "@/helper/toastMessage.js";

const engineerStore = useEngineerStore();
const props = defineProps(["id"]);
const billMoney = reactive({ amount_pay: "", description: "" });
function handleClickOffer() {
  engineerStore
    .offer({
      ...billMoney,
      id: props.id,
      status: 2,
    })
    .then(() => {
      toastMessage("success", "Thành công", "Tiến hành thành công");
    })
    .catch(() => {
      toastMessage("success", "Thất bại", "Tiến hành thất bại");
    });
}
</script>
<style lang="scss"></style>
