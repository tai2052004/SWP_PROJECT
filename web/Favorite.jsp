<%-- 
    Document   : Search
    Created on : Oct 21, 2024, 2:03:33 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.* , dao.*, java.util.*" %> 
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<%

    User user = (User) session.getAttribute("user");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Favorite Shoes</title>
    <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/Favorite.css?v=1.0.1"/>
  
</head>
<body>

    <header>
        
        <div class="row header">
            <div class="col-md-3 logo">
                <img src="img/logo1.png">
            </div>

            <div class="col-md-6 menu">
                <a href="landingPage.jsp" class="menuText">HOME</a>
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

    <main class="container-fluid">
        <h2>My Favorite Products</h2>
        <p>Has 5    products</p>
     
        <div class="product-grid">
        <%
            int id = user.getUser_id();
            List<Product> product = ProductDB.getProductByFavourite(id);
            for(Product products : product) {
        %>
           <div class="product-card" onclick="chooseProduct(<%= products.getProductID() %>)" style="cursor: pointer;">
                <i class="bi bi-heart-fill favorite-icon"></i>
                <img src="<%= products.getImg_url()%>" alt="<%= products.getProductName()%>">
                <h3><%= products.getProductName()%></h3>
                <p class="price"><%= products.getPrice()%></p>
                <i class="bi bi-cart3 cart-icon"></i>
           </div>  
        <%
            }
        %>
        </div>
        <form id="productSelectionForm" action="ProductDetailServlet" method="GET">
            <input type="hidden" id="selectedProduct" name="productId" value="">
        </form>
       
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
    <script>
        function chooseProduct(productId) {
            document.getElementById('selectedProduct').value = productId;
            document.getElementById('productSelectionForm').submit();
        }
    </script>
</body>
</html>