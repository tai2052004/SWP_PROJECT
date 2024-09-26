<%-- 
    Document   : register
    Created on : Sep 25, 2024, 12:21:02 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/login_style.css?v=1.0.1"/>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <body>
        <div class="login_container">
            <h1>Register</h1>
            <h5>Please enter your Name, Login and your Password</h5>
            <form>
                <div class="input_container">
                    <i class="bi bi-person"></i>
                    <input type="text" name="username" placeholder="Username" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-person"></i>
                    <input type="text" name="email" placeholder="Email" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="password" name="re-password" placeholder="Re-enter Password" required>
                </div>
                <input type="submit" class="input_container_submit" value="Register">
                <div class="signup_link">
                    Already have an Account  <a href="">Login!</a>
                </div>
            </form>
        </div>
        <script src="js/login.js"></script>
    </body>
</html>