<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%
    String email = "";
    // Lấy giá trị của 'continueUrl' từ tham số query string
    String continueUrl = request.getParameter("continueUrl");
    
    // Kiểm tra nếu 'continueUrl' không phải null
    if (continueUrl != null) {
        try {
            String decodedUrl = URLDecoder.decode(continueUrl, "UTF-8");
            String emailParam = decodedUrl.split("email=")[1];
            email = URLDecoder.decode(emailParam, "UTF-8");
            
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    } else {
        out.println("Không có continueUrl trong URL.");
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
        <div class="login_container">
            <h1>Register</h1>
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
</html>
