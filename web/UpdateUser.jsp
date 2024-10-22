<%-- 
    Document   : UpdateUser
    Created on : Sep 30, 2024, 2:56:52 PM
    Author     : ngoct
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.User , dao.UserDB" %> 
<%
    User user = (User) session.getAttribute("user");
    int id = user.getUser_id();
    String email = user.getUser_email();
    String phone = user.getPhone(); 
    if(phone == null) {
    phone ="";
    }
    String gender = user.getGender();
    String fulln= user.getFullname();
    if(fulln == null) {
    fulln = "";
    }
    String dob = user.getDob();
    String address= user.getAddress();
    if(address == null) {
    address = "";
    }
    String role = user.getUser_role();
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/updateuser.css?v=1.0.1">
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
                    <p>Update user fail!.</p>
                </div>
                <a class="close">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <% }
        %>    
    <% 
    if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
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
    <div class="container-fluid">
        <div class="row">
            <nav id="sidebar" class="col-md-3 col-lg-2 d-md-block bg-dark sidebar">
                <div class="position-sticky py-5">
                    
                    <div class="admin-info p-3 d-flex flex-column">
                        <i class="bi bi-shield-fill text-light fs-1"></i>
                        <span class="text-light ms-2 fs-4 fw-bold">Administrator.</span> <!-- Sử dụng fs-3 cho chữ to hơn -->
                    </div>
                    
                    
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">
                                <i class="bi bi-speedometer2"></i>
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">
                                <i class="bi bi-cart"></i>
                                Orders Manage
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">
                                <i class="bi bi-graph-up"></i>
                                Sales Statistics
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">
                                <i class="bi bi-people"></i>
                                Users Manage
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">
                                <i class="bi bi-tag"></i>
                                Coupon Manage
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            <header class="d-flex justify-content-between align-items-center py-3 bg-dark ">
                <div class="logo-container">
                    <img src="logo.png" alt="Hesh Logo" class="img-fluid">
                    <span class="text-light fs-4">Hesh</span>
                </div>
                
                <div class="breadcrumb-nav d-flex align-items-center">
                   
                    <a href="#" class="text-decoration-none text-light px-4"><i class="bi bi-arrow-left"></i></a>
                    <a href="#" class="text-decoration-none text-light mx-2"><i class="bi bi-house-door"></i> HOME</a>
                    <span class="text-light px-4">&gt;</span>
                    <span class="text-warning">Users Manage</span>
                </div>
                <button class="btn btn-warning ms-auto">Logout <i class="bi bi-box-arrow-right"></i></button>
            </header>
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 ">
                
                <div class="content-area bg-white p-4 rounded">
                    <h2>User Information</h2>
                    <form class="user-form" action="UpdateUserServlet" method="post">
                        <div class="avatar-container">
                            <div class="avatar">
                                <img src="avatar.png" alt="User Avatar">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="id">ID</label>
                            <input type="text" id="id" name="ID" value="<%= id%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" id="fullName" name="fullname" value="<%= fulln%>">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" value="<%= email%>">
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="tel" id="phoneNumber" name="phone" value="<%= phone%>">
                        </div>
                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <select id="gender" name="gender" value="">
<!--                                <option value="male" selected>Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>-->
                                <option value="male" <%= "male".equals(gender) ? "selected" : "" %>>Male</option>
                                <option value="female" <%= "female".equals(gender) ? "selected" : "" %>>Female</option>
                                <option value="other" <%= "other".equals(gender) ? "selected" : "" %>>Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="role">Role</label>
                            <select id="role" name="role" value="">
<!--                                <option value="admin" selected>Admin</option>
                                <option value="warehouse">Warehouse</option>
                                <option value="customer">Customer</option>-->
                                <option value="admin" <%= "admin".equals(role) ? "selected" : "" %>>Admin</option>
                                <option value="warehouse" <%= "warehouse".equals(role) ? "selected" : "" %>>Warehouse</option>
                                <option value="customer" <%= "customer".equals(role) ? "selected" : "" %>>Customer</option>
                            </select>
                        </div>
                        <div class="btn-container">
                            <button type="submit" class="btn btn-success">Save update</button>
                            <button type="button" class="btn btn-danger">Cancel update</button>
                        </div>
                    </form>
                </div>
            
            </main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
