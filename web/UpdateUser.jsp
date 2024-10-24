<%-- 
    Document   : UpdateUser
    Created on : Oct 24, 2024, 3:08:05 PM
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
    <link href="CSS/styles.css" rel="stylesheet" />
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
                        <a class="sidebar-button is-active" href="UserManage.jsp">
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
            <div class="user-info-container">
                <div class="user-info-form">
                    <h2 class="form-header">User Information</h2>

                    <!-- Avatar section -->
                    <div class="avatar-section">
                        <img src="path-to-default-avatar.png" alt="User Avatar" class="user-avatar">
                    </div>

                    <div class="form-grid">
                        <!-- Left Column -->
                        <div class="form-column">
                            <div class="form-group">
                                <label for="user-id">ID</label>
                                <input type="text" id="user-id" class="form-control" value="1" readonly>
                            </div>

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" class="form-control" value="abc-xyz@gmail.com">
                            </div>

                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select id="gender" class="form-control">
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>
                        </div>

                        <!-- Right Column -->
                        <div class="form-column">
                            <div class="form-group">
                                <label for="full-name">Full Name</label>
                                <input type="text" id="full-name" class="form-control" value="Tran Ngoc Thien">
                            </div>

                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="tel" id="phone" class="form-control" value="0702411147">
                            </div>

                            <div class="form-group">
                                <label for="role">Role</label>
                                <select id="role" class="form-control">
                                    <option value="admin">Admin</option>
                                    <option value="user">User</option>
                                    <option value="manager">Manager</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <a href="UserManage.jsp" class="btn btn-save" style="text-decoration: none;">
                            Save update
                        </a>
                        <a href="UserManage.jsp" class="btn btn-cancel" style="text-decoration: none;">
                            Cancel update
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
  
    </body>
</html>
