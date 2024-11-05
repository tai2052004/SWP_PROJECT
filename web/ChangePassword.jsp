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
    String email = user.getUser_email();
    String phone = user.getPhone(); 
    if(phone == null) {
    phone ="";
    }
    String gender = user.getGender();
    String fulln= user.getFullname();
    if(fulln == null) {
    fulln = "";
    }
    String dob = user.getDob();
    String address= user.getAddress();
    if(address == null) {
    address = "";
    }
    int i = 0;
    int id = user.getUser_id();
    String password = user.getUser_password();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" href="CSS/ChangePassword1.css?v=1.0.1">
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

        <header>
        
        <div class="row header">
            <div class="col-md-3 logo">
                <img src="img/logo1.png">
            </div>

            <div class="col-md-6 menu">
                <a href="landingPage.jsp" class="menuText">HOME</a>
                <a href="AllProduct.jsp" class="menuText">SHOP</a>
                <a href="#footer" class="menuText">CONTACT</a>
            </div>
            
            <div class="col-md-3 user-actions">
                <% if(user == null) {%> 
                    <div class="login">
                        <a href="login.jsp"><i class="bi bi-person-fill"></i>Login</a>
                    </div>
                <% } else { %>
                    <div class="logout dropdown">
                        <a href="LogoutControl" class="dropdown-toggle"><i class="bi bi-list"></i><i class="bi bi-person-fill"></i>Logout</a>
                        <div class="dropdown-menu">
                            <a href="ManageProfile.jsp">My profile</a>
                            <a href="TrackMyOrder.jsp">Track my order</a>
                            <a href="Favorite.jsp">Favorite Items</a>
                        </div>
                    </div>
                <% } %>
                <div class="cart">
                    <a href="ShoppingCart.jsp"><i class="bi bi-cart"></i></a>
                </div>
                <div class="search">
                    <i class="bi bi-search"></i>
                </div>
            </div>
        </div>
    </header>
        
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
                        <p><%= email %></p>
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
    <footer class="row footer" id="footer">
        <div class="col-md-4 footer-text">
            <p>HESH (Heaven Shoes) is your top choice for stylish, high-quality footwear. We believe the right shoes boost your confidence and comfort, making every step a delight. Explore our diverse, trendy collection to find the perfect fit for your unique style.</p>
        </div>
        <div class="col-md-4 information">
            <h3>Information</h3>
            <a href="landingPage.jsp">Home</a>
            <a href="AllProduct.jsp">Shop</a>
        </div>
        <div class="col-md-4 contact">
            <h3>Contact us</h3>
            <span><i class="bi bi-telephone"></i>0702411147</span>
            <span><i class="bi bi-geo-alt"></i>12 My Da Tay 8, Khue My, Ngu Hanh Son,<br>Da Nang City</span>
            <span><i class="bi bi-envelope"></i>hesh-shoe-selling@gmail.com</span>
        </div>
    </footer>
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

</html>
