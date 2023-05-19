import * as firebase from "@/configs/firebase.js";

export function sendReport(data) {
  firebase.push(firebase.ref(firebase.database, "report"), data);
}

export function getReportById(id) {
  return firebase.get(
    firebase.child(firebase.ref(firebase.database), `report/${id}`)
  );
}

export function updateReportById(id, data) {
  return firebase.update(firebase.ref(firebase.database, `report/${id}`), data);
}

export function deleteReportById(id) {
  return firebase.remove(firebase.ref(firebase.database, `report/${id}`));
}

export function getReport(ref) {
  firebase.onValue(firebase.ref(firebase.database, "report"), async (data) => {
    console.log(data.val());
    ref.value =
      data.val() &&
      Object.keys(data.val()).map((item) => {
        return {
          ...data.val()[item],
          key: item,
        };
      });
  });
}
