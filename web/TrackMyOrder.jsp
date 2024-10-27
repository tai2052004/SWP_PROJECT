<%-- 
    Document   : TrackMyOrder
    Created on : Oct 22, 2024, 3:43:24 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.* , dao.*, java.util.*" %> 
<%@ page import="java.text.NumberFormat" %>
<%
    User user = (User) session.getAttribute("user"); 
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hesh Shoes</title>
    <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/TrackMyOrder.css?v=1.0.1"/>
  
</head>
<body>

    <header>
        
        <div class="row header">
            <div class="col-md-3 logo">
                <img src="img/logo1.png">
            </div>

            <div class="col-md-6 menu">
                <a href="landingPage.jsp" class="menuText">HOME</a>
                <a href="AllProduct.jsp" class="menuText active">SHOP</a>
                <a href="#footer" class="menuText">CONTACT</a>
            </div>
            
            <div class="col-md-3 user-actions">
                <div class="logout dropdown">
                    <a href="" class="dropdown-toggle"><i class="bi bi-list"></i><i class="bi bi-person-fill"></i>Logout</a>
                    <div class="dropdown-menu">
                        <a href="ManageProfile.jsp">My profile</a>
                        <a href="TrackMyOrder.jsp">Track my order</a>
                        <a href="#">Favorite Items</a>
                    </div>
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
    <main>
        <div class="status-bar">
            <button class="status-btn" data-status="pending">Pending</button>
            <button class="status-btn active" data-status="on-shipping">On shipping</button>
            <button class="status-btn" data-status="arrived">Arrived</button>
            <button class="status-btn" data-status="canceled">Canceled</button>
        </div>

        <div id="order-grid" class="order-grid">
            <% 
                int id = user.getUser_id();
                List<Order> order = OrderDB.getOrderByIdUser(id);
                for(Order orders : order) {
                    String status = orders.getStatus();
                    if(status.equals("Shipping")) {
                        status = "on-shipping";
                    } else if(status.equals("Pending")) {
                        status = "pending";
                    } else if(status.equals("Delivered")) {
                        status = "arrived";
                    } else {
                        status = "canceled";
                    }
                    
            %>
            <div class="order-card" data-status="<%= status%>">
                <div class="order-header">
                    <div class="order-id">
                        <span>OrderID</span>
                        <strong><%= orders.getOrder_id()%></strong>
                    </div>
                    <div class="order-date"><%= orders.getOrder_date()%></div>
                    <div class="order-status"><%= orders.getStatus()%></div>
                </div>
                <div class="shipping-info">
                    <div class="from">
                        <i class="bi bi-truck"></i>
                        <span>Da Nang, VietNam</span>
                    </div>
                    <div class="shipping-arrow">•••••••••&gt;</div>
                    <div class="to">
                        <i class="bi bi-geo-alt"></i>
                        <span><%= orders.getAddress()%></span>
                    </div>
                </div>
                <%
                    double subtotal =0;
                    double discount = 0;
                    List<OrderDetail> orderDetail = OrderDB.getOrderDetailsById(orders.getOrder_id());
                    for(OrderDetail orderDetails : orderDetail) {
                        subtotal += orderDetails.getPrice() * orderDetails.getQuantity() ;
                        discount =+ orderDetails.getDiscount();
                        String formatPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(orderDetails.getPrice());
                %>
                <div class="products">
                    <div class="product">
                        <img src="<%= orderDetails.getImg_url()%>" alt="<%= orderDetails.getProductName()%>">
                        <div class="product-details">
                            <h3><%= orderDetails.getProductName()%></h3>
                            <p class="price"><%= formatPrice %> x  <%= orderDetails.getQuantity()%></p>
                            <p class="size">Size: <%= orderDetails.getSize()%></p>
                        </div>
                    </div>
                    
                </div>
                <%
                    }
                        double totalDiscount = (subtotal) *(discount/100);
                        Coupon coupon = CouponDB.getCouponById(orders.getCoupon());
                        double coupon_value = coupon.getDiscountValue();
                        double feeship = orders.getFeeship();
                        double total = subtotal - discount - coupon_value + feeship;
                        String formatTotalPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(total);
                %>
                <div class="order-footer">
                    <div class="total-price"><%= formatTotalPrice %></div>
                    <form id="orderSelectionForm<%= orders.getOrder_id()%>" action="OrderDetailServlet" method="GET">
                        <button class="details-button" type="submit" onclick="chooseOrder(<%= orders.getOrder_id()%>)">Details</button>
                        <input type="hidden" id="selectedOrder<%= orders.getOrder_id() %>" name="orderId" value="">
                    </form>
                </div>
                
            </div>
            <%
                }
            %>
            
            
            
        </div>
    </main>

    <footer class="row footer" id="footer">
        <div class="col-md-4 footer-text">
            <p>HESH (Heaven Shoes) is your top choice for stylish, high-quality footwear. We believe the right shoes boost your confidence and comfort, making every step a delight. Explore our diverse, trendy collection to find the perfect fit for your unique style.</p>
        </div>
        <div class="col-md-4 information">
            <h3>Information</h3>
            <a href="">Home</a>
            <a href="">Shop</a>
        </div>
        <div class="col-md-4 contact">
            <h3>Contact us</h3>
            <span><i class="bi bi-telephone"></i>0702411147</span>
            <span><i class="bi bi-geo-alt"></i>12 My Da Tay 8, Khue My, Ngu Hanh Son,<br>Da Nang City</span>
            <span><i class="bi bi-envelope"></i>hesh-shoe-selling@gmail.com</span>
        </div>
    </footer>
    <script src="js/TrackMyOrder.js"></script>
    <script>
                    function chooseOrder(orderId) {

                        document.getElementById('selectedOrder' + orderId).value = orderId;

                        document.getElementById('orderSelectionForm' + orderId).submit();
                    }
    </script>
</body>
</html>
