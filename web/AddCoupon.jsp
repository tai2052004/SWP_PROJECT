<%-- 
    Document   : AddCoupon
    Created on : Oct 24, 2024, 3:25:23 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Kavoon&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
    <link href="CSS/stylesss.css" rel="stylesheet" />
    </head>
    <body>
        <div class="header">
        <div>
            <img src="assets/logo.svg" width="77" height="72" style="margin-left: 74px" />
            <img src="assets/logo2.png" width="110" height="27" />
            <img src="assets/back-arrow.svg" width="24" height="30" style="margin-left: 27px" />
            <img src="assets/home.svg" width="36" height="36" style="margin-left: 55px" />
            <span class="title" style="margin-left: 25px">HOME</span>
            <img src="assets/forward.svg" width="24" height="35" style="margin-left: 25px" />
            <span class="title accent-text" style="margin-left: 40px">
                        Coupon Management
                    </span>
        </div>
        <div>
            <div class="logout-button" onclick="window.location.href='LogoutControl'" style= "cursor: pointer;">
                <span class="title black-text">Logout</span>
                <img src="assets/logout.svg" width="30" height="30" />
            </div>
        </div>
    </div>
    <div class="body">
        <div class="sidebar">
            <div class="sidebar-top">
                <img src="assets/sidebar-logo.svg" width="76" height="71" />
                <span>Administrator.</span>
            </div>
            <div class="sidebar-bottom">
                <div x-data="{ isOpen: false}" style="width: 100%">
                    <div @click="isOpen= !isOpen" class="sidebar-button">
                        <img src="assets/dashboard.svg" width="36" height="36" style="margin-right: 13px" />
                        <span style="margin-right: auto"> Dashboard </span>
                        <img src="assets/arrow-down.svg" width="24" height="24" style="
                                        margin-right: 13px;
                                        transition: ease 0.2s;
                                    " :class="isOpen && 'is-arrow-down'" />
                    </div>

                   <div class="collapsible" :class="isOpen && 'is-open'" :style="isOpen && {height: '100%'}">
                        <a class="sidebar-button " href="OrderList.jsp">
                            <img src="assets/cart.svg" width="36" height="36" style="margin-right: 13px" /> Orders Management
                        </a>
                        <a class="sidebar-button" href="SaleStatistic.jsp">
                            <img src="assets/sales.svg" width="36" height="36" style="margin-right: 13px" /> Sales Statistics
                        </a>
                        <a class="sidebar-button " href="UserManage.jsp">
                            <img src="assets/user.svg" width="36" height="36" style="margin-right: 13px" /> User Management
                        </a>
                        <a class="sidebar-button is-active" href="CouponList.jsp">
                            <img src="assets/coupon.svg" width="36" height="36" style="margin-right: 13px" /> Coupon Management
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="content">
                <div class="add-coupon-container">
                    <div class="add-coupon-form">
                        <h2 class="form-header">Add New Coupon</h2>
                        
                        <!-- Display error message if any -->
                        <% String error = (String) request.getAttribute("error");
                           if(error != null) { %>
                            <div class="alert alert-danger">
                                <%= error %>
                            </div>
                        <% } %>
                        
                        <!-- Display success message if any -->
                        <% String success = (String) request.getAttribute("success");
                           if(success != null) { %>
                            <div class="alert alert-success">
                                <%= success %>
                            </div>
                        <% } %>

                        <form action="AddCouponServlet" method="post" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="discount-name">Coupon Name</label>
                                <input type="text" id="discount-name" name="discount_name" class="form-control" required placeholder="Daily Discount">
                            </div>

                            <div class="form-group">
                                <label for="code">Coupon Code</label>
                                <input type="text" id="code" name="code" class="form-control" required placeholder="DAILY123">
                            </div>

                            <div class="form-group">
                                <label for="discount-value">Discount Value</label>
                                <input type="number" step="0.01" id="discount-value" name="discount_value" class="form-control" required placeholder="100.00">
                            </div>

                            <div class="form-group">
                                <label for="quantity">Quantity</label>
                                <input type="number" id="quantity" name="quantity" class="form-control" required placeholder="100">
                            </div>

                            <div class="form-actions">
                                <button type="submit" class="btn btn-confirm">Confirm Add</button>
                                <a href="CouponList.jsp" class="btn btn-cancel">Cancel Add</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function validateForm() {
                var discountValue = document.getElementById('discount-value').value;
                var quantity = document.getElementById('quantity').value;
                
                if (discountValue <= 0) {
                    alert('Discount value must be greater than 0');
                    return false;
                }
                
                if (quantity <= 0) {
                    alert('Quantity must be greater than 0');
                    return false;
                }
                
                return true;
            }
        </script>
    </div>
   
    </body>
</html>