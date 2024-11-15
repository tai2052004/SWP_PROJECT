<%-- 
    Document   : OrderDetails
    Created on : Oct 2, 2024, 9:52:55 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.* , dao.*, java.util.*" %> 
<%@ page import="java.text.NumberFormat" %>
<%
    Order order = (Order) request.getAttribute("order");
    User user = (User) session.getAttribute("user"); 
%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nike Full Force Low</title>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/OrderDetails.css?v=1.0.1"/>

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
                        <a href=""><i class="bi bi-cart"></i></a>
                    </div>
                    <div class="search">
                        <i class="bi bi-search"></i>
                    </div>
                </div>
            </div>
        </header>

        <div class="order-header">
            <a href="TrackMyOrder.jsp" class="return-btn">
                <i class="bi bi-arrow-return-left"></i>Return
            </a>
            <h1>Order Details</h1>
        </div>
        <div class="order-card">
            <%
                int id = order.getUser_id();
                User users = OrderDB.getUserInfo(id);
            %>
            <div class="order-id">
                <h2>OrderID: <%= order.getOrder_id()%></h2>
            </div>
            <div class="order-info">
                <span class="order-info-first">Information Address:</span>
                <span><%= users.getFullname()%> - <%= users.getPhone()%></span><br>
                <span>Address: <%= order.getAddress()%></span>
            </div>
            <div class="order-status">
                <p><strong>Order status:</strong> <span class="status-pending"><%=order.getStatus()%></span></p>
                <p><strong>Date order:</strong><%= order.getOrder_date()%></p>
            </div>
            <%
                int idDetail = order.getOrder_id();
                float subtotal = 0;
                float discount= 0;
                List<OrderDetail> orderDetail = OrderDB.getOrderDetailsById(idDetail); 
                for(OrderDetail orderDetails : orderDetail) { 
                    subtotal += orderDetails.getPrice() * orderDetails.getQuantity() ;
                    discount =+ orderDetails.getDiscount();
                    String formatPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(orderDetails.getPrice());
            %>
            <div class="product-info">
                <img src="<%= orderDetails.getImg_url()%>" alt="<%= orderDetails.getProductName()%>" class="product-img">
                <div class="product-details">
                    <h3><%= orderDetails.getProductName()%></h3>
                    <p class="price"><%= formatPrice%> x <%= orderDetails.getQuantity()%> </p>
                </div>
            </div>
            <%
                }
                    String formatSubPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(subtotal);
                    Coupon coupon = CouponDB.getCouponById(order.getCoupon());
                    float coupon_value = 0;
                    if ( coupon != null)
                    {
                        coupon_value = (float) coupon.getDiscountValue();
                    }
                    String formatCouponValue = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(coupon_value);
                    float feeship = order.getFeeship();
                    String formatFeeShip = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(feeship);
                    float total = subtotal - coupon_value + feeship;
                    String formatTotal = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(total);
            %>
            <table class="order-summary">
                <tr>
                    <td class="text-left">Total cost of goods</td>
                    <td class="text-right"><%= formatSubPrice%></td>
                </tr>
                <tr>
                    <td class="text-left">Shipping fee</td>
                    <td class="text-right"><%= formatFeeShip%></td>
                </tr>
                <tr>
                    <td class="text-left">Voucher from Shop</td>
                    <%
                        if(coupon_value ==0 ) {
                    %>
                    <td class="text-right">0</td>
                    <%
                        } else {
                    %>
                    <td class="text-right">-<%= formatCouponValue%></td>
                    <%
                        }
                    %>
                </tr>
                <tr>
                    <td class="text-left">Total price</td>
                    <td class="text-right"><%= formatTotal%></td>
                </tr>
                <tr>
                    <td class="text-left">Payment Method</td>
                    <td class="text-right">Payment upon receipt</td>
                </tr>
            </table>
            <form id="orderSelectionForm<%= order.getOrder_id()%>" action="ComfirmAndCancelOrder" method="GET">
                <%
                    String status = order.getStatus();
                    if(status.equals("Pending")) {
                %>
                <button id="cancelOrderBtn" name="action" value="Cancel1" class="cancel-btn" type="submit" onclick="chooseOrder(<%= order.getOrder_id()%>)">Cancel order</button>
                <%
                    } else if(status.equals("Shipping")) {
                %>
                <button id="cancelOrderBtn" name="action" value="Arrived" class="cancel-btn" type="submit" onclick="chooseOrder(<%= order.getOrder_id()%>)">Received</button>
                <%
                    } else if(status.equals("Delivered") || status.equals("Cancelled")) { 
                %>
                <button id="cancelOrderBtn" name="action" value="DeliAndCancelled" class="cancel-btn" type="submit" onclick="chooseOrder(<%= order.getOrder_id()%>)">Re-Order</button>
                <%
                    }
                %>
                <input type="hidden" id="selectedOrder<%= order.getOrder_id() %>" name="orderId" value="">
            </form>

        </div>


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

    </body>
    <script>
        function chooseOrder(orderId) {

            document.getElementById('selectedOrder' + orderId).value = orderId;

            document.getElementById('orderSelectionForm' + orderId).submit();
        }
    </script>
</html>