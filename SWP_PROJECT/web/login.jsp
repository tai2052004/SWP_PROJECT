<%-- 
    Document   : login
    Created on : Sep 24, 2024, 11:46:12 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="google-signin-client_id" content="554631662341-oimlcvvoufc6uq3h5f9orj94l7n5fdhq.apps.googleusercontent.com">
        <link rel="stylesheet" href="CSS/login_style.css"/>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://apis.google.com/js/platform.js" async defer></script>    </head>
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
                <a href="" class="forgot_password">Forgot password?</a>
                <input type="submit" class="input_container_submit" value="Login">
                <div class="g-signin2" data-onsuccess="onSignIn"></div>
                <div class="signup_link">
                    Not a member yet?  <a href="">Register!</a>
                </div>
            </form>
        </div>
        <script src="js/login.js"></script>
    </body>
</html>