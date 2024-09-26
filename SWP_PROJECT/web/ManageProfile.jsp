<%-- 
    Document   : ManageProfile
    Created on : Sep 23, 2024, 11:35:30 PM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HESH - SHOE WEBSITE</title>
        <link rel="stylesheet" href="CSS/ManageProfile.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body>
        <div class="header">
            <div class="logo">
                <img src="img/Logo.png" alt="alt"/>
                <p>HESH</p>
            </div>
            <div class="header-button">
                <p>HOME</p>
                <p>SHOP</p>
                <p>SALES</p>
                <p>CONTACT</p>
            </div>
            <div class="header-avatar">
                <div class="cart">
                    <i class="bi bi-cart-fill fs-3 text-primary"></i> 
                </div> 
                <div class="avatar">
                    <img src="img/avatar.png" alt="avatar" />
                </div>                  
            </div>
        </div>
        
        <div class="body">
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
                        <div class="profile-img">
                            <i class="bi bi-person"></i>
                        </div>
                        
                        <div class="profile-img">
                            <i class="bi bi-key"></i>
                        </div>
                        <div class="profile-img">
                            <i class="bi bi-bell"></i>
                        </div>
                    </div>
                    <div class="part1-second-detail2">
                        <div class="profile-name">
                            <p>My Profile</p>
                        </div>
                        <div class="profile-name">
                            <p>Change Password</p>
                        </div>
                        <div class="profile-name">
                            <p>Notification</p>
                        </div>
                    </div>
             
                    <div class="part1-second-detail3">
                        <div class="profile-arrow">
                            <i class="bi bi-chevron-right"></i> <!-- Right arrow icon -->
                        </div>
                        <div class="profile-arrow">
                            <i class="bi bi-chevron-right"></i> <!-- Right arrow icon -->
                        </div>
                        <div class="profile-arrow">
                            <i class="bi bi-chevron-right"></i> <!-- Right arrow icon -->
                        </div>
                    </div>
                    
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
</footer>
</html>
