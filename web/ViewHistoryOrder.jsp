<%-- 
    Document   : ManageProfile
    Created on : Sep 23, 2024, 11:35:30 PM
    Author     : LAPTOPadasdasdasdadasdasd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.User , dao.UserDB, dao.OrderDB, model.OrderDetail" %> 
<%@ page import="java.util.*" %>
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
    
    List<OrderDetail> oD = OrderDB.getOrderDetail();
    List<OrderDetail> oDT = new ArrayList<OrderDetail>();
    for ( OrderDetail o : oD)
    {
        if ( o.getUser_id() == user.getUser_id() )
        {
            oDT.add(o);
        }
    }
    int i = 1;
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HESH - SHOE WEBSITE</title>
        <link rel="stylesheet" href="CSS/ViewOrderHistory1.css?v=1.0.1">
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
        <div class="header">
            <div class="logo">
                <img src="img/Logo.png" alt="alt"/>
                <p>HESH</p>
            </div>
            <div class="header-button">
                <a href="landingPage.jsp"><p>HOME</p></a>
                <a href="AllProduct.jsp"><p>SHOP</p></a>
                <a href=""><p>SALES</p></a>
                <a href=""><p>CONTACT</p></a>
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
                            <c:forEach var="orderDetail" items="${oDT}">
                                <tr>
                                    <td><%= i++ %></td>
                                    <td>${orderDetail.productName}</td>
                                    <td>${orderDetail.brand}</td>
                                    <td>${orderDetail.price}</td>
                                    <td>${orderDetail.size}</td>
                                    <td>${orderDetail.quantity}</td>
                                    <td>${orderDetail.orderDate}</td>
                                </tr>
                            </c:forEach>
                            </tbody>                       
                        </table>
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
    <% System.out.println(user.getUser_id());%>
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
