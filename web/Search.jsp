<%-- 
    Document   : Search
    Created on : Oct 21, 2024, 2:03:33 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/Search.css?v=1.0.1"/>
  
</head>
<body>

    <header>
        
        <div class="row header">
            <div class="col-md-3 logo">
                <img src="img/logo1.png">
            </div>

            <div class="col-md-6 menu">
                <a href="" class="menuText">HOME</a>
                <a href="" class="menuText">SHOP</a>
                <a href="#footer" class="menuText">CONTACT</a>
            </div>
            
            <div class="col-md-3 user-actions">
                <div class="login">
                    <a href="login.html"><i class="bi bi-person-fill"></i>Login</a>
                </div>
                <div class="cart">
                    <a href=""><i class="bi bi-cart"></i></a>
                </div>
                <div class="search">
                    <i class="bi bi-search"></i>
                </div>
            </div>
        </div>
    </header>

    <main class="container-fluid">
        <h2>SEARCH</h2>
        <p>Resulted for ""</p>
        <div class="product-grid">

        </div>
        <div class="product-grid">
            <%%>
<!--            <div class="product-card">
                <img src="img/shoes_4.png" alt="Product Name">
                <h3>Nike Full Force Low - Black / Fire Red</h3>
                <p class="price">2.190.000</p>
            </div>-->
            
        </div>
        <div class="page">
            <button><i class="bi bi-arrow-left"></i></button>
            <button class="button-active">1</button>
            <button>2</button>
            <button>3</button>
            <button><i class="bi bi-arrow-right"></i></button>
        </div>
    </main>

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
</html>