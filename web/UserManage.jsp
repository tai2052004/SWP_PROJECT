<%-- 
    Document   : UserManage
    Created on : Oct 24, 2024, 2:57:13 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.* , dao.*, java.util.*" %> 
<%
    User user = (User) request.getAttribute("user"); 
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Kavoon&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
    <link href="CSS/styless.css?v=1.0.1" rel="stylesheet" />
    </head>
    <body>
        <% if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
        <div class="alerts">    
            <div class="alert alert-success animated bounceInRight">
                <div class="icon pull-left">
                    <i class="fa fa-check-circle fa-2x"></i>
                </div>
                <div class="copy">
                    <h4>SUCCESS</h4>
                    <p>Add user successful!</p>
                </div>
                <a class="close">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <% }
        %>
        <% 
    if (request.getParameter("successUpdate") != null && request.getParameter("successUpdate").equals("true")) { %>
        <div class="alerts">    
            <div class="alert alert-success animated bounceInRight">
                <div class="icon pull-left">
                    <i class="fa fa-check-circle fa-2x"></i>
                </div>
                <div class="copy">
                    <h4>SUCCESS</h4>
                    <p>Update User successful!</p>
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
            <div  class="logout-button" onclick="window.location.href='LogoutControl'" style="cursor: pointer;">
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
            <div>
                <!-- Main header section -->
                <div class="main-header" style="margin-bottom: 40px;">
                    <span class="title">Users Manage</span>
                </div>

                <!-- Main content with light blue background -->
                <div style="
                    background: white;
                    border-radius: 12px;
                    padding: 20px;
                    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                ">
                    <!-- Search and buttons bar -->
                    <div style="
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 20px;
                    ">
                        <!-- Search section -->
                        <div style="display: flex; align-items: center; gap: 10px;">
                            <span style="font-weight: 500;">Search:</span>
                            <input type="text" placeholder="Enter Here" style="
                                padding: 8px 12px;
                                border: 1px solid #ccc;
                                border-radius: 4px;
                                width: 200px;
                            ">
                            <button style="
                                padding: 8px 16px;
                                border-radius: 4px;
                                border: 1px solid #ccc;
                                background: white;
                                cursor: pointer;
                            ">Search</button>
                        </div>

                        <!-- Sort and Add new buttons -->
                        <div style="display: flex; gap: 16px; align-items: center;">
                            <button style="
                                padding: 8px 16px;
                                border-radius: 4px;
                                border: 1px solid #1d81f3;
                                background: transparent;
                                color: #1d81f3;
                                display: flex;
                                align-items: center;
                                gap: 8px;
                                cursor: pointer;
                            "
                            href="AddUser.jsp">
                                <img src="assets/sort.svg" alt="sort" width="20" height="20">
                                Sort by
                            </button>

                            <button onclick="window.location.href='AddUser.jsp'" style="
                                padding: 8px 16px;
                                border-radius: 4px;
                                background: #1d81f3;
                                color: white;
                                border: none;
                                display: flex;
                                align-items: center;
                                gap: 20px;
                                cursor: pointer;
                            ">
                                + Add new
                            </button>
                        </div>
                    </div>

                    <!-- User table -->
                    <div style="
                        background: white;
                        border-radius: 8px;
                        overflow: hidden;
                    ">
                        <!-- Table header -->
                        <div style="
                            display: grid;
                            grid-template-columns: 80px 200px 250px 150px 150px 100px;
                            gap: 10px;
                            padding: 16px;
                            border-bottom: 1px solid #eee;
                        ">
                            <div style="color: #1d81f3; font-weight: 600;">ID</div>
                            <div style="color: #1d81f3; font-weight: 600;">Name</div>
                            <div style="color: #1d81f3; font-weight: 600;">Email</div>
                            <div style="color: #1d81f3; font-weight: 600;">Phone</div>
                            <div style="color: #1d81f3; font-weight: 600;">Role</div>
                            <div style="color: #1d81f3; font-weight: 600;">Action</div>
                        </div>

                        <!-- Table rows -->
                        <div>
                            <%
                                List<User> user1 = UserDB.listAllUsers();
                                for(User users : user1) {
                            %>
                            <!-- Row 1 -->
                            <div style="
                                display: grid;
                                grid-template-columns: 80px 200px 250px 150px 150px 100px;
                                gap: 10px;
                                padding: 16px;
                                border-bottom: 1px solid #eee;
                            ">
                                <div><%= users.getUser_id()%></div>
                                <div><%= users.getUser_name()%></div>
                                <div><%= users.getUser_email()%></div>
                                <div><%= users.getPhone()%></div>
                                <div><%= users.getUser_role()%></div>
                                <div style="display: flex; gap: 8px;">
                                    <form id="userSelectionForm<%= users.getUser_id() %>" action="UpdateUserServlet" method="GET">
                                        <div style="border: none; background: none; cursor: pointer; text-decoration: none;">
                                            <button type="submit" style="border: none; background: none; cursor: pointer;" onclick="chooseUser(<%= users.getUser_id() %>)"> 
                                                <img src="assets/edit.svg" alt="edit" width="20" height="20">
                                            </button>
                                            <input type="hidden" id="selectedUser<%= users.getUser_id() %>" name="userId" value="">
                                        </div>
                                    </form>
                                    <button style="border: none; background: none; cursor: pointer;">
                                        <img src="assets/delete.svg" alt="delete" width="20" height="20">
                                    </button>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            
                        </div>
                    </div>
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
    <script>
    function chooseUser(userId) {
        document.getElementById('selectedUser' + userId).value = userId;
        document.getElementById('userSelectionForm' + userId).submit();
    }
</script
</html>
