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
    </head>
    <body>
        <div class="login_container">
            <h1>Forgot Password</h1>
            <div class="signup_link login">
                Remember your password?  <a href="login.jsp">Login here</a>
            </div>
            <form>
                <div class="input_container">
                    <i class="bi bi-person"></i>
                    <input type="text" name="email" id="email" placeholder="Email address" required>
                </div>
                <button type="button" id="reset" class="input_container_submit">Request password reset</button>
            </form>
        </div>
        <script src=""
        <script src="js/forgot_password.js" type="module"></script>
    </body>
</html>