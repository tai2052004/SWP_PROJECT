<%-- 
    Document   : AllProduct
    Created on : Sep 28, 2024, 3:31:37 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.* , dao.*, java.util.*" %> 
<%
    User user = (User) session.getAttribute("user"); 
    Product product = (Product) request.getAttribute("product");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

        <link rel="stylesheet" href="CSS/AllProduct1.css"/>

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
                <% if(user == null) {%> 
                    <div class="login">
                        <a href="login.jsp"><i class="bi bi-person-fill"></i>Login</a>
                    </div>
                <% } else { %>
                    <div class="logout dropdown">
                        <a href="LogoutControl" class="dropdown-toggle"><i class="bi bi-list"></i><i class="bi bi-person-fill"></i>Logout</a>
                        <div class="dropdown-menu">
                            <a href="ManageProfile.jsp">My profile</a>
                            <a href="/TrackMyOrder.jsp">Track my order</a>
                            <a href="/favorites">Favorite Items</a>
                        </div>
                    </div>
                <% } %>
                <div class="cart">
                    <a href=""><i class="bi bi-cart"></i></a>
                </div>
                <div class="search">
                    <i class="bi bi-search"></i>
                </div>
            </div>
        </div>
    </header>

        <div class="Search">
            <form action="SearchProductServlet" method="post">
                <div class="search-container">
                    <input type="text" placeholder="Search" name="search" value="${s}">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </div>
            </form>
        </div>
        <!-- Filters and Product Listing -->
        <div class="container">

            <!-- Filters Section -->
            <aside class="filters">
                <h3>Keywords</h3>
                <label><input class="Checkbox" class="Checkbox" type="checkbox" checked> Nike</label><br>
                <label><input class="Checkbox" type="checkbox" checked> Adidas</label><br>
                <label><input class="Checkbox" type="checkbox" checked> Converse</label><br>

                <h3>Price</h3>
                <input  type="range" min="0" max="100" value="50"><span>$0-100</span>

                <h3>Color</h3>
                <label><input class="Checkbox" type="checkbox" checked> Yellow</label><br>
                <label><input  class="Checkbox" type="checkbox" checked> Red</label><br>
                <label><input class="Checkbox" type="checkbox" checked> White</label><br>

                <h3>Size</h3>
                <label><input class="Checkbox" type="checkbox" checked> 41</label><br>
                <label><input class="Checkbox" type="checkbox" checked> 42</label><br>
                <label><input class="Checkbox" type="checkbox" checked> 43</label><br>
            </aside>

            <!-- Product Listing Section -->
            <section class="products">
                <!-- Sorting and Filters Row -->
                <div class="sorting">
                    <button>New</button>
                    <button>Price ascending</button>
                    <button>Price descending</button>
                    <button>Rating</button>
                </div>

                <!-- Product Cards -->
                <div class="product-grid">
                    
                    <% 
                        List<Product> products = ProductDB.allListProduct();
                        for(Product product1 : products) {
                    %>
                        <div class='product-card' onclick='chooseProduct(<%= product1.getProductID() %>)'>
                            <img src="<%= product1.getImg_url() %>" alt="<%= product1.getProductName() %>">
                            <h4><%= product1.getProductName() %></h4>
                            <p><%= product1.getPrice() %></p>
                        </div>
                    <% 
                        }
                    %>
                </div>
                <form id="productSelectionForm" action="ProductDetailServlet" method="GET">
                    <input type="hidden" id="selectedProduct" name="productId" value="">
                </form>
                <!-- Pagination -->
                <div id="pagination-buttons"></div>

            </section>
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
                    <script src="js/AllProduct.js"></script>

    </body>
    <script>
function chooseProduct(productId) {

    document.getElementById('selectedProduct').value = productId;

    document.getElementById('productSelectionForm').submit();
}
</script>
</html>
