

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="CSS/AddUser.css?v=1.0.1">
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
    <% 
    if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
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
                    <h2 class="bg-secondary text-white p-2 rounded-top mb-0">Add New User</h2>
                    <form class="p-3 border rounded-bottom" action="AddUserServlet" method="post">
                        <div class="mb-3 row">
                            <label for="username" class="col-sm-3 col-form-label">Username</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="username" name="username"  value="${u}" placeholder="Username" >
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="password" class="col-sm-3 col-form-label">Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="password" name="password" value="${p}" placeholder="Password">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="personalName" class="col-sm-3 col-form-label">Personal name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="personalName" name="fullname" value="${f}" placeholder="Full name">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="email" class="col-sm-3 col-form-label">Email</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="email" name ="email" value="${e}" placeholder="Email">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="phone" class="col-sm-3 col-form-label">Phone number</label>
                            <div class="col-sm-9">
                                <input type="tel" class="form-control" id="phone" name="phone"  value="${p}" placeholder="Phone number">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="address" class="col-sm-3 col-form-label">Address</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="address" name="address" value="${a}" placeholder="Address">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-3 col-form-label">Role</label>
                            <div class="col-sm-9">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="role" id="adminRole" placeholder="admin" value="admin">
                                    <label class="form-check-label" for="adminRole">Admin</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="role" id="warehouseRole" placeholder="warehouse" value="warehouse">
                                    <label class="form-check-label" for="warehouseRole">WareHouse</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="role" id="customerRole" placeholder="customer" value="user">
                                    <label class="form-check-label" for="customerRole">Customer</label>
                                </div>
                            </div>
                        </div>
                        <div class="text-center mt-4">
                            <button type="submit" class="btn btn-success me-2">Confirm add</button>
                            <button type="button" class="btn btn-danger">Cancel Add</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
</body>
</html>
