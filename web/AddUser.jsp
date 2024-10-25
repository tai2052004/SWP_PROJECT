<%-- 
    Document   : AddUser
    Created on : Oct 24, 2024, 3:02:26 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script
            defer
            src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"
        ></script>
        <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Kavoon&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
            />
        <link href="CSS/styles1.css?v=1.0.1" rel="stylesheet" />
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
        <div class="header">
            <div>
                <img src="assets/logo.svg" width="77" height="72" style="margin-left: 74px" />
                <img src="assets/logo2.png" width="110" height="27" />
                <img src="assets/back-arrow.svg" width="24" height="30" style="margin-left: 27px" />
                <img src="assets/home.svg" width="36" height="36" style="margin-left: 55px" />
                <span class="title" style="margin-left: 25px">HOME</span>
                <img src="assets/forward.svg" width="24" height="35" style="margin-left: 25px" />
                <span class="title accent-text" style="margin-left: 40px">
                    User Manage
                </span>
            </div>
            <div>
                <div class="logout-button">
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
                            <a class="sidebar-button is-active" href="UserManage.Jsp">
                                <img src="assets/user.svg" width="36" height="36" style="margin-right: 13px" /> User Management
                            </a>
                            <a class="sidebar-button" href="CouponList.jsp">
                                <img src="assets/coupon.svg" width="36" height="36" style="margin-right: 13px" /> Coupon Management
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="add-user-container">
                    <div class="add-user-form">
                        <h2 class="form-header">Add New User</h2>
                        <form action="AddUserServlet" method="post">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" class="form-control" name="username" value="${u}" placeholder="Username">
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" class="form-control" name="password" value="${p}" placeholder="Password">
                            </div>

                            <div class="form-group">
                                <label for="personal-name">Personal name</label>
                                <input type="text" id="personal-name" class="form-control" name="fullname" value="${f}" placeholder="Full name" >
                            </div>

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" class="form-control" name ="email" value="${e}" placeholder="Email">
                            </div>

                            <div class="form-group">
                                <label for="phone">Phone number</label>
                                <input type="tel" id="phone" name="phone"  value="${p}" placeholder="Phone number">
                            </div>

                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" id="address" class="form-control" name="address" value="${a}" placeholder="Address">
                            </div>

                            <div class="form-group">
                                <label>Role</label>
                                <div class="role-options">
                                    <div class="role-option">
                                        <input type="radio" id="admin" name="role" value="admin">
                                        <label for="admin">Admin</label>
                                    </div>
                                    <div class="role-option">
                                        <input type="radio" id="warehouse" name="role" value="warehouse">
                                        <label for="warehouse">Ware House</label>
                                    </div>
                                    <div class="role-option">
                                        <input type="radio" id="user" name="role" value="user" checked>
                                        <label for="customer">Customer</label>
                                    </div>
                                </div>
                            </div>    
                            <div class="form-actions">
                                <button class="btn btn-confirm">Confirm add</button>
                                <button class="btn btn-cancel">Cancel Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
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
