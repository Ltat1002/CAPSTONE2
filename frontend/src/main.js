import { createApp } from "vue";
import App from "./App.vue";
import router from "./router";
import "primeicons/primeicons.css";
import PrimeVue from "primevue/config";
import ConfirmationService from "primevue/confirmationservice";
import "./index.scss";
import "primevue/resources/themes/lara-light-indigo/theme.css";
import "primevue/resources/primevue.min.css";
import "primeicons/primeicons.css";
import "boxicons";
import { pinia } from "./store";

const app = createApp(App);
app.use(pinia);
app.use(router);
app.use(PrimeVue);
app.use(ConfirmationService);
app.mount("#app");
