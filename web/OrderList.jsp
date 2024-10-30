<%-- 
    Document   : OrderList
    Created on : Oct 21, 2024, 8:25:40 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.* , dao.*, java.util.*" %> 
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
        <link href="CSS/styless.css" rel="stylesheet" />
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
                <div class="logout-button" onclick="window.location.href = 'LogoutControl'" style="cursor: pointer;">
                    <span class="title black-text" >Logout</span>
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
                                href="OrderList.html"
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
                                <img src="assets/search.svg" onclick="filterOrders()" style="cursor: pointer;" />
                            </div>
                            <input placeholder="Search order..." id="orderSearchInput" />
                        </div>
                    </div>
                    <div class="order-table order-table-header">
                        <div>Order Id</div>
                        <div>Customer</div>
                        <div>Date</div>
                        <div>Price</div>
                        <div>Status</div>
                        <div>Action</div>
                    </div>
                    <div id="orderList" >
                        <%
                            List<Order> ordersList = OrderDB.getOrder();
        
                            for (Order orders : ordersList) {
                                int id = orders.getUser_id();
                                User user = OrderDB.getUserInfo(id);

                                // Format the price
                                float price = orders.getTotal_price();
                                String formatPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(price);

                                // Get and format the status for each order
                                String status = orders.getStatus();
                                String statusClass = "";
                                if ("Shipping".equals(status)) {
                                    statusClass = "on-deliver";
                                } else if ("Pending".equals(status)) {
                                    statusClass = "pending";
                                } else if ("Cancelled".equals(status)) {
                                    statusClass = "cancelled";
                                } else if ("Delivered".equals(status)) {
                                    statusClass = "delivered";
                                }
                        %>
                        <!-- Wrap each order in a single order-row div for filtering -->
                        <div class="order-row order-table" data-order-id="<%= orders.getOrder_id() %>">
                            <div><%= orders.getOrder_id() %></div> <!-- Order ID -->
                            <div><%= user != null ? user.getFullname() : "No Customer Info" %></div> <!-- Customer Name -->
                            <div><%= orders.getOrder_date() != null ? orders.getOrder_date() : "N/A" %></div> <!-- Order Date -->
                            <div><%= formatPrice %></div> <!-- Price -->
                            <div>
                                <div class="badge <%= statusClass %>"><%= status != null ? status : "N/A" %></div> <!-- Status Badge -->
                            </div>
                            <div>
                                <form id="orderSelectionForm<%= orders.getOrder_id() %>" action="OrderInfoServler" method="GET">
                                    <button class="icon" type="submit" onclick="chooseOrder(<%= orders.getOrder_id() %>)">
                                        <div></div> <!-- Icon inside button -->
                                    </button>
                                    <input type="hidden" id="selectedOrder<%= orders.getOrder_id() %>" name="orderId" value="">
                                </form>
                            </div>
                        </div>
                        <!-- End of order row -->
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        function filterOrders() {
            const searchInput = document.getElementById('orderSearchInput').value.trim().toLowerCase();
            const orders = document.querySelectorAll('.order-row');
            let visibleOrderCount = 0; // Counter for matching orders

            orders.forEach(order => {
                const orderId = order.getAttribute('data-order-id').toLowerCase();

                // Check if order ID matches the search input
                if (orderId.includes(searchInput)) {
                    order.style.display = ""; // Show matching row
                    visibleOrderCount++; // Increment counter for matching orders
                } else {
                    order.style.display = 'none'; // Hide non-matching row
                }
            });

            // If no orders match, alert and reset view to show all orders again
            if (visibleOrderCount === 0) {
                Swal.fire({
                    icon: 'error',
                    title: 'ERROR',
                    text: ' No order found ',
                    confirmButtonText: 'OK'
                });
                // Reset: Display all orders again
                orders.forEach(order => {
                    order.style.display = ""; // Show all rows
                });
            }
        }
        function chooseOrder(orderId) {

            document.getElementById('selectedOrder' + orderId).value = orderId;

            document.getElementById('orderSelectionForm' + orderId).submit();
        }
    </script>

</html>
