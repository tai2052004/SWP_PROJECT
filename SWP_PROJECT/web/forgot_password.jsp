<%-- 
    Document   : register
    Created on : Sep 25, 2024, 12:21:02 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="google-signin-client_id" content="554631662341-oimlcvvoufc6uq3h5f9orj94l7n5fdhq.apps.googleusercontent.com">
        <link rel="stylesheet" href="CSS/login_style.css?v=1.0.1"/>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://apis.google.com/js/platform.js" async defer></script>    </head>
    <body>
        <div class="login_container">
            <h1>Register</h1>
            <div class="signup_link login">
                Remember your password?  <a class="" href="">Login here</a>
            </div>
            <form>
                <div class="input_container">
                    <i class="bi bi-person"></i>
                    <input type="text" name="email" placeholder="Email address" required>
                </div>
                <input type="submit" class="input_container_submit" value="Request password reset">
            </form>
        </div>
        <script src="js/login.js"></script>
    </body>
</html>