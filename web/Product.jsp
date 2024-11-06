<%-- 
    Document   : Product
    Created on : Sep 29, 2024, 2:29:10 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.* , dao.*, java.util.*" %> 
<%@ page import="java.text.NumberFormat" %>
<%
    Product product = (Product) session.getAttribute("product");
    User user = (User) session.getAttribute("user");
    double discount = Double.parseDouble(product.getDiscount());
    double pricee = product.getPrice() - product.getPrice() * discount / 100;
    String formatPrice3 = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(product.getPrice());
    String formattedPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(pricee);
    int inStock = 0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="CSS/Product4.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>

    <body>
        <%
        String errorMessage = (String) session.getAttribute("error");
        if (errorMessage != null) {
        %>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                Swal.fire({
                    icon: 'error',
                    title: 'ERROR',
                    text: `<%= errorMessage.replace("'", "\\'") %>`,
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {
            <% session.removeAttribute("error"); %>
                    }
                });
            });
        </script>
        <% } %>
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
                    <% if(user == null) {%> 
                    <div class="login">
                        <a href="login.jsp"><i class="bi bi-person-fill"></i>Login</a>
                    </div>
                    <% } else { %>
                    <div class="logout dropdown">
                        <a href="LogoutControl" class="dropdown-toggle"><i class="bi bi-list"></i><i class="bi bi-person-fill"></i>Logout</a>
                        <div class="dropdown-menu">
                            <a href="ManageProfile.jsp">My profile</a>
                            <a href="TrackMyOrder.jsp">Track my order</a>
                            <a href="Favorite.jsp">Favorite Items</a>
                        </div>
                    </div>
                    <% } %>
                    <div class="cart">
                        <a href="ShoppingCart.jsp"><i class="bi bi-cart"></i></a>
                    </div>
                    <div class="search">
                        <i class="bi bi-search"></i>
                    </div>
                </div>
            </div>
        </header>

        <div class="product-container">
            <!-- Product Image Section -->
            <div class="product-image">
                <i style="display: none" class="fas fa-chevron-left arrow-left"></i>
                <i  style="display: none " class="fas fa-chevron-right arrow-right"></i>

                <!-- Heart favorite icon -->
                <i class="far fa-heart favorite-heart"></i>

                <!-- Main Product Image -->
                <img id="productImg" src="<%= product.getImg_url()%>" alt="Product Image">
                <!-- Additional Images -->

            </div>

            <!-- Product Details Section -->
            <div class="product-details">

                <div id="productTitle" class="product-title"><%= product.getProductName()%></div>
                <%
                    if ( discount != 0)
                    {
                %>
                <div style="display: flex;">
                    <div style="display: flex; align-items: center; text-decoration: line-through;"><%= formatPrice3 %></div>
                    <div style="color: #34ce57; font-size: 30px;" id="productPrice" class="product-price"><%= formattedPrice%></div>
                </div>

                <%
                    }
                    else
                    {
                %>
                <div id="productPrice" class="product-price"><%= formatPrice3 %></div>
                <%
                    }
                %>
                <div class="size-container">
                    <!-- Size options -->
                    <p class="size">Size</p>
                    <div class="sizes">
                        <%
                            List<ProductDetail> productDetails = product.getProductDetails();
                            for (ProductDetail detail : productDetails) {
                            inStock = detail.getQuantity();
                            if ( inStock != 0 )
                            {
                        %>
                        <!--                    <button class="size-button active">38</button>-->
                        <button class="size-button"><%= detail.getSize()%></button>
                        <%
                            }
                                else
                                {
                        %>
                        <button type="button" style="background-color: #A5A5A5;"><%= detail.getSize()%></button>
                        <%
                            }
                                }
                        %>
                    </div>
                </div>

                <div class="size-container">
                    <p class="size">Quantity</p>
                    <!-- Quantity Selector -->
                    <div class="product-quantity">
                        <button class="quantity-btn" id="decrease">-</button>
                        <input type="text" id="quantity" value="1" readonly>
                        <button class="quantity-btn" id="increase">+</button>
                    </div>
                </div>


                <div class="product-buttons">                    
                    <input type="hidden" class="selectedSize" name="selectedSize">
                    <input type="hidden" class="selectedQuantity" name="selectedQuantity">

                    <form action="ProductToCartAndPayServlet" method="post">
                        <input type="hidden" class="selectedSize" name="selectedSize">
                        <input type="hidden" class="selectedQuantity" name="selectedQuantity">
                        <input type="hidden" name="action" value="ToCart">
                        <button type="submit" class="add-to-cart">Add to cart</button>
                    </form>

                    <!-- Form 2: Buy now -->
                    <form action="ProductToCartAndPayServlet" method="post">
                        <input type="hidden" class="selectedSize" name="selectedSize">
                        <input type="hidden" class="selectedQuantity" name="selectedQuantity">
                        <input type="hidden" name="action" value="ToPay">
                        <button type="submit" class="buy-now">Buy now</button>
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
        <div class="product-info" style="margin-top: 250px;">
            <div class="review-title">
                <button class="review-button" id="descriptionBtn" class="active">Product Description</button>
                <button class="review-button" id="reviewBtn">Review</button>
            </div>
            <div id="descriptionContent" class="content active">
                <h2 class="title">Product Description</h2>
                <p class="decription"><%= product.getDescription()%></p>
            </div>

            <div id="reviewContent" class="content">
                <form action="AddCommentServlet" method="post"> 
                    <div class="new-review">
                        <h2 class="title">Review</h2>
                        <div class="star-rating">
                            <input type="hidden" name="starRating" id="starRating">
                            <span data-value="1" class="star" onclick="setRating(1)">&#9733;</span>
                            <span data-value="2" class="star" onclick="setRating(2)">&#9733;</span>
                            <span data-value="3" class="star" onclick="setRating(3)">&#9733;</span>
                            <span data-value="4" class="star" onclick="setRating(4)">&#9733;</span>
                            <span data-value="5" class="star" onclick="setRating(5)">&#9733;</span>
                        </div>
                        <textarea name="commentContent" class="decription" placeholder="Leave a comment"></textarea>
                        <button class="submit-button" type="submit">Submit Review</button>
                    </div>
                </form>

                <div class="review-list">
                    <h3>Reviews</h3>
                    <% 
                        ArrayList<Comment> commentList = CommentDB.listAllCommentsByProductID(product.getProductID());  
                        for (Comment com : commentList) {
                    %>
                    <div class="review-item">
                        <div class="user-name"><%= user.getFullname() %></div>
                        <div class="user-rating">
                            <% 
                                int starCount = com.getStar();
                                for (int i = 1; i <= 5; i++) {
                                    String starClass = starCount >= i ? "selected" : "";
                            %>
                            <span class="star <%= starClass %>">&#9733;</span>
                            <% 
                                }
                            %>
                        </div>
                        <div class="user-comment"><%= com.getContent() %> </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

        </div>
    </div>

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
    <h2 id="displayQuantity"></h2>
</body>

<script src="js/Product2.js"></script>

<script>
                                document.querySelector(".add-to-cart").addEventListener("click", function (event) {
                                    var selectedSize = document.querySelector(".selectedSize").value;
                                    if (!selectedSize) {
                                        event.preventDefault(); // Ngăn chặn việc gửi form
                                        Swal.fire({
                                            icon: 'warning',
                                            title: 'Oops...',
                                            text: 'Please choose size before add to cart!',
                                            confirmButtonText: 'Chọn size'
                                        });
                                    }
                                });

                                document.querySelector(".buy-now").addEventListener("click", function (event) {
                                    var selectedSize = document.querySelector(".selectedSize").value;
                                    if (!selectedSize) {
                                        event.preventDefault(); // Ngăn chặn việc gửi form
                                        Swal.fire({
                                            icon: 'warning',
                                            title: 'Oops...',
                                            text: 'Please choose size before check out!',
                                            confirmButtonText: 'Chọn size'
                                        });
                                    }
                                });

                                function setRating(value) {
                                    document.getElementById("starRating").value = value;
                                }
                                
                                
</script>
</html>
