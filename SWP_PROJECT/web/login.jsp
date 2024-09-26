<%-- 
    Document   : login
    Created on : Sep 24, 2024, 11:46:12 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/login_style.css?v=1.0.1"/>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="login_container">
            <h1>Login</h1>
            <h5>Please enter your Login and your Password</h5>
            <form>
                <div class="input_container">
                    <i class="bi bi-person"></i>
                    <input type="text" name="username" placeholder="Username" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <a href="forgot_password.jsp" class="forgot_password">Forgot password?</a>
                <input type="submit" class="input_container_submit" value="Login">
                <div class="google_login">
                    <button id = google-login-btn class="google-button">
                        <img class="google_login_logo" src="img/google_logo.png" alt="alt"/> Or, sign-in with Google
                    </button>
                </div>
                
                <div class="signup_link">
                    Not a member yet?  <a href="register.jsp">Register!</a>
                </div>
            </form>
        </div>
        <script src="js/login.js" type="module"></script>
    </body>
</html>