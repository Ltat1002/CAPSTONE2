<template>
  <div class="wrap_main">
    <div class="main">
      <div
        :class="handleSubmitLogin ? 'is-txl' : ''"
        class="container a-container"
        id="a-container"
      >
        <form
          class="form form_sign_up"
          id="a-form"
          @submit.prevent="handleRegister"
          method=""
          action=""
        >
          <h2 class="form_title title">Tạo tài khoản</h2>
          <input
            v-model="register.last_name"
            class="form__input"
            type="text"
            placeholder="Họ"
          />
          <p class="text-red-800 w-[350px] text-start">
            {{ v$$.last_name?.$errors[0]?.$message }}
          </p>

          <input
            v-model="register.first_name"
            class="form__input"
            type="text"
            placeholder="Tên"
          />
          <p class="text-red-800 w-[350px] text-start">
            {{ v$$.first_name?.$errors[0]?.$message }}
          </p>

          <input
            v-model="register.address"
            class="form__input"
            type="text"
            placeholder="Địa chỉ"
          />
          <p class="text-red-800 w-[350px] text-start">
            {{ v$$.address?.$errors[0]?.$message }}
          </p>

          <input
            v-model="register.mobile"
            class="form__input"
            type="text"
            placeholder="Sdt"
          />
          <p class="text-red-800 w-[350px] text-start">
            {{ v$$.mobile?.$errors[0]?.$message }}
          </p>

          <input
            v-model="register.email"
            class="form__input"
            type="text"
            placeholder="Email"
          />
          <p class="text-red-800 w-[350px] text-start">
            {{ v$$.email?.$errors[0]?.$message }}
          </p>

          <input
            v-model="register.password"
            class="form__input"
            type="password"
            placeholder="Mật khẩu"
          />
          <p class="text-red-800 w-[350px] text-start">
            {{ v$$.password?.$errors[0]?.$message }}
          </p>

          <input
            v-model="register.password_confirmation"
            class="form__input"
            type="password"
            placeholder="Xác nhận mật khẩu"
          />
          <p class="text-red-800 w-[350px] text-start">
            {{ v$$.password_confirmation?.$errors[0]?.$message }}
          </p>

          <Button
            class="mt-3 sign_up"
            type="submit"
            rounded
            label="ĐĂNG KÝ"
            :loading="loading"
          />
        </form>
      </div>
      <div
        :class="handleSubmitLogin ? 'is-txl is-z200' : ''"
        class="container b-container"
        id="b-container"
      >
        <form
          class="form"
          id="b-form"
          method=""
          @submit.prevent="handleLogin"
          action=""
        >
          <h2 class="form_title title">Đăng nhập vào trang Website</h2>
          <span class="form__span">hoặc sử dụng tài khoản email của bạn</span>
          <input
            v-model="login.email"
            class="form__input"
            type="text"
            placeholder="Email"
          />
          <p class="text-red-800 w-[350px] text-start">
            {{ v$.email?.$errors[0]?.$message }}
          </p>
          <input
            v-model="login.password"
            class="form__input"
            type="password"
            placeholder="Mật khẩu"
          />
          <p class="text-red-800 w-[350px] text-start">
            {{ v$.password?.$errors[0]?.$message }}
          </p>
          <Button
            class="mt-3 sign_up"
            type="submit"
            rounded
            label="ĐĂNG NHẬP"
            :loading="loading"
          />
        </form>
      </div>
      <div
        :class="handleSubmitLogin ? 'is-txr' : ''"
        class="switch"
        id="switch-cnt"
      >
        <div class="switch__circle"></div>
        <div class="switch__circle switch__circle--t"></div>
        <div class="switch__container is-hidden" id="switch-c1">
          <h2 class="switch__title title">Welcome back !</h2>
          <p class="switch__description description">
            Để giữ kết nối với chúng tôi, vui lòng đăng nhập bằng thông tin cá
            nhân của bạn
          </p>
          <button class="switch__button button switch-btn">ĐĂNG NHẬP</button>
        </div>
        <div class="switch__container" id="switch-c2">
          <h2 class="switch__title title">Chào bạn !</h2>
          <p class="switch__description description">
            Nhập thông tin cá nhân của bạn và bắt đầu hành trình với chúng tôi
          </p>
          <button class="switch__button button switch-btn">ĐĂNG KÝ</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import Button from "primevue/button";
import { onMounted, computed, reactive, ref } from "vue";
import { useRoute, useRouter } from "vue-router";
import { useRegisterStore } from "@/store/register.js";
import { toastMessage } from "@/helper/toastMessage.js";
import { useVuelidate } from "@vuelidate/core";
import { required, email, helpers } from "@vuelidate/validators";
const registerStore = useRegisterStore();
const route = useRoute();
const router = useRouter();
const register = reactive({
  mobile: "",
  first_name: "",
  last_name: "",
  email: "",
  address: "",
  password: "",
  password_confirmation: "",
});

const login = reactive({
  email: "",
  password: "",
});
const loading = ref(false);
const ruleLogin = computed(() => {
  return {
    email: {
      required: helpers.withMessage(`Email Không để trống`, required),
      email: helpers.withMessage(`Email Không hợp lệ`, email),
    },
    password: {
      required: helpers.withMessage(`Mật khẩu Không để trống`, required),
    },
  };
});
const v$ = useVuelidate(ruleLogin, login);
async function handleLogin() {
  const result = await v$.value.$validate();
  if (result) {
    loading.value = true;
    setTimeout(async () => {
      registerStore
        .login(login)
        .then((data) => {
          localStorage.setItem("token", data.data.data.accessToken);
          registerStore.setAccount(data.data.data.user);
          if (data.data.data.user.role === "admin") {
            router.push("/admin/manage-users");
          } else {
            router.push("/");
          }
          toastMessage("success", "Thành công", "Đăng nhập thành công");
        })
        .catch(() => {
          toastMessage("error", "Thất bại", "Đăng thất bại");
        })
        .finally(() => {
          loading.value = false;
        });
    }, 2000);
  }
}

const handleSubmitLogin = computed(() => {
  return route.path.includes("login");
});

const ruleRegister = computed(() => {
  return {
    email: {
      required: helpers.withMessage(`Email Không để trống`, required),
      email: helpers.withMessage(`Email Không hợp lệ`, email),
    },
    password: {
      required: helpers.withMessage(`Mật khẩu Không để trống`, required),
    },
    mobile: {
      required: helpers.withMessage(`Số điện thoại Không để trống`, required),
    },
    first_name: {
      required: helpers.withMessage(`Họ Không để trống`, required),
    },
    last_name: {
      required: helpers.withMessage(`Tên Không để trống`, required),
    },
    address: {
      required: helpers.withMessage(`Địa chỉ Không để trống`, required),
    },
    password_confirmation: {
      required: helpers.withMessage(
        `Nhập lại mật khẩu Không để trống`,
        required
      ),
    },
  };
});
const v$$ = useVuelidate(ruleRegister, register);
async function handleRegister() {
  const result = await v$$.value.$validate();
  if (result) {
    loading.value = true;
    setTimeout(() => {
      registerStore
        .register(register)
        .then(() => {
          toastMessage("success", "Thành công", "Đăng Ký thành công");
          addClass();
        })
        .catch((error) => {
          toastMessage("error", "Thất bại", "Email đã được sử dụng");
          console.log(error);
        })
        .finally(() => {
          loading.value = false;
        });
    }, 2000);
  }
}

function addClass() {
  let switchCtn = document.querySelector("#switch-cnt");
  let aContainer = document.querySelector("#a-container");
  let bContainer = document.querySelector("#b-container");
  aContainer.classList.add("is-txl");
  bContainer.classList.add("is-txl");
  switchCtn.classList.add("is-txr");
  bContainer.classList.add("is-z200");
}

function mouted() {
  let switchCtn = document.querySelector("#switch-cnt");
  let switchC1 = document.querySelector("#switch-c1");
  let switchC2 = document.querySelector("#switch-c2");
  let switchCircle = document.querySelectorAll(".switch__circle");
  let switchBtn = document.querySelectorAll(".switch-btn");
  let aContainer = document.querySelector("#a-container");
  let bContainer = document.querySelector("#b-container");
  let allButtons = document.querySelectorAll(".submit");

  let getButtons = (e) => e.preventDefault();

  let changeForm = () => {
    switchCtn.classList.add("is-gx");
    setTimeout(function () {
      switchCtn.classList.remove("is-gx");
    }, 1500);

    switchCtn.classList.toggle("is-txr");
    switchCircle[0].classList.toggle("is-txr");
    switchCircle[1].classList.toggle("is-txr");

    switchC1.classList.toggle("is-hidden");
    switchC2.classList.toggle("is-hidden");
    aContainer.classList.toggle("is-txl");
    bContainer.classList.toggle("is-txl");
    bContainer.classList.toggle("is-z200");
  };

  let mainF = () => {
    for (var i = 0; i < allButtons.length; i++)
      allButtons[i].addEventListener("click", getButtons);
    for (var j = 0; j < switchBtn.length; j++)
      switchBtn[j].addEventListener("click", changeForm);
  };

  mainF();
  return () => {
    return changeForm();
  };
}

onMounted(() => {
  mouted();
});
</script>
<style lang="scss" scoped>
*,
*::after,
*::before {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  user-select: none;
}

// :deep(.p-button) {
//   padding-left: 20px;
//   padding-right: 20px;
// }
.sign_up {
  padding-left: 60px !important;
  padding-right: 60px !important;
}
.form__icons {
  display: flex;
}
/* Generic */
.wrap_main {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: "Montserrat", sans-serif;
  font-size: 12px;
  background-color: #d5e3ed;
  color: #a0a5a8;
  height: 100vh;
}

/**/
.main {
  position: relative;
  width: 1000px;
  min-width: 1000px;
  min-height: 600px;
  height: 600px;
  padding: 25px;
  background-color: #ecf0f3;
  box-shadow: 10px 10px 10px #d1d9e6, -10px -10px 10px #cfdae1;
  border-radius: 12px;
  overflow: hidden;
}
@media (max-width: 1200px) {
  .main {
    transform: scale(0.7);
  }
}
@media (max-width: 1000px) {
  .main {
    transform: scale(0.6);
  }
}
@media (max-width: 800px) {
  .main {
    transform: scale(0.5);
  }
}
@media (max-width: 600px) {
  .main {
    transform: scale(0.4);
  }
}

.container {
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 0;
  width: 600px;
  height: 100%;
  padding: 25px;
  background-color: #ecf0f3;
  transition: 1.25s;
}

.form {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  width: 100%;
  height: 100%;
}
.form__icon {
  object-fit: contain;
  width: 30px;
  margin: 0 5px;
  opacity: 0.5;
  transition: 0.15s;
}
.form__icon:hover {
  opacity: 1;
  transition: 0.15s;
  cursor: pointer;
}
.form__input {
  width: 350px;
  height: 40px;
  border: 2px solid #ccc;
  margin: 4px 0;
  padding-left: 25px;
  position: relative;
  font-size: 13px;
  letter-spacing: 0.15px;
  outline: none;
  font-family: "Montserrat", sans-serif;
  background-color: #ecf0f3;
  transition: 0.25s ease;
  border-radius: 8px;
  box-shadow: inset 2px 2px 4px #d1d9e6, inset -2px -2px 4px #f9f9f9;
}
.form__input:focus {
  box-shadow: inset 4px 4px 4px #d1d9e6, inset -4px -4px 4px #f9f9f9;
  position: relative;
  // border-bottom-color: #d90429;
}
input {
  color: #000;
}
.form__input::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 0;
  width: 100%;
  height: 2px;
  background-color: #d90429;
}

.form__span {
  margin-top: 30px;
  margin-bottom: 12px;
}
.form__link {
  color: #181818;
  font-size: 15px;
  margin-top: 25px;
  border-bottom: 1px solid #a0a5a8;
  line-height: 2;
}

.title {
  font-size: 34px;
  font-weight: 700;
  line-height: 3;
  color: #181818;
}

.description {
  font-size: 14px;
  letter-spacing: 0.25px;
  text-align: center;
  line-height: 1.6;
}

.button {
  width: 180px;
  height: 50px;
  border-radius: 25px;
  margin-top: 50px;
  font-weight: 700;
  font-size: 14px;
  letter-spacing: 1.15px;
  background-color: #d90429;
  color: #f9f9f9;
  box-shadow: 8px 8px 16px #d1d9e6, -8px -8px 16px #f9f9f9;
  border: none;
  outline: none;
}

/**/
.a-container {
  z-index: 100;
  left: calc(100% - 600px);
}

.b-container {
  left: calc(100% - 600px);
  z-index: 0;
}

.switch {
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 400px;
  padding: 50px;
  z-index: 200;
  transition: 1.25s;
  background-color: #ecf0f3;
  overflow: hidden;
  box-shadow: 4px 4px 10px #d1d9e6, -4px -4px 10px #f9f9f9;
}
.switch__circle {
  position: absolute;
  width: 500px;
  height: 500px;
  border-radius: 50%;
  background-color: #ecf0f3;
  box-shadow: inset 8px 8px 12px #d1d9e6, inset -8px -8px 12px #f9f9f9;
  bottom: -60%;
  left: -60%;
  transition: 1.25s;
}
.switch__circle--t {
  top: -30%;
  left: 60%;
  width: 300px;
  height: 300px;
}
.switch__container {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  position: absolute;
  width: 400px;
  padding: 50px 55px;
  transition: 1.25s;
}
.switch__button {
  cursor: pointer;
}
.switch__button:hover {
  box-shadow: 6px 6px 10px #d1d9e6, -6px -6px 10px #f9f9f9;
  transform: scale(0.985);
  transition: 0.25s;
}
.switch__button:active,
.switch__button:focus {
  box-shadow: 2px 2px 6px #d1d9e6, -2px -2px 6px #f9f9f9;
  transform: scale(0.97);
  transition: 0.25s;
}

/**/
.is-txr {
  left: calc(100% - 400px);
  transition: 1.25s;
  transform-origin: left;
}

.is-txl {
  left: 0;
  transition: 1.25s;
  transform-origin: right;
}

.is-z200 {
  z-index: 200;
  transition: 1.25s;
}

.is-hidden {
  visibility: hidden;
  opacity: 0;
  position: absolute;
  transition: 1.25s;
}

.is-gx {
  animation: is-gx 1.25s;
}

@keyframes is-gx {
  0%,
  10%,
  100% {
    width: 400px;
  }
  30%,
  50% {
    width: 500px;
  }
}
</style>
