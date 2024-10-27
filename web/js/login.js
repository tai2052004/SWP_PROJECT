import { initializeApp } from "https://www.gstatic.com/firebasejs/10.13.2/firebase-app.js";
import { getAuth,GoogleAuthProvider,signInWithPopup } from "https://www.gstatic.com/firebasejs/10.13.2/firebase-auth.js";

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
const provider = new GoogleAuthProvider();

const googleLogin = document.getElementById("google-login-btn");
googleLogin.addEventListener("click", function(){
    signInWithPopup(auth, provider)
  .then((result) => {
    const credential = GoogleAuthProvider.credentialFromResult(result);
    const user = result.user;
    console.log(user);
    window.location.href = "landingPage.jsp";
  }).catch((error) => {
    const errorCode = error.code;
    const errorMessage = error.message;
});

});

