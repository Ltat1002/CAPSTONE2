import * as firebase from "@/configs/firebase.js";

export function sendReport(data) {
  console.log(data);
  firebase.push(firebase.ref(firebase.database, "report"), data);
}

export function getReport(ref) {
  firebase.onValue(firebase.ref(firebase.database, "report"), async (data) => {
    ref.value = data.val() && Object.values(data.val());
    console.log(data.val());
    data.val() &&
      Object.values(data.val()).forEach((item) => {
        console.log(item);
      });
  });
}
