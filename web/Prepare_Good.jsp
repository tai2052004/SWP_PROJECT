<%-- 
    Document   : Prepare_Good
    Created on : Oct 25, 2024, 8:00:45 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.* , dao.*, java.util.*" %> 
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<% 
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    String timeframe = request.getParameter("timeframe");
    List<Order> listOrders = new ArrayList<Order>();
    if (timeframe == null || timeframe.isEmpty()) {
        listOrders = OrderDB.getOrder();
    } else {
        listOrders = OrderDB.getOrderByTimeframe(timeframe);
    }
    int shippingCount = OrderDB.countByStatus("Shipping", listOrders);
    int confirmedCount = OrderDB.countByStatus("Confirmed", listOrders);
%>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link href="CSS/stylesss.css" rel="stylesheet" />
        <style>
             .content {
                flex-grow: 1;
                padding: 30px;
                background-color: #f8f8f8;
            }
    
            .summary {
                display: flex;
                justify-content: space-between;
                margin-bottom: 30px;
                padding: 20px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
    
            .summary div {
                text-align: center;
            }
    
            .summary div span {
                display: block;
                font-size: 14px;
                margin-bottom: 10px;
            }
    
            .summary div h2 {
                font-size: 40px;
                margin: 0;
            }
    
            .inventory-list {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
    
            table {
                width: 100%;
                border-collapse: collapse;
            }
    
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
    
            th {
                background-color: #f4f4f4;
            }
    
            .button-container {
                display: flex;
                justify-content: flex-end;
                margin-bottom: 50px;
                 margin-top: 13px;
            }
    
            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-left: 10px;
            }
    
            .btn-secondary {
                background-color: #6c757d;
            }
    
            .btn-primary {
                background-color: #28a745;
            }
    
            .filter-container {
                display: flex;
                justify-content: flex-end;
                margin-bottom: 10px;
            }
    
            .filter-input {
                display: flex;
                gap: 10px;
            }
    
            .filter-input input {
                padding: 5px 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
    
            .filter-input button {
                padding: 5px 22px;
                  border: 1px solid #ccc;
                 background-color: white;
  
                  border-radius: 15px;
                   width: 90px;
                 margin: 8px;
            }
            .icon {
                border: none;
            }
            a {
                text-decoration: none;
            }
        </style>
    </head>
    <body>
      <div class="header">
            <div>
                <img src="assets/logo.svg" width="77" height="72" style="margin-left: 74px" />
                <img src="assets/logo2.png" width="110" height="27" />
                <img src="assets/home.svg" width="36" height="36" style="margin-left: 55px" />
                <span class="title" style="margin-left: 25px">HOME</span>
                <img src="assets/forward.svg" width="24" height="35" style="margin-left: 25px" />
                <span class="title accent-text" style="margin-left: 40px">
                    Inventory Manage
                    </span>
            </div>
            <div>
                <div class="logout-button">
                <a style="text-decoration: none;" href="LogoutControl" class="logout"><span class="title black-text">Logout</span></a>
                    <img src="assets/logout.svg" width="30" height="30" />
                </div>
            </div>
        </div>
        <div class="body">
            <div class="sidebar">
                <div class="sidebar-top">
                    <img src="assets/sidebar-logo.svg" width="76" height="71" />
                    <span>Warehouse.</span>
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
                            <a class="sidebar-button " href="WarehouseInventory.jsp">
                                <img src="assets/Vector.svg" width="36" height="36" style="margin-right: 13px" /> Inventory Manage
                            </a>
                            <a class="sidebar-button is-active" href="Prepare_Good.jsp">
                                <img src="assets/PrepareGood.svg" width="36" height="36" style="margin-right: 13px" /> Prepare Good
                            </a>                          
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="main-header">
                    <span class="title">Prepare Goods</span>
                    
                </div>
                <div class="summary">
                    <div style="display: flex;">
                        <img src="assets/shoppingBag.svg" width="36" height="36" style="margin-right: 13px" />
                        <h1 style="
                        margin-top: -4px;
                        ">Order</h1>
                        <div style="margin-left: auto;
                                    margin-top: -25px;" >
                            <form id="timeframe" action="Prepare_Good.jsp" method="get">
                                <select id="daySelect" name="timeframe" style="font-size: 28px; padding: 5px; font-family: 'Poppins', sans-serif; font-weight: 500;    margin-top: 18px;">
                                <option value="thisday" <%= "thisday".equals(timeframe)? "selected" : "" %>>This day</option>
                                <option value="thisweek" <%= "thisweek".equals(timeframe)? "selected" : "" %>>This week</option>
                                <option value="thismonth" <%= "thismonth".equals(timeframe)? "selected" : "" %>>This month</option>
                                </select>
                            </form>
                            <script>
                                document.getElementById('daySelect').addEventListener('change', function () {
                                document.getElementById('timeframe').submit();
                                });
                           </script>
                            
                        </div>
                    </div>
                    <div style="display: flex; justify-content: space-around;">
                    <div>
                        <h1>All orders</h1>
                        <h2><%= confirmedCount + shippingCount %></h2>
                    </div>
                    <div>
                        <h1 style="color:green;">Shipping</h1>
                        <h2><%= shippingCount %></h2>
                    </div>
                    <div>
                      <div> <h1 style="color: red;">Confirmed</h1> </div> 
                        <h2><%= confirmedCount %></h2>
                    </div>
                </div>
                    
                </div>
    
                <div class="inventory-list">
                    <!-- Search and buttons bar -->
                    <div style="
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 20px;
                    ">
                    <div>
                        <h1> Order List</h1>
                    </div>
                    </div>
                    <div>
                       
                        <div class="order-table order-table-header">
                            <div>Order Id</div>
                            <div>Customer</div>
                            <div>Date</div>
                            <div>Price</div>
                            <div>Status</div>
                            <div>Action</div>
                        </div>
                        <div class="order-table">
                            <% 
                            for (Order r : listOrders) {
                                String fullname = OrderDB.getUserFullName(r.getUser_id());
                                String originalDateString = r.getOrder_date();
                                Date date = java.sql.Timestamp.valueOf(originalDateString);
                                if (r.getStatus().equals("Confirmed") || r.getStatus().equals("Shipping")) {
                            %>
                                <div><%= r.getOrder_id() %> </div>
                                <div><%= fullname %> </div>
                                <div><%= sdf.format(date) %> </div>
                                <div> <%= r.getTotal_price() %> </div>
                                <div> 
                                <%
                                     if(r.getStatus().equals("Shipping")) {
                                        shippingCount++;
                                 %>
                                <div>
                                     <div class="badge on-deliver"><%= r.getStatus()%></div>
                                </div>
                                 <%
                                     } else {
                                 %>
                                <div>
                                     <div class="badge"><%= r.getStatus()%></div>
                                </div>
                                <%
                                    }
                                %>
                                </div>
                                <div>
                                         <button class="icon" onclick="redirectToUpdate(<%= r.getOrder_id() %>)">
                                             <i class="bi bi-gear"></i>
                                         </button>
                                 </div>
                            <% 
                                }
                            }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        <script>
            function redirectToUpdate(orderId) {
                window.location.href = 'PrepareGoodInfo.jsp?orderId=' + orderId;
            }
        </script>
    </body>
</html>
