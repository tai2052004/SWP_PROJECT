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
    String maxPriceParam = request.getParameter("maxPrice");
    int maxPrice = (maxPriceParam != null) ? Integer.parseInt(maxPriceParam) : 1000000;
    boolean a = true;
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

        <link rel="stylesheet" href="CSS/AllProduct1.css?v=1.0.1"/>

    </head>
    <body>
        <header>

            <div class="row header">
                <div class="col-md-3 logo">
                    <img src="img/logo1.png">
                </div>

                <div class="col-md-6 menu">
                    <a href="landingPage.jsp" class="menuText">HOME</a>
                    <a href="AllProduct.jsp" class="menuText active">SHOP</a>
                    <a href="#footer" class="menuText">CONTACT</a>
                    <a href="#" class="menuText">CHAT</a>
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
                        <a href="ShoppingCart.jsp"><i class="bi bi-cart"></i></a>
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
                <label><input class="Checkbox" type="checkbox" checked> Nike</label><br>
                <label><input class="Checkbox" type="checkbox" checked> Adidas</label><br>
                <label><input class="Checkbox" type="checkbox" checked> Converse</label><br>

                <h3>Price</h3>
                <form id="priceForm" action="AllProduct.jsp" method="get">
                    <!-- Set the range value dynamically based on the maxPrice parameter -->
                    <input type="range" min="0" max="5000000" value="<%= (maxPriceParam != null) ? maxPrice : 5000000 %>" id="priceRange" name="maxPrice">
                    <span id="priceDisplay"><%= (maxPriceParam != null) ? maxPrice : 5000000 %></span>
                </form>

                <script>
                    document.getElementById('priceRange').addEventListener('input', function () {
                        // Get the current value of the range input
                        var priceValue = this.value;

                        // Update the displayed price
                        document.getElementById('priceDisplay').textContent = '$' + priceValue;

                        // Automatically submit the form when the slider is moved
                        document.getElementById('priceForm').submit();
                    });
                    
                </script>

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
                <div class="sort">
                    <select>
                        <option>New</option>
                        <option>Price ascending</option>
                        <option>Price descending</option>
                        <option>Rating</option>
                    </select>
                </div>

                <!-- Product Cards -->
                <div class="product-grid">

                    <%
                        // Get the maxPrice from the form submission (default to 1000 if not provided)
                         maxPriceParam = request.getParameter("maxPrice");
                         maxPrice = (maxPriceParam != null) ? Integer.parseInt(maxPriceParam) : 1000;

                        // Fetch all products
                        List<Product> products = ProductDB.allListProduct();

                        // Filter products that are less than or equal to the maxPrice
                        List<Product> filteredProducts = new ArrayList<>();
                        for (Product p : products) {
                            if (p.getPrice() <= maxPrice) {
                                filteredProducts.add(p);
                                a = false;

                            }                                                  

                        }
                    %>
                    <% 
            // Display the filtered products
            if(a){
            for (Product product1 : products) {
                    %>
                    <div class='product-card' onclick='chooseProduct(<%= product1.getProductID() %>)' style="cursor: pointer;">
                        <img src="<%= product1.getImg_url() %>" alt="<%= product1.getProductName() %>">
                        <h4><%= product1.getProductName() %></h4>
                        <p><%= product1.getPrice() %></p>
                    </div>
                    <% 
                        }
                        
                    }else{
                                    for (Product product2 : filteredProducts) {
                    %>
                    <div class='product-card' onclick='chooseProduct(<%= product2.getProductID() %>)'>
                        <img src="<%= product2.getImg_url() %>" alt="<%= product2.getProductName() %>">
                        <h4><%= product2.getProductName() %></h4>
                        <p>$<%= product2.getPrice() %></p>
                    </div>
                        <%
                            }}

                            %>
                </div>
                <form id="productSelectionForm" action="ProductDetailServlet" method="GET">
                    <input type="hidden" id="selectedProduct" name="productId" value="">
                </form>
                <!-- Pagination -->
                <div id="pagination-buttons"></div>

            </section>
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
        <script src="js/AllProduct.js"></script>

    </body>
    <script>
                    function chooseProduct(productId) {

                        document.getElementById('selectedProduct').value = productId;

                        document.getElementById('productSelectionForm').submit();
                    }
    </script>
</html>
