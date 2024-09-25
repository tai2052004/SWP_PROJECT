<%-- 
    Document   : LandingPage
    Created on : Sep 25, 2024, 9:44:42 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hesh Shoes</title>
     <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="css/LandingPage.css"/>
     <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<header>
    
     <div class="header">
            <div class="logo">
                <img src="img/Logo.png" alt="alt"/>
                <p>HESH</p>
            </div>
            <div class="header-button">
                <p>HOME</p>
                <p>SHOP</p>
                <p>SALES</p>
                <p>CONTACT</p>
            </div>
            <div class="header-avatar">
                <div class="cart">
                    <i class="bi bi-cart-fill fs-3 text-primary"></i> 
                </div> 
                <div class="avatar">
                    <img src="img/avatar.png" alt="avatar" />
                </div>                  
            </div>
        </div>
</header>

<section class="hero-section">
    <h1>MAKE YOUR STYLE</h1>
    <img src="shoe-image.png" alt="Nike Full Force Low">
    <p>Nike Full Force Low</p>
    <p class="price">2,190,000</p>
    <button>Buy now</button>
</section>

<section class="lastest-products">
    <h2>LASTEST PRODUCTS</h2>
    <div class="product-list">
        <div class="product-item">
            <img src="product1.png" alt="Reebok Club C">
            <p class="product-name">Reebok Club C Revenge - Pink Clay</p>
            <p class="price">2,350,000</p>
            <button class="add-to-cart">Add to cart</button>
        </div>
        <div class="product-item">
            <img src="product2.png" alt="Nike Air Max 270">
            <p class="product-name">Nike Air Max 270 - Midnight Navy</p>
            <p class="price">1,930,000</p>
            <button class="add-to-cart">Add to cart</button>
        </div>
        <div class="product-item">
            <img src="product3.png" alt="New Balance 530">
            <p class="product-name">New Balance 530 - Dark Olive</p>
            <p class="price">2,050,000</p>
            <button class="add-to-cart">Add to cart</button>
        </div>
    </div>
    <button>View all products</button>
</section>

<footer>
    <p>HESH (Heaven Shoes) is your top choice for stylish, high-quality footwear.</p>
    <div>
        <a href="#">Information</a>
        <a href="#">Contact us</a>
    </div>
</footer>

</body>
</html>
