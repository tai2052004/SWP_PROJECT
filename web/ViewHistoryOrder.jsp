<%-- 
    Document   : ManageProfile
    Created on : Sep 23, 2024, 11:35:30 PM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.User , dao.UserDB, dao.OrderDB, model.OrderDetail" %> 
<%@ page import="java.util.*" %>
<%@page import="model.* , dao.*, java.util.*" %> 
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
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HESH - SHOE WEBSITE</title>
        <link rel="stylesheet" href="CSS/ViewHistoryOrder3.css?v=1.0.1">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                    <p>Username has been existed!.</p>
                </div>
                <a class="close">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <% }
        %>    
        <% 
    if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
        <div class="alerts">    
            <div class="alert alert-success animated bounceInRight">
                <div class="icon pull-left">
                    <i class="fa fa-check-circle fa-2x"></i>
                </div>
                <div class="copy">
                    <h4>SUCCESS</h4>
                    <p>Update user successful!</p>
                </div>
                <a class="close">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <% }
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
                            <a href="/favorites">Favorite Items</a>
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

                        <div class="profile-img" id="change-password-icon">
                            <i class="bi bi-key"></i>
                        </div>
                        <div class="profile-img active" id="notification-icon">
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
                            <div class="profile-name" id="change-password">
                                <p>Change Password</p>
                            </div>
                        </a>
                        <a href="ViewHistoryOrder.jsp">
                            <div class="profile-name active" id="view-order-history">
                                <p>View History Order</p>
                            </div>
                        </a>

                    </div>


                </div>                
            </div>
            <div class="body-part-2">
                <div class="body-2-part1">
                    <p>Order History</p>
                </div>
                <div class="body-2-part2">
                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Product Name</th>
                                    <th>Brand</th>
                                    <th>Price</th>
                                    <th>Size</th>
                                    <th>Quantity</th>
                                    <th>Order Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Order> orderList = OrderDB.getOrderByIdUser(user.getUser_id());
                                for (Order o : orderList) {
                                    List<OrderDetail> oDT = OrderDB.getOrderDetailsById(o.getOrder_id());
                                    for (OrderDetail orderDetail : oDT) {
                                %>
                                <tr>
                                    <td><%= ++i %></td>
                                    <td><%= orderDetail.getProductName() %></td>
                                    <td><%= orderDetail.getBrand() %></td>
                                    <td><%= orderDetail.getPrice() %></td>
                                    <td><%= orderDetail.getSize() %></td>
                                    <td><%= orderDetail.getQuantity() %></td>
                                    <td><%= orderDetail.getOrderDate() %></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>                       
                        </table>
                    </div>

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
        <% System.out.println(user.getUser_id());%>
        <script src="js/ManageProfile.js" type="module"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const closeButtons = document.querySelectorAll('.alert .close');

                closeButtons.forEach(function (button) {
                    button.addEventListener('click', function () {
                        this.closest('.alert').style.display = 'none';
                    });
                });
            });
        </script>
</html>
