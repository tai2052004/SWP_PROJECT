import { initializeApp } from "https://www.gstatic.com/firebasejs/10.13.2/firebase-app.js";
import { getAuth, sendPasswordResetEmail } from "https://www.gstatic.com/firebasejs/10.13.2/firebase-auth.js";
  const firebaseConfig = {
  apiKey: "AIzaSyBGYweyFtvFjfFKiLBjNiJhyt1i4zoNhuI",
  authDomain: "hesh-shoe-selling-websit-aa022.firebaseapp.com",
  projectId: "hesh-shoe-selling-websit-aa022",
  storageBucket: "hesh-shoe-selling-websit-aa022.appspot.com",
  messagingSenderId: "708645020961",
  appId: "1:708645020961:web:426367c90908c1a4e80a60"
};
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
auth.languageCode = 'en';
const reset = document.getElementById("reset");
reset.addEventListener("click", function(event){
    event.preventDefault();
    const email = document.getElementById("email").value;
    sendPasswordResetEmail(auth, email)
  .then(() => {
    alert("Email đã được gửi đến " + email + ". Vui lòng kiểm tra hộp thư của bạn.");
  })
  .catch((error) => {
    const errorCode = error.code;
    const errorMessage = error.message;
    alert(errorMessage);
  });
});
