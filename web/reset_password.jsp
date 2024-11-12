<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%
    String email = "";
    String continueUrl = request.getParameter("continueUrl");
    
    if (continueUrl != null) {
        try {
            String decodedUrl = URLDecoder.decode(continueUrl, "UTF-8");
            String emailParam = decodedUrl.split("email=")[1];
            email = URLDecoder.decode(emailParam, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="CSS/login_style.css?v=1.0.1"/>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <title>Reset Password </title>
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
                        <p>Old password not correct or confirm password does not match!</p>
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
            <h1>Reset Password</h1>
            <div class="signup_link login">
                Remember your password?  <a href="login.jsp">Login here</a>
            </div>
            <form action="ForgotPasswordServlet" method="post">
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="text" name="password" placeholder="New Password" required>
                </div>
                <div class="input_container">
                    <i class="bi bi-lock"></i>
                    <input type="text" name="re-password" placeholder="Re-enter Password" required>
                </div>
                <input type="hidden" name="email" value="<%= email %>">
                <input type="submit" class="input_container_submit" value="Request password reset">
            </form>
        </div>
    </body>
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
</html>
