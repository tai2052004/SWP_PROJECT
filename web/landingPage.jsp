<%-- 
    Document   : landingPage
    Created on : Sep 29, 2024, 10:26:36 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HESH-Shoe Selling Website</title>
    <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/LandingPage.css?v=1.0.1"/>
  
</head>
<body>

    <header>
        
        <div class="row header">
            <div class="col-md-3 logo">
                <img src="img/logo1.png">
            </div>

            <div class="col-md-6 menu">
                <a href="landingPage.jsp" class="menuText active">HOME</a>
                <a href="AllProduct.jsp" class="menuText">SHOP</a>
                <a href="#footer" class="menuText">CONTACT</a>
            </div>
            
            <div class="col-md-3 user-actions">
                <div class="login">
                    <a href="login.jsp"><i class="bi bi-person-fill"></i>Login</a>
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

    <div class="row landing">
        <div class="col-md-4 landing-text">
            <h1>MAKE YOUR</h1>
            <h1>STYLE</h1>
            <button>Buy now</button>
        </div>
        <div class="col-md-8 landing-product">
            <div class="landing-product-image">
                <img id="product-image" src="img/shoes_4.png" alt="">
            </div>
            <div class="landing-product-infor">
                <p id="product-name">Nike Full Force Low</p>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star-fill"></i>
                <i class="bi bi-star"></i>
                <span class="price" id="product-price">2,190,000</span>
            </div>
            <div class="landing-product-change">
                <button class="arrow-left" id="prev-slide">
                    <i class="bi bi-arrow-left"></i>
                </button>
                <button class="arrow-right" id="next-slide">
                    <i class="bi bi-arrow-right"></i>
                </button>
            </div>
        </div>
    </div>

    <section class="lastest-products">
        <h2>LASTEST PRODUCTS</h2>
        <div class="product-list">
            <div class="product-item">
                <div class="star">
                    <i class="bi bi-star"></i>
                    <span>4.8</span>
                    <i class="bi bi-heart"></i>
                </div>
                <img src="img/shoes_1.png" alt="Reebok Club C">
                <p class="product-name">Reebok Club C Revenge</p>
                <p class="price">2,350,000</p>
                <button class="add-to-cart">Add to cart<i class="bi bi-cart4"></i></button>
            </div>
            <div class="product-item">
                <div class="star">
                    <i class="bi bi-star"></i>
                    <span>4.5</span>
                    <i class="bi bi-heart"></i>
                </div>
                <img src="img/shoes_5.png" alt="Nike Air Max 270">
                <p class="product-name">Nike Air Max 270</p>
                <p class="price">1,930,000</p>
                <button class="add-to-cart">Add to cart<i class="bi bi-cart4"></i></button>
            </div>
            <div class="product-item">
                <div class="star">
                    <i class="bi bi-star"></i>
                    <span>4.5</span>
                    <i class="bi bi-heart"></i>
                </div>
                <img src="img/shoes_2.png" alt="New Balance 530">
                <p class="product-name">New Balance 530</p>
                <p class="price">2,050,000</p>
                <button class="add-to-cart">Add to cart<i class="bi bi-cart4"></i></button>
            </div>
        </div>
        <a href="AllProduct.jsp"><button class="all-product">View all products</button></a>
    </section>

    <div class="row info">
        <div class="col-md-6 info-image">
            <img class="ellipse"src="img/Ellipse 2.png" alt="">
            <img class="shoes"src="img/shoes_5.png" alt="">
        </div>
        <div class="col-md-6 info-test">
            <h2>New arrival running shoes for the men <br>and women</h2>
            <span>Discover our latest collection of running shoes for men and women, designed to deliver exceptional performance, comfort, and style. Whether you're a seasoned athlete or just starting out, these shoes will help you achieve your goals with lightweight materials, breathable designs, and perfect support for your feet. </span>
        </div>
    </div>

    <footer class="row footer" id="footer">
        <div class="col-md-4 footer-text">
            <p>HESH (Heaven Shoes) is your top choice for stylish, high-quality footwear. We believe the right shoes boost your confidence and comfort, making every step a delight. Explore our diverse, trendy collection to find the perfect fit for your unique style.</p>
        </div>
        <div class="col-md-4 information">
            <h3>Information</h3>
            <a href="landingPage.jsp">Home</a>
            <a href="AllProduct.jsp">Shop</a>
        </div>
        <div class="col-md-4 contact">
            <h3>Contact us</h3>
            <span><i class="bi bi-telephone"></i>0702411147</span>
            <span><i class="bi bi-geo-alt"></i>12 My Da Tay 8, Khue My, Ngu Hanh Son,<br>Da Nang City</span>
            <span><i class="bi bi-envelope"></i>hesh-shoe-selling@gmail.com</span>
        </div>
    </footer>
    <script src="js/landing_page.js?v=1.0.1"></script>
</body>
</html>

