<%-- 
    Document   : OrderInfo
    Created on : Oct 21, 2024, 8:24:44 PM
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
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
            />
        <link href="CSS/styles1.css" rel="stylesheet" />
    </head>
    <body>
        <div class="header">
            <div>
                <img
                    src="assets/logo.svg"
                    width="77"
                    height="72"
                    style="margin-left: 74px"
                    />
                <img src="assets/logo2.png" width="110" height="27" />
                <img
                    src="assets/back-arrow.svg"
                    width="24"
                    height="30"
                    style="margin-left: 27px"
                    />
                <img
                    src="assets/home.svg"
                    width="36"
                    height="36"
                    style="margin-left: 55px"
                    />
                <span class="title" style="margin-left: 25px">HOME</span>
                <img
                    src="assets/forward.svg"
                    width="24"
                    height="35"
                    style="margin-left: 25px"
                    />
                <span class="title accent-text" style="margin-left: 40px">
                    Sales statistics
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
                            <img
                                src="assets/dashboard.svg"
                                width="36"
                                height="36"
                                style="margin-right: 13px"
                                />
                            <span style="margin-right: auto"> Dashboard </span>
                            <img
                                src="assets/arrow-down.svg"
                                width="24"
                                height="24"
                                style="
                                margin-right: 13px;
                                transition: ease 0.2s;
                                "
                                :class="isOpen && 'is-arrow-down'"
                                />
                        </div>

                        <div
                            class="collapsible"
                            :class="isOpen && 'is-open'"
                            :style="isOpen && {height: '100%'}"
                            >
                            <a
                                class="sidebar-button is-active"
                                href="OrderList.jsp"
                                >
                                <img
                                    src="assets/cart.svg"
                                    width="36"
                                    height="36"
                                    style="margin-right: 13px"
                                    />
                                Orders Management
                            </a>
                            <a class="sidebar-button" href="SaleStatistic.jsp">
                                <img
                                    src="assets/sales.svg"
                                    width="36"
                                    height="36"
                                    style="margin-right: 13px"
                                    />
                                Sales Statistics
                            </a>
                            <a class="sidebar-button" href="UserManage.jsp">
                                <img
                                    src="assets/user.svg"
                                    width="36"
                                    height="36"
                                    style="margin-right: 13px"
                                    />
                                User Management
                            </a>
                            <a class="sidebar-button" href="CouponList.jsp">
                                <img
                                    src="assets/coupon.svg"
                                    width="36"
                                    height="36"
                                    style="margin-right: 13px"
                                    />
                                Coupon Management
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div>
                    <div class="main-header">
                        <span class="title">Orders Management</span>
                        <div class="search-bar">
                            <div>
                                <img src="assets/search.svg" />
                            </div>
                            <input placeholder="Search order..." />
                        </div>
                    </div>
                    <div class="order-table order-table-action">
                        <div>Order Id</div>
                        <div>Customer</div>
                        <div>Date</div>
                        <div>Price</div>
                        <div>Status</div>
                        <span class="line"></span>
                        <div>#0001</div>
                        <div>Nguyen Van Hung</div>
                        <div>13-09-2024</div>
                        <div>2.690.000</div>
                        <div>
                            <div class="badge on-deliver">On Deliver</div>
                        </div>
                    </div>
                    <div class="order-details">
                        <span class="title">Orders Detail</span>
                        <div class="order-grid">
                            <div>#</div>
                            <div>Product Name</div>
                            <div>Size</div>
                            <div>Quantity</div>
                            <div>Price</div>
                            <div>Total Price</div>
                            <span class="line"></span>
                            <div>1</div>
                            <div>Nike Air Force 1 Low By You</div>
                            <div>41</div>
                            <div>1</div>
                            <div>1.050.000</div>
                            <div>1.050.000</div>
                            <span class="line"></span>
                            <div>2</div>
                            <div>Nike Dunk Low - Bronzine</div>
                            <div>42</div>
                            <div>1</div>
                            <div>1.050.000</div>
                            <div>1.050.000</div>
                            <span class="line"></span>
                        </div>
                        <div class="order-summary">
                            <div class="order-summary-grid">
                                <span>Subtotal</span>
                                <span>1.050.000</span>
                                <span>Discount</span>
                                <span>0</span>
                                <span>Total</span>
                                <span>1.050.000</span>
                            </div>
                            <div class="button-container">
                                <div class="accent">Cancel order</div>
                                <div>Submit order</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
