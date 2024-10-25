<%-- 
    Document   : ManageProfile
    Created on : Sep 23, 2024, 11:35:30 PM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.User , dao.UserDB" %> 
<%
    User user = (User) session.getAttribute("user");
    int id = user.getUser_id();
    String password = user.getUser_password();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="CSS/ChangePassword3.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

<% 
    if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { 
%>
    <div class="alerts">    
        <div class="alert alert-success animated bounceInRight">
            <div class="icon pull-left">
                <i class="fa fa-check-circle fa-2x"></i>
            </div>
            <div class="copy">
                <h4>SUCCESS</h4>
                <p>Change successful!</p>
            </div>
            <a class="close">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
<% 
    } 
%>

        <div class="header">
            <div class="logo">
                <img src="img/Logo.png" alt="alt"/>
                <p>HESH</p>
            </div>
            <div class="header-button">
                <a href="landingPage.jsp"><p>HOME</p></a>
                <a href="AllProduct.jsp"><p>SHOP</p></a>
                <a href="#footer"><p>CONTACT</p></a>
            </div>
            <div class="col-md-3 user-actions header-avatar">
                <div class="cart">
                    <a href=""><i class="bi bi-cart"></i></a>
                </div>
                <div class="search" style="color: white;">
                    <i class="bi bi-search"></i>
                </div> 
                <div class="avatar">
                    <img src="img/avatar.png" alt="avatar" />
                </div>                  
            </div>
        </div>
        
        <div class="body">
            <div class="video-background">
                <video autoplay muted loop id="bgVideo">
                    <source src="img/sky-video.mp4" type="video/mp4">
                </video>
            </div>
            <div class="body-part-1">
                <div class="part1-first">
                    <div class="part1-first-avatar">
                        <img src="img/avatar.png" alt="">
                    </div>
                    <div class="part1-first-name">
                        <p>TaiDepTrai</p>
                    </div>                 
                </div>
                <div class="part1-second">
                    <div class="part1-second-detail">
                        <div class="profile-img" id="my-profile-icon">
                            <i class="bi bi-person"></i>
                        </div>
                        
                        <div class="profile-img active" id="change-password-icon">
                            <i class="bi bi-key"></i>
                        </div>
                        <div class="profile-img" id="notification-icon">
                            <i class="bi bi-bell"></i>
                        </div>
                    </div>
                    <div class="part1-second-detail2">
                        <a href="ManageProfile.jsp">
                            <div class="profile-name" id="my-profile">
                                <p>My Profile</p>
                            </div>
                        </a>
                        <a href="ChangePassword.jsp">
                            <div class="profile-name active" id="change-password">
                                <p>Change Password</p>
                            </div>
                        </a>
                        <a href="ViewHistoryOrder.jsp">
                            <div class="profile-name" id="view-order-history">
                                <p>View Order History</p>
                            </div>
                        </a>
                        
                    </div>                 
                </div>                
            </div>
            <div class="body-part-2">
                <div class="part2-first">
                     <p id="p-profile">Change Password</p>
                     <i class="bi bi-lock"></i>
                </div>
                <div class="part2-second">
                    <form action="ChangePasswordServlet" method="post">
                        <table>
                            <tr>
                                <td style="padding-right: 20px; font-weight: 500;">Old Password</td>
                                <td><input style="width: 500px; height: 40px; border-radius: 10px; padding: 15px;" type="text" name="old password" placeholder="old password" required></td>
                            </tr>
                            <tr>
                                <td style="padding-right: 20px; font-weight: 500;">New Password</td>
                                <td><input style="width: 500px; height: 40px; border-radius: 10px; padding: 15px;" type="text" name="new password" placeholder="new password" required></td>
                            </tr>
                            <tr>
                                <td style="padding-right: 20px; font-weight: 500;">Confirm Password</td>
                                <td><input style="width: 500px; height: 40px; border-radius: 10px; padding: 15px;" type="text" name="confirm new pass" placeholder="new password" required></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: center;">
                                    <button type="submit" class="btn btn-success btn-lg">Save Change</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            
        </div>
        
    </body>
    <footer class="footer">
    <div class="footer1">
        <p>HESH (Heaven Shoes) is your top choice for stylish, high-quality footwear. We believe the right shoes boost your confidence and comfort, making every step a delight. Explore our diverse, trendy collection to find the perfect fit for your unique style.</p>
    </div>   
    <div class="footer2">
        <div class="footer2-inside-1">
            <div class="infor">
                <p id="infor-detail">Information<p>
            </div>
            <div class="infor">
                <p>Email : taidepchai@gmail.com<p>
            </div>
            <div class="infor">
                <p>Phone : 0123456789<p>
            </div>
            <div class="infor">
                <p>Addres : do biet o dau<p>
            </div>
        </div>
        <div class="footer2-inside-2">
            <div class="contact">
                <p>Contact us<p>
            </div>
            <div class="contact-img">
                <div class="contact-detail">
                    <img src="img/facebook.jpg" />
                </div>
                <div class="contact-detail">
                    <img src="img/instagram.jpg" />
                </div>
                <div class="contact-detail">
                    <img src="img/tiktok.png" />
                </div>
            </div>
            
        </div>
        
    </div>
        <script src="js/ManageProfile.js" type="module"></script>
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
</footer>
</html>
