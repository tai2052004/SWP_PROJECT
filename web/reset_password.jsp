<%-- 
    Document   : reset_password
    Created on : Sep 25, 2024, 12:54:00 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/login_style.css?v=1.0.1"/>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <title>Reset Password </title>
    </head>
    <body>
        <div class="login_container">
            <h1>Register</h1>
            <div class="signup_link login">
                Remember your password?  <a href="login.jsp">Login here</a>
            </div>
            <form>
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="text" name="password" placeholder="New Password" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="text" name="re-password" placeholder="Re-enter Password" required>
                </div>
                <input type="submit" class="input_container_submit" value="Request password reset">
            </form>
        </div>
        <script src="js/login.js"></script>
    </body>
</html>