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
reset.addEventListener("click", function(event) {
    event.preventDefault();
    const email = document.getElementById("email").value;

    // Tùy chỉnh URL hành động reset mật khẩu với URL cụ thể của bạn
    const actionCodeSettings = {
        url: "http://localhost:9999/SWP_PROJECT-4/reset_password.jsp?email=" + encodeURIComponent(email), // Địa chỉ URL tùy chỉnh với email
        handleCodeInApp: true // Cấu hình để xử lý mã trong ứng dụng thay vì trình duyệt
    };

    sendPasswordResetEmail(auth, email, actionCodeSettings)
    .then(() => {
        alert("Email đã được gửi đến " + email + ". Vui lòng kiểm tra hộp thư của bạn.");
    })
    .catch((error) => {
        const errorCode = error.code;
        const errorMessage = error.message;
        alert(errorMessage);
    });
});
