<template lang="">
  <div class="problem">
    <div class="search" v-if="!checkSearch">
      <Listbox
        v-model="selectedCity"
        :options="cities"
        filter
        optionLabel="name"
        listStyle="max-height:250px"
      />
      <Button
        type="button"
        label="Kiểm tra"
        icon="pi pi-search"
        :loading="loading"
        @click="handleClickSearch"
      />
    </div>
    <div class="content" v-else>
      <h2>
        <button @click="handlePrev">Trở lại</button>Chi Phí Sửa Chữa Tạm Tính
        (VNĐ)*
      </h2>
      <div class="device_problem">
        <div class="detail">
          <div>
            <h6>Giá linh kiện</h6>
            <p>2.963.319 đ</p>
          </div>
          <ul>
            <li><span>Màn hình (UB)</span><span>2.868.337 đ</span></li>
            <li><span>Màn hình (UB)</span><span>2.868.337 đ</span></li>
          </ul>
        </div>
        <div class="detail mt-5">
          <div>
            <h6>Tiền công và chi phí khác</h6>
            <p>220.000 đ</p>
          </div>
          <ul>
            <li><span>Tiền công</span><span>220.000 đ</span></li>
            <li><span>Chi phí khác</span><span>0 đ</span></li>
          </ul>
        </div>
        <div class="total mt-5">
          <div>
            <h6>Tổng chi phí sửa chữa</h6>
            <p>2.963.319 đ</p>
          </div>
          <ul>
            <li><span>Màn hình (UB)</span><span>2.868.337 đ</span></li>
            <li><span>Màn hình (UB)</span><span>2.868.337 đ</span></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref } from "vue";
import Listbox from "primevue/listbox";
import Button from "primevue/button";
const checkSearch = ref(false);
const selectedCity = ref();
const cities = ref([
  { name: "New York", code: "NY" },
  { name: "Rome", code: "RM" },
  { name: "London", code: "LDN" },
  { name: "Istanbul", code: "IST" },
  { name: "Paris", code: "PRS" },
  { name: "New York", code: "NY" },
  { name: "Rome", code: "RM" },
  { name: "London", code: "LDN" },
  { name: "Istanbul", code: "IST" },
  { name: "Paris", code: "PRS" },
  { name: "New York", code: "NY" },
  { name: "Rome", code: "RM" },
  { name: "London", code: "LDN" },
  { name: "Istanbul", code: "IST" },
  { name: "Paris", code: "PRS" },
]);
function handleClickSearch() {
  checkSearch.value = true;
}
function handlePrev() {
  checkSearch.value = false;
}
</script>
<style lang="scss" scoped>
.search {
  margin-right: -10px;
  margin-left: -10px;
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-end;
}
.p-listbox {
  flex: 100%;
  margin-right: 10px;
  margin-left: 10px;
}
.p-button {
  width: 200px;
  margin-right: 10px;
  margin-left: 10px;
  height: 50px;
  margin-top: 20px;
}
.device_problem {
  width: 100%;
  margin: 0 auto;
}

.problem {
  display: flex;
  flex-direction: column;
  margin-top: 30px;
  .content {
    margin-top: 30px;
    flex: 1;
    box-shadow: 0px 0px 5px #d1d7d8;
    border-radius: 10px;
    padding: 40px;
    h2 {
      text-align: center;
      font-size: 30px;
      color: #000;
      font-weight: 700;
      margin-bottom: 20px;
      position: relative;
      button {
        position: absolute;
        left: 0;
        font-size: 14px;
        top: 50%;
        transform: translateY(-50%);
        height: 100%;
        color: var(--sub-color);
        &:hover {
          color: var(--red);
        }
      }
    }
    .detail,
    .total {
      padding: 20px;
      background-color: #fff;
      box-shadow: 0px 0px 3px #d6c5c5;
      border-radius: 8px;
      div,
      li {
        display: flex;
        padding: 5px 0;
        justify-content: space-between;
        align-items: center;
        h6 {
          font-size: 16px;
          width: 60%;
          color: #000;
          font-weight: 600;
        }
        p {
          font-weight: 600;
          font-size: 16px;
          color: #000;
        }
      }
      div {
        position: relative;
        margin-bottom: 20px;
        &::after {
          content: "";
          position: absolute;
          width: 100%;
          height: 1px;
          background: #c3c3c3;
          bottom: -10px;
        }
      }
    }
    .total {
      padding: 0;
      overflow: hidden;
      div {
        padding: 20px;
        background-color: var(--sub-color);
        position: static;
        margin-bottom: 10px;
        align-items: center;
        &::after {
          display: none;
        }
        h6 {
          color: #fff;
        }
        p {
          color: #fff;
        }
      }
      ul {
        padding: 0px 20px;
        padding-bottom: 10px;
      }
    }
  }
}
</style>
