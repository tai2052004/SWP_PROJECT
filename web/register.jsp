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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <title>Register </title>
    </head>
    <body>
        <% 
    if (request.getParameter("error") != null && request.getParameter("error").equals("invalid")) { 
%>
    <div class="alerts">    
        <div class="alert alert-danger animated bounceInRight">
            <div class="icon pull-left">
                <i class='fa fa-exclamation-triangle fa-2x'></i>
            </div>
            <div class="copy">
                <h4>ERROR</h4>
                <p>Username already exists!</p>
            </div>
            <a class="close">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
<% 
    } else if (request.getParameter("error") != null && request.getParameter("error").equals("not-match")) { 
%>
    <div class="alerts">    
        <div class="alert alert-danger animated bounceInRight">
            <div class="icon pull-left">
                <i class='fa fa-exclamation-triangle fa-2x'></i>
            </div>
            <div class="copy">
                <h4>ERROR</h4>
                <p>Passwords do not match!</p>
            </div>
            <a class="close">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
<% 
    } else if (request.getParameter("error") != null && request.getParameter("error").equals("existed")) { 
%>
    <div class="alerts">    
        <div class="alert alert-danger animated bounceInRight">
            <div class="icon pull-left">
                <i class='fa fa-exclamation-triangle fa-2x'></i>
            </div>
            <div class="copy">
                <h4>ERROR</h4>
                <p>Email already exists!</p>
            </div>
            <a class="close">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
<% 
    }
%>
        <div class="login_container">
            <h1>Register</h1>
            <h5>Please enter your Name, Login and your Password</h5>
            <div id="error-message" style="color: red; display: none;">
            </div>
            <form action="LoginServlet" method="post">
                <div class="input_container">
                    <i class="bi bi-person"></i>
                    <input type="text" name="username" placeholder="Username" value="${u}" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-person"></i>
                    <input type="email" name="email" placeholder="Email" value="${e}" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="password" name="password" placeholder="Password" value="${p}" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="password" name="re-password" placeholder="Re-enter Password"  required>
                </div>
                <input type="submit" class="input_container_submit" value="Register">
                <input type="hidden" name="action" value="register">
                <div class="signup_link">
                    Already have an Account  <a href="login.jsp">Login!</a>
                </div>
            </form>
        </div>
        <script src="js/login.js"></script>
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