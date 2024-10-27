<%-- 
    Document   : UpdateProduct
    Created on : Oct 25, 2024, 11:10:59 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.* , dao.*, java.util.*" %> 
<%
    String productID_string = request.getParameter("productId");
    Product p = null;
    if (productID_string != null) {
        int productID = Integer.parseInt(productID_string);
        p = ProductDB.getProductById(productID);
    }
    int status = p.getStatus();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Kavoon&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link href="CSS/UpdateProduct1.css?v=1.0.1" rel="stylesheet" /> 

    </head>

    <body>
          <% 
    if (request.getParameter("error") != null && request.getParameter("error").equals("fail")) { %>
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
        <div class="header">
            <div>
                <img src="assets/logo.svg" width="77" height="72" style="margin-left: 74px" />
                <img src="assets/logo2.png" width="110" height="27" />
                <a href="WarehouseInventory.jsp"><img src="assets/back-arrow.svg" width="24" height="30" style="margin-left: 27px" /></a>
                <img src="assets/home.svg" width="36" height="36" style="margin-left: 55px" />
                <span class="title" style="margin-left: 25px">HOME</span>
                <img src="assets/forward.svg" width="24" height="35" style="margin-left: 25px" />
                <span class="title accent-text" style="margin-left: 40px">
                    Inventory Manage
                </span>
            </div>
            <div>
                <div class="logout-button">
                    <a href="LogoutControl" class="logout"><span class="title black-text">Logout</span></a>
                    <img src="assets/logout.svg" width="30" height="30" />
                </div>
            </div>
        </div>
        <div class="body">
            <div class="sidebar">
                <div class="sidebar-top">
                    <img src="assets/sidebar-logo.svg" width="76" height="71" />
                    <span>Warehouse.</span>
                </div>
                <div class="sidebar-bottom">
                    <div x-data="{ isOpen: false}" style="width: 100%">
                        <div @click="isOpen= !isOpen" class="sidebar-button">
                            <img src="assets/dashboard.svg" width="36" height="36" style="margin-right: 13px" />
                            <span style="margin-right: auto"> Dashboard </span>
                            <img src="assets/arrow-down.svg" width="24" height="24" style="
                                 margin-right: 13px;
                                 transition: ease 0.2s;
                                 " :class="isOpen && 'is-arrow-down'" />
                        </div>

                        <div class="collapsible" :class="isOpen && 'is-open'" :style="isOpen && {height: '100%'}">
                            <a class="sidebar-button is-active" href="WarehouseInventory.jsp">
                                <img src="assets/Vector.svg" width="36" height="36" style="margin-right: 13px" /> Inventory Manage
                            </a>
                            <a class="sidebar-button" href="Prepare_Good.jsp">
                                <img src="assets/PrepareGood.svg" width="36" height="36" style="margin-right: 13px" /> Prepare Good
                            </a>                          
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="main-header">
                    <span class="title">Update Product</span>
                </div>
                <div class="main">
                    <form action="UpdateProductServlet" method="POST" class="form">
                     <div class="main-image">
                        <% if (p != null) { %>
                            <img src="<%= p.getImg_url() %>">
                        <% } else { %>
                            <img src="default_image.png"> <!-- Fallback image if p is null -->
                        <% } %>
                    </div>
                    <div class="form-container">
                        <div class="form-group">
                            <label for="productName">Product Name</label>
                            <input type="text" id="productName" name="productName" value="<%= p != null ? p.getProductName() : "" %>" required>
                        </div>
                        <div class="form-group">
                            <label for="brand">Brand </label>
                            <input type="text" id="brand" name="brand" value="<%= p != null ? p.getBrand() : "" %>"required>
                        </div>
                        <div class="form-group">
                            <label for="productPrice">Product Price</label>
                            <input type="number" id="productPrice" name="productPrice" value="<%= p != null ? p.getPrice() : "" %>" required>
                        </div>
                        <div class="form-group">
                            <label for="discount">Discount </label>
                            <input type="text" id="discount" name="discount" value="<%= p != null ? p.getDiscount() : "" %>"required>
                        </div>
                        <div class="form-group full-width">
                            <label for="productDescription">Product Description</label>
                            <textarea id="productDescription" name="productDescription" rows="4" required><%= p != null ? p.getDescription() : "" %></textarea>
                        </div>

                        <div class="form-group">
                            <input type="hidden" id="productId" name="productId" value="<%= p != null ? p.getProductID() : "" %>" required>
                        </div>
                </div>
                <div id="sizeQuantityList" class="size-quantity-list">
                    <table>
                        <thead>
                            <tr>
                                <th>Size</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<ProductDetail> listSize = new ArrayList<ProductDetail>();
                                listSize = p.getProductDetails();
                                for (ProductDetail pd : listSize) {
                            %>
                            <tr class="size-quantiy-item">
                                <td><%= pd.getSize() %></td>
                                <td>
                                     <input type="number" name="quantity" value="<%= pd.getQuantity() %>" class="quantity-input" min="0"/>
                                    <input type="hidden" name="size" value="<%= pd.getSize() %>"/>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="form-group">
                    <label for="status">Status </label>
                        <select id="status" name="status">
                            <option value="1" <%= 1 == status ? "selected" : "" %>>Publish</option>
                            <option value="0" <%= 0 == status ? "selected" : "" %>>Unpublish</option>
                        </select>

                </div>
                <div class="form-group">
                    <button type="submit" id="updateButton">Update Product</button>
                </div>
                </form>
                </div>
            </div>
        </div>
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
