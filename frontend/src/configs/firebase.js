// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import {
  getDatabase,
  ref,
  push,
  onValue,
  get,
  child,
  update,
  remove,
} from "firebase/database";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyCOS7a_m4qvngML5XfbA4WVjLk4q07RUuE",
  authDomain: "repair-service-website.firebaseapp.com",
  databaseURL:
    "https://repair-service-website-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "repair-service-website",
  storageBucket: "repair-service-website.appspot.com",
  messagingSenderId: "395850880120",
  appId: "1:395850880120:web:04e7f3cc812f66047ec98d",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const database = getDatabase(app);
export { database, ref, push, onValue, get, child, update, remove };
