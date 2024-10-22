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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Login </title>
    </head>
    <body>
        <% 

    if (request.getParameter("error") != null && request.getParameter("error").equals("invalid")) { %>
        <div class="alerts">    
            <div class="alert alert-danger animated bounceInRight">
                <div class="icon pull-left">
                    <i class='fa fa-exclamation-triangle fa-2x'></i>
                </div>
                <div class="copy">
                    <h4>ERROR</h4>
                    <p>Invalid username or password.</p>
                </div>
                <a class="close">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <% }
        %>
        <div class="login_container">
            <h1>Login</h1>
            <h5>Please enter your Login and your Password</h5>
            <form action="LoginServlet" method="post">
                <div class="input_container">
                    <i class="bi bi-person"></i>
                    <input type="text" name="username" placeholder="Username" value="${u}" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="password" name="password" placeholder="Password" value="${p}" required>
                </div>
                <a href="forgot_password.jsp" class="forgot_password">Forgot password?</a>
                <input type="submit" class="input_container_submit" value="Login">
                <input type="hidden" name="action" value="login">
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
        <script src="js/login.js?v=1.0.1" type="module"></script>
        <script>
        document.addEventListener('DOMContentLoaded', function() {
    const closeButtons = document.querySelectorAll('.alert .close');
    
    closeButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            this.closest('.alert').style.display = 'none';
        });
    });
});
        </script>
    </body>
</html>