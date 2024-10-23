<%-- 
    Document   : Product
    Created on : Sep 29, 2024, 2:29:10 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.* , dao.*, java.util.*" %> 
<%
    Product product = (Product) request.getAttribute("product");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="CSS/Product1.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <title>JSP Page</title>

    </head>
    <body>
        <div class="header">
            <div class="logo">
                <img src="img/Logo.png" alt="alt"/>
                <p>HESH</p>
            </div>
            <div class="header-button">
                <a href="landingPage.jsp"><p>HOME</p></a>
                <a href="AllProduct.jsp"><p>SHOP</p></a>
                <a href=""><p>CONTACT</p></a>
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

        <div class="product-container">
            <!-- Product Image Section -->
            <div class="product-image">
                <!-- Left arrow -->
                <i class="fas fa-chevron-left arrow-left"></i>
                <!-- Right arrow -->
                <i class="fas fa-chevron-right arrow-right"></i>

                <!-- Heart favorite icon -->
                <i class="far fa-heart favorite-heart"></i>

                <!-- Main Product Image -->
                <img id="productImg" src="<%= product.getImg_url()%>" alt="Product Image">
                <!-- Additional Images -->
                <div class="additional-images">
                    <img src="img/giay1.png" alt="Product Thumbnail" class="additional-image active-thumbnail">
                    <img src="img/giay3.png" alt="Product Thumbnail" class="additional-image">
                    <img src="img/giay4.png" alt="Product Thumbnail" class="additional-image">
                </div>
            </div>

            <!-- Product Details Section -->
            <div class="product-details">
                
                <div id="productTitle" class="product-title"><%= product.getProductName()%></div>
                <div id="productPrice" class="product-price"><%= product.getPrice()%></div>

                <!-- Size options -->
                <p class="size">Size</p>
                <div class="sizes">
                    <%
                        List<ProductDetail> productDetails = product.getProductDetails();
                        for (ProductDetail detail : productDetails) {
                    %>
<!--                    <button class="size-button active">38</button>-->
                    <button class="size-button"><%= detail.getSize()%></button>
                    <%
                        }
                    %>
                    
                </div>
                <!-- Color options -->
                <div class="colors">
                    <button class="color-button active" style="background-color: red;"></button>
                    <button class="color-button" style="background-color: blue;"></button>
                    <button class="color-button" style="background-color: pink;"></button>
                </div>

                <!-- Quantity Selector -->
                <div class="product-quantity">
                    <button class="quantity-btn" id="decrease">-</button>
                    <input type="text" id="quantity" value="1" readonly>
                    <button class="quantity-btn" id="increase">+</button>
                </div>
                <div class="product-buttons">                    
                    <input type="hidden" class="selectedSize" name="selectedSize">
                    <input type="hidden" class="selectedImage" name="selectedImage">
                    <input type="hidden" class="productTitleHidden" name="productTitleHidden">
                    <input type="hidden" class="productPriceHidden" name="productPriceHidden">
                    <input type="hidden" class="selectedColor" name="selectedColor">
                    <input type="hidden" class="selectedQuantity" name="selectedQuantity">

                    <form action="ProductToCart" method="post">
                        <input type="hidden" class="selectedSize" name="selectedSize">
                        <input type="hidden" class="selectedImage" name="selectedImage">
                        <input type="hidden" class="productTitleHidden" name="productTitleHidden">
                        <input type="hidden" class="productPriceHidden" name="productPriceHidden">
                        <input type="hidden" class="selectedColor" name="selectedColor">
                        <input type="hidden" class="selectedQuantity" name="selectedQuantity">
                        <input type="hidden" name="action" value="ToCart">
                        <button class="add-to-cart">Add to cart</button>
                    </form>

                    <!-- Form 2: Buy now -->
                    <form action="ProductToCart" method="post">
                        <input type="hidden" class="selectedSize" name="selectedSize">
                        <input type="hidden" class="selectedImage" name="selectedImage">
                        <input type="hidden" class="productTitleHidden" name="productTitleHidden">
                        <input type="hidden" class="productPriceHidden" name="productPriceHidden">
                        <input type="hidden" class="selectedColor" name="selectedColor">
                        <input type="hidden" class="selectedQuantity" name="selectedQuantity">
                        <input type="hidden" name="action" value="ToPay">
                        <button class="buy-now">Buy now</button>
                    </form>

                </div>
            </div>

            <!-- Buttons for Cart and Buy -->

        </div>




    <!-- Product Description Section -->
    <!--        <div class="product-description">
                <div class="description-title">
                    <button>
                        Product description
                    </button>
                    <button> Review</button>
                </div>
                <p>Nike Full Force Low - Black / Fire Red is a great choice for those who love a sporty style. Featuring a striking design with three colors—white, red, and black—the shoe offers an eye-catching and dynamic look. The midsole is made with cushioning technology, providing a soft feel and maximum support for the feet. The outsole is crafted from rubber, offering high durability and excellent grip on various surfaces. This ensures users can move confidently, whether on the streets or the training field. The shoe’s upper is made from synthetic leather, providing durability and a solid feel when worn.</p>
                <div class="foot-img">  <img src="img/giay5.png" alt="Product Image"> </div>
    
            </div>-->
    <div class="product-info">
        <div class="review-title">
            <button class="review-button" id="descriptionBtn" class="active">Product Description</button>
            <button class="review-button" id="reviewBtn">Review</button>
        </div>
        <div id="descriptionContent" class="content active">
            <h2 class="title">Product Description</h2>
            <p class="decription"><%= product.getDescription()%></p>
        </div>

        <div id="reviewContent" class="content">
            <h2 class="title">Review</h2>
            <div class="star-rating">
                <span data-value="1" class="star">&#9733;</span>
                <span data-value="2" class="star">&#9733;</span>
                <span data-value="3" class="star">&#9733;</span>
                <span data-value="4" class="star">&#9733;</span>
                <span data-value="5" class="star">&#9733;</span>
            </div>
            <textarea class="decription" placeholder="Leave a comment"></textarea>
            <button class="submit-button" type="submit">Submit Review</button>
        </div>
    </div>
    <script src="js/Product.js"></script>

    <div class="footer">
        <div class="footer1">
            <p>HESH (Heaven Shoes) is your top choice for stylish, high-quality footwear. We believe the right shoes boost your confidence and comfort, making every step a delight. Explore our diverse, trendy collection to find the perfect fit for your unique style.</p>
        </div>   
        <div class="footer2">
            <div class="footer2-inside-1">
                <div class="infor">
                    <p id="infor-detail">Information<p>
                </div>
                <div class="infor">
                    <p>Email : taidepchai@gmail.com<p>
                </div>
                <div class="infor">
                    <p>Phone : 0123456789<p>
                </div>
                <div class="infor">
                    <p>Addres : do biet o dau<p>
                </div>
            </div>
            <div class="footer2-inside-2">
                <div class="contact">
                    <p>Contact us<p>
                </div>
                <div class="contact-img">
                    <div class="contact-detail">
                        <img src="img/facebook.jpg" />
                    </div>
                    <div class="contact-detail">
                        <img src="img/instagram.jpg" />
                    </div>
                    <div class="contact-detail">
                        <img src="img/tiktok.png" />
                    </div>
                </div>

            </div>

        </div>
    </div>
</body>
</html>
