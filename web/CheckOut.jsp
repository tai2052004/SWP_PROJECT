<%-- 
    Document   : CheckOut
    Created on : Sep 25, 2024, 10:01:16 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.* , dao.*, java.util.*" %> 
<%
    Product p = (Product) session.getAttribute("product");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/CheckOut.css"/>
    <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body>
        <header>
        
        <div class="row header">
            <div class="col-md-3 logo">
                <img src="img/logo1.png">
            </div>

            <div class="col-md-6 menu">
                <a href="landingPage.jsp" class="menuText active">HOME</a>
                <a href="AllProduct.jsp" class="menuText">SHOP</a>
                <a href="#footer" class="menuText">CONTACT</a>
            </div>
            
            <div class="col-md-3 user-actions">
                <div class="login">
                    <a href="login.jsp"><i class="bi bi-person-fill"></i>Login</a>
                </div>
                <div class="cart">
                    <a href=""><i class="bi bi-cart"></i></a>
                </div>
                <div class="search">
                    <i class="bi bi-search"></i>
                </div>
            </div>
        </div>
    </header>
        <div>
            <p class="title"> CHECK OUT </p>  
            <div class="Form">
            <div class="form-container">
                <div class="form-group">
                    <p class="detail">PERSONAL DETAILS</p>

                    <div>
                        <input type="text" id="fullname" name="fullname"  placeholder="Full Name">
                    </div>
                </div>
                <div class="input-inline" >
                    <div>
                        <input class ="inputEmail" type="email" id="email" name="email" placeholder="Email" cols="20">
                    </div>

                    <div>
                        <div class="spacenumber">
                            <select class="country-code" id="country-code" name="country-code">
                                <option value="+84">+84</option>
                                <option value="+1">+1</option>
                                <option value="+44">+44</option>
                            </select>
                            <input class="inputNumber" type="text" id="phone" name="phone" placeholder="Phone Number">
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div>
                    <p class="detail2">SHIPPING DETAILS</p>
                </div>
                <div>
                    <input type="text" id="fullname" name="fullname"  placeholder="Address">
                </div>
            </div>
                </div>
        </div>

        <div class="order-container">
            <h2>Your Order</h2>
            <div class="order-header">
                <div>Product</div>
                <div>Price</div>
                <div>Quantity</div>
                <div>Subtotal</div>
            </div>

            <!-- Item 1 -->
            <div class="order-item">
                <div class="product">
                    <img src="img/new-balance-530.png" alt="New Balance 530 - Dark Olivine" />
                    <div>
                        <p>New Balance 530 - Dark Olivine</p>
                        <p>Size: 40</p>
                    </div>
                </div>
                <div>2.050.000</div>
                <div>1</div>
                <div>2.050.000</div>
            </div>

            <!-- Item 2 -->
            <div class="order-item">
                <div class="product">
                    <img src="img/reebok-club-c.png" alt="Reebok Club C Revenge - Pink Clay" />
                    <div>
                        <p>Reebok Club C Revenge - Pink Clay</p>
                        <p>Size: 38</p>
                    </div>
                </div>
                <div>2.350.000</div>
                <div>2</div>
                <div>4.100.000</div>
            </div>

            <!-- Order summary -->
            <div class="order-summary">
                <div></div>
                <div></div>
                <div>Subtotal</div>
                <div>6.150.000</div>

                <div></div>
                <div></div>
                <div>Discount</div>
                <div>0.0</div>

                <div></div>
                <div></div>
                <div>Total</div>
                <div>6.150.000</div>
            </div>
            <div class="confirm-button-container">
                <button class="confirm-button">Confirm</button>
            </div>
        </div>


        <div class="footer">
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
        </div>
    </body>
</html>
