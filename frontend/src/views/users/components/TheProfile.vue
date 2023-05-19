<template lang="">
  <div class="mt-10 mb-10">
    <div class="wrap flex">
      <div class="nav-bar">
        <div>
          <div
            class="w-[200px] h-[200px] rounded-full overflow-hidden mx-auto border border-solid border-white"
          >
            <the-avt :size="80" />
          </div>
          <div class="user-box">
            <h2>{{ profile?.first_name + " " + profile?.last_name }}</h2>
            <p>Ngày tham gia: 24/5/2021</p>
          </div>
        </div>
        <div class="info">
          <div class="info-sub">
            <div>
              <div>
                <h2>{{ profile?.mobile }}</h2>
              </div>
              <p>Số điện thoại</p>
            </div>
            <div>
              <div class="w-full overflow-hidden">
                <h2>{{ profile?.email }}</h2>
              </div>
              <p>Email</p>
            </div>

            <div>
              <div>
                <h2>{{ profile?.address }}</h2>
              </div>
              <p>Địa chỉ</p>
            </div>
          </div>
        </div>
      </div>
      <div class="content">
        <TabView>
          <TabPanel header="Profile">
            <div class="flex flex-col justify-center items-center">
              <div
                class="relative flex flex-col items-center rounded-[20px] w-[700px] max-w-[95%] mx-auto bg-white bg-clip-border shadow-3xl shadow-shadow-500 dark:!bg-navy-800 dark:!shadow-none p-3"
              >
                <div class="mt-2 w-full">
                  <h4 class="px-2 text-xl font-bold text-navy-700">
                    Thông tin chung
                  </h4>
                  <p class="mt-2 px-2 text-base text-gray-600">
                    Repair Services xin được trở thành người sửa chữa nhà của
                    bạn chuyên gia cho tất cả các hạng mục sửa chữa nhà của bạn
                    và kiểm tra. Chúng tôi sở hữu tại địa phương, được cấp phép,
                    liên kết và bảo hiểm. Hãy để chúng tôi giúp bạn chăm sóc
                    khoản đầu tư lớn nhất của mình trong nhiều năm tới đến!
                  </p>
                </div>
                <div class="grid grid-cols-2 px-2 w-full">
                  <div
                    class="flex flex-col items-start justify-center rounded-2xl bg-white bg-clip-border px-3 py-4 shadow-3xl shadow-shadow-500 dark:!bg-navy-700 dark:shadow-none"
                  >
                    <p class="text-sm text-gray-600">Họ và tên</p>
                    <p class="text-base font-medium text-navy-700">
                      {{ profile.last_name }} {{ profile.first_name }}
                    </p>
                  </div>

                  <div
                    class="flex flex-col justify-center rounded-2xl bg-white bg-clip-border px-3 py-4 shadow-3xl shadow-shadow-500 dark:!bg-navy-700 dark:shadow-none"
                  >
                    <p class="text-sm text-gray-600">Giới tính</p>
                    <p class="text-base font-medium text-navy-700">Nam</p>
                  </div>

                  <div
                    class="flex flex-col items-start justify-center rounded-2xl bg-white bg-clip-border px-3 py-4 shadow-3xl shadow-shadow-500 dark:!bg-navy-700 dark:shadow-none"
                  >
                    <p class="text-sm text-gray-600">Địa chỉ</p>
                    <p class="text-base font-medium text-navy-700">
                      {{ profile.address }}
                    </p>
                  </div>

                  <div
                    class="flex flex-col justify-center rounded-2xl bg-white bg-clip-border px-3 py-4 shadow-3xl shadow-shadow-500 dark:!bg-navy-700 dark:shadow-none"
                  >
                    <p class="text-sm text-gray-600">Số điện thoại</p>
                    <p class="text-base font-medium text-navy-700">
                      {{ profile.mobile }}
                    </p>
                  </div>

                  <div
                    class="flex flex-col items-start justify-center rounded-2xl bg-white bg-clip-border px-3 py-4 shadow-3xl shadow-shadow-500 dark:!bg-navy-700 dark:shadow-none"
                  >
                    <p class="text-sm text-gray-600">Ngày sinh</p>
                    <p class="text-base font-medium text-navy-700">
                      24/05/2001
                    </p>
                  </div>

                  <div
                    class="flex flex-col justify-center rounded-2xl bg-white bg-clip-border px-3 py-4 shadow-3xl shadow-shadow-500 dark:!bg-navy-700 dark:shadow-none"
                  >
                    <p class="text-sm text-gray-600">Email</p>
                    <p class="text-base font-medium text-navy-700">
                      {{ profile.email }}
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </TabPanel>
          <TabPanel header="Messages">
            <TheNotify />
            <div v-if="load" class="flex justify-center h-full items-center">
              <ProgressBar
                mode="indeterminate"
                style="height: 6px"
              ></ProgressBar>
            </div>
          </TabPanel>
          <TabPanel header="Edit profile">
            <form @submit.prevent="handleUpdateProfile">
              <div class="relative z-0 w-full mb-6 group">
                <input
                  type="email"
                  name="floating_email"
                  id="floating_email"
                  class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                  placeholder=" "
                  v-model="editProfile.email"
                  disabled
                />
                <label
                  for="floating_email"
                  class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                  >Email</label
                >
              </div>
              <div class="grid md:grid-cols-2 md:gap-6">
                <div class="relative z-0 w-full mb-6 group">
                  <input
                    type="text"
                    name="floating_first_name"
                    id="floating_first_name"
                    class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                    placeholder=" "
                    v-model="editProfile.first_name"
                  />
                  <label
                    for="floating_first_name"
                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                    >Họ</label
                  >
                </div>
                <div class="relative z-0 w-full mb-6 group">
                  <input
                    type="text"
                    name="floating_last_name"
                    id="floating_last_name"
                    class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                    placeholder=" "
                    v-model="editProfile.last_name"
                  />
                  <label
                    for="floating_last_name"
                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                    >Tên</label
                  >
                </div>
              </div>
              <div class="grid md:grid-cols-2 md:gap-6">
                <div class="relative z-0 w-full mb-6 group">
                  <input
                    type="tel"
                    name="floating_phone"
                    id="floating_phone"
                    class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                    placeholder=" "
                    v-model="editProfile.mobile"
                  />
                  <label
                    for="floating_phone"
                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                    >Số điện thoại</label
                  >
                </div>
              </div>
              <div class="grid md:grid-cols-2 md:gap-6">
                <div class="relative z-0 w-full mb-6 group">
                  <input
                    type="tel"
                    name="floating_phone"
                    id="floating_phone"
                    class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                    placeholder=" "
                    v-model="editProfile.address"
                  />
                  <label
                    for="floating_phone"
                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                    >Địa chỉ</label
                  >
                </div>
              </div>
              <div
                class="text-blue-500 decoration-1 underline cursor-pointer mb-4 text-[0.875rem]"
                @click="handleUpdatePassword"
              >
                Cập nhật mật khẩu
              </div>
              <div v-if="checkPassword">
                <div class="relative z-0 w-full mb-6 group">
                  <input
                    type="password"
                    name="floating_password"
                    id="floating_password"
                    class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                    placeholder=" "
                    v-model="password.current_password"
                  />
                  <label
                    for="floating_password"
                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                    >Mật khẩu hiện tại</label
                  >
                </div>
                <div class="relative z-0 w-full mb-6 group">
                  <input
                    type="password"
                    name="repeat_password"
                    id="floating_repeat_password"
                    class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                    placeholder=" "
                    v-model="password.password"
                  />
                  <label
                    for="floating_repeat_password"
                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                    >Mật khẩu mới</label
                  >
                </div>
                <div class="relative z-0 w-full mb-6 group">
                  <input
                    type="password"
                    name="repeat_password"
                    id="floating_repeat_password"
                    class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                    placeholder=" "
                    v-model="password.password_confirmation"
                  />
                  <label
                    for="floating_repeat_password"
                    class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6"
                    >Xác nhận mật khẩu mới</label
                  >
                </div>
              </div>

              <button
                type="submit"
                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
              >
                Submit
              </button>
            </form>
          </TabPanel>
          <TabPanel v-if="profile.role === 'engineer'" header="CV">
            <div v-if="!load"><upload-information /></div>
            <div v-if="load" class="flex justify-center h-full items-center">
              <ProgressBar
                mode="indeterminate"
                style="height: 6px"
              ></ProgressBar>
            </div>
          </TabPanel>
        </TabView>
      </div>
    </div>
  </div>
</template>
<script setup>
import TheAvt from "@/components/TheAvt.vue";
import TheNotify from "@/components/TheNotify.vue";
import TabView from "primevue/tabview";
import UploadInformation from "@/views/engineer/UploadInformation.vue";
import TabPanel from "primevue/tabpanel";
import { asyncComputed } from "@vueuse/core";
import { useRegisterStore } from "@/store/register.js";
import { ref, watch, reactive, onMounted } from "vue";
import { toastMessage } from "@/helper/toastMessage.js";
import ProgressBar from "primevue/progressbar";
const load = ref(false);
const registerStore = useRegisterStore();
const password = reactive({
  current_password: "",
  password: "",
  password_confirmation: "",
});
const handleUpdateProfile = async () => {
  if (checkPassword.value && password.current_password) {
    await registerStore
      .updateProfile({
        ...editProfile.value,
        ...password,
      })
      .then(() => {
        toastMessage("success", "Thành công", "Cập nhật Hồ sơ");
      })
      .catch(() => {
        toastMessage("error", "Thất bại", "Cập nhật Hồ sơ");
      });
  } else {
    await registerStore
      .updateProfile({
        ...editProfile.value,
      })
      .then(() => {
        toastMessage("success", "Thành công", "Cập nhật Hồ sơ");
      })
      .catch(() => {
        toastMessage("error", "Thất bại", "Cập nhật Hồ sơ");
      });
    await registerStore.profile();
  }
};

onMounted(() => {
  setTimeout(() => {
    load.value = false;
  }, 4000);
});
const profile = asyncComputed(
  async () => {
    return await registerStore.account;
  },
  {
    email: "",
    first_name: "",
    last_name: "",
    mobile: "",
    address: "",
  }
);
const editProfile = ref({
  email: "",
  first_name: "",
  last_name: "",
  mobile: "",
  address: "",
});
const checkPassword = ref(false);
watch(profile, () => {
  editProfile.value = { ...profile.value };
});
function handleUpdatePassword() {
  checkPassword.value = !checkPassword.value;
}
</script>
<style lang="scss" scoped>
:deep(.p-progressbar) {
  width: 50%;
}
:deep(.p-tabview) {
  height: 100%;
  display: flex;
  flex-direction: column;
  .p-tabview-panels {
    flex: 1;
    .p-tabview-panel {
      height: 100%;
    }
  }
}
.bg-main-color {
  background-color: var(--main-color);
}

.text-main-color {
  color: var(--main-color);
}

.border-main-color {
  border-color: var(--main-color);
}
.nav-bar {
  margin-right: 15px;
  width: 300px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  overflow: hidden;
  box-shadow: 0px 0px 8px #736666;
  > div {
    background-color: var(--sub-color);
    margin: auto;
    width: 100%;
    padding: 20px;
    color: #fff;
    img {
      margin: auto;
      width: 200px;
      height: 200px;
      object-fit: cover;
      border-radius: 50%;
    }
    .user-box {
      color: #fff;
      text-align: center;
      margin-top: 20px;
      h2 {
        font-weight: 500;
        line-height: 1.2;
        font-size: 1.2rem;
      }
    }
  }
  .info {
    display: flex;
    height: 100%;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
    overflow: hidden;
    color: #000;
    .info-sub {
      width: 100%;
      overflow-x: hidden;
      border-radius: 5px;
      border: 1px solid #ccc;
      > div {
        border-bottom: 1px solid #ccc;
        width: 100%;
        display: flex;
        align-items: flex-start;
        padding: 15px 20px;
        flex-direction: column;
        &:last-child {
          border: none;
        }
        > div {
          display: flex;
          align-items: center;
          height: fit-content;
          h2 {
            flex: 1;
          }
        }
        p {
          font-weight: 300;
          line-height: 0.9;
          font-size: 0.8rem;
        }
      }
    }
  }
}
.content {
  padding: 20px;
  background-color: #fff;
  box-shadow: 0px 0px 8px #736666;
  flex: 1;
  margin-left: 15px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  overflow: hidden;
}
:deep(.p-tabview .p-tabview-nav li .p-tabview-nav-link) {
  padding: 20px 40px;
}
:deep(.p-tabview-nav .p-highlight .p-tabview-nav-link) {
  color: #fff !important;
  background-color: var(--sub-color) !important;
}
:deep(.p-button) {
  height: 40px;
}
.icon::after {
  content: "";
  display: block;
  position: absolute;
  border-top: 23px solid transparent;
  border-bottom: 17px solid transparent;
  border-left: 12px solid var(--sub-color);
  left: 100%;
  top: 0;
}
.submit-form {
  background-color: var(--sub-color);
  cursor: pointer;
  &:hover {
    background-color: rgba($color: #2be773, $alpha: 0.9);
  }
}
</style>
