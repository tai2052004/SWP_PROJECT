<%-- 
    Document   : AllProduct
    Created on : Sep 28, 2024, 3:31:37 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.* , dao.*, java.util.*" %> 
<%@ page import="java.text.NumberFormat" %>
<%
    User user = (User) session.getAttribute("user"); 
    Product product = (Product) request.getAttribute("product");
    String maxPriceParam = request.getParameter("maxPrice");
    String[] selectedBrands = request.getParameterValues("brand");
    int maxPrice = (maxPriceParam != null) ? Integer.parseInt(maxPriceParam) : 5000000;
    boolean a = true;
    List<Product> products = ProductDB.allListProduct();
    String sortOrder = request.getParameter("sortOrder");
    // Existing code to retrieve the search term, brands, price range, and sort order
    String searchTerm = request.getParameter("search");
    // Filter products based on maxPrice and selected brands
    List<Product> filteredProducts = new ArrayList<>();
    for (Product p : products) {
        boolean withinPriceRange = p.getPrice() <= maxPrice;
        boolean matchesBrand = (selectedBrands == null) || Arrays.asList(selectedBrands).contains(p.getBrand());
        boolean matchesSearch = (searchTerm == null || searchTerm.isEmpty()) || p.getProductName().toLowerCase().contains(searchTerm.toLowerCase());

        // Add to filtered list if it meets all conditions
        if (withinPriceRange && matchesBrand && matchesSearch) {
            filteredProducts.add(p);
        }
    }

    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

        <link rel="stylesheet" href="CSS/AllProduct3.css?v=1.0.1"/>

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

        <div class="Search">
            <form action="AllProduct.jsp" method="get">
                <div class="search-container">
                    <input type="text" placeholder="Search" name="search" value="<%= searchTerm != null ? searchTerm : "" %>">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </div>
            </form>
        </div>
        <!-- Filters and Product Listing -->
        <div class="container">

            <!-- Filters Section -->
            <aside class="filters">
                <h3>Keywords</h3>
                <form id="filterForm" action="AllProduct.jsp" method="get">
                    <!-- Include both brand checkboxes and price slider inside the same form -->
                    <label><input class="Checkbox" type="checkbox" name="brand" value="Nike" <% if (request.getParameterValues("brand") != null && Arrays.asList(request.getParameterValues("brand")).contains("Nike")) { %> checked <% } %> onclick="submitFilter()"> Nike</label><br>
                    <label><input class="Checkbox" type="checkbox" name="brand" value="Adidas" <% if (request.getParameterValues("brand") != null && Arrays.asList(request.getParameterValues("brand")).contains("Adidas")) { %> checked <% } %> onclick="submitFilter()"> Adidas</label><br>
                    <label><input class="Checkbox" type="checkbox" name="brand" value="Converse" <% if (request.getParameterValues("brand") != null && Arrays.asList(request.getParameterValues("brand")).contains("Converse")) { %> checked <% } %> onclick="submitFilter()"> Converse</label><br>
                    <label><input class="Checkbox" type="checkbox" name="brand" value="Puma" <% if (request.getParameterValues("brand") != null && Arrays.asList(request.getParameterValues("brand")).contains("Puma")) { %> checked <% } %> onclick="submitFilter()"> Puma</label><br>
                    <label><input class="Checkbox" type="checkbox" name="brand" value="New Balance" <% if (request.getParameterValues("brand") != null && Arrays.asList(request.getParameterValues("brand")).contains("New Balance")) { %> checked <% } %> onclick="submitFilter()"> New Balance</label><br>
                    <label><input class="Checkbox" type="checkbox" name="brand" value="Reebok" <% if (request.getParameterValues("brand") != null && Arrays.asList(request.getParameterValues("brand")).contains("Reebok")) { %> checked <% } %> onclick="submitFilter()"> Reebok</label><br>

                    <!-- Repeat for other brands as needed -->

                    <h3>Price</h3>
                    <input type="range" min="0" max="5000000" value="<%= maxPrice %>" id="priceRange" name="maxPrice" oninput="updatePrice(this.value)">
                    <span id="priceDisplay"><%= maxPrice %> d</span>
                </form>

                <script>



                    function submitFilter() {
                        document.getElementById("filterForm").submit();
                    }

                    function updatePrice(value) {
                        document.getElementById("priceDisplay").textContent = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
                        submitFilter();
                    }
                </script>



                <h3>Size</h3>
                <label><input class="Checkbox" type="checkbox" checked> 41</label><br>
                <label><input class="Checkbox" type="checkbox" checked> 42</label><br>
                <label><input class="Checkbox" type="checkbox" checked> 43</label><br>
            </aside>

            <!-- Product Listing Section -->
            <section class="products">
                <div class="sort">
                    <form action="AllProduct.jsp" method="get">
                        <select name="sortOrder" onchange="this.form.submit()">                          
                            <option value="new" <%= "new".equals(sortOrder) ? "selected" : "" %>>New</option>
                            <option value="priceAsc" <%= "priceAsc".equals(sortOrder) ? "selected" : "" %>>Price ascending</option>
                            <option value="priceDesc" <%= "priceDesc".equals(sortOrder) ? "selected" : "" %>>Price descending</option>
                        </select>
                        <input type="hidden" name="search" value="<%= searchTerm != null ? searchTerm : "" %>">
                    </form>
                </div>

                <div class="product-grid">
                    <% 
                        if (filteredProducts.isEmpty()) { 
                    %>
                    <p>No products found matching the specified criteria.</p>
                    <% 
                        } else {
                            if (sortOrder != null) {
                                if (sortOrder.equals("new")) {
                                    filteredProducts.sort(Comparator.comparingInt(Product::getProductID).reversed());
                                } else if (sortOrder.equals("priceAsc")) {
                                    filteredProducts.sort(Comparator.comparingDouble(Product::getPrice));
                                } else if (sortOrder.equals("priceDesc")) {
                                    filteredProducts.sort(Comparator.comparingDouble(Product::getPrice).reversed());
                                }
                            }
                            for (Product product2 : filteredProducts) { 
                                double price = product2.getPrice();
                                String formattedPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(price);
                                double discount = Double.parseDouble(product2.getDiscount());
                                boolean hasDiscount = (discount != 0);
                                String finalPrice = hasDiscount ? 
                                    NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(price - price * discount / 100) : formattedPrice;
                    %>
                    <div class='product-card' onclick='chooseProduct(<%= product2.getProductID() %>)' style="cursor: pointer;">
                        <% if (hasDiscount) { %>
                        <div class="discount"><%= discount %>%</div>
                        <% } %>
                        <img src="<%= product2.getImg_url() %>" alt="<%= product2.getProductName() %>">
                        <h4><%= product2.getProductName() %></h4>
                        <div class="merge-price">
                            <% if (hasDiscount) { %>
                            <p style="font-size: 15px; text-decoration-line: line-through;"><%= formattedPrice %></p>
                            <% } %>
                            <p><%= finalPrice %></p>
                        </div>
                    </div>
                    <% 
                            } 
                        }
                    %>
                </div>
            </section>
            <!-- Hidden form for product selection -->
            <form id="productSelectionForm" action="ProductDetailServlet" method="GET">
                <input type="hidden" id="selectedProduct" name="productId" value="">
            </form>
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