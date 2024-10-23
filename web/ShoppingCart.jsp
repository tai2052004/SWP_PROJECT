<%-- 
    Document   : ShoppingCart
    Created on : Oct 21, 2024, 4:45:40 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.User , dao.UserDB, model.OrderDetail" %> 
<%@ page import="java.util.*" %>
<%
        String selectedSize = (String) request.getAttribute("selectedSize");
        String selectedImage = (String) request.getAttribute("selectedImage");
        String productTitle = (String) request.getAttribute("productTitle");
        String priceStr = (String) request.getAttribute("productPrice");
        if (priceStr != null) {  
            priceStr = priceStr.replace(",", ".");
        }
    
        Float productPrice = (priceStr != null) ? Float.parseFloat(priceStr) : null;
        Integer productQuantity = (Integer) request.getAttribute("productQuantity");
        OrderDetail od = new OrderDetail();
        od.setProductName(productTitle);
        od.setPrice(productPrice);
        od.setSize(selectedSize);
        od.setQuantity(productQuantity);
        od.setProductName(productTitle);
        List<OrderDetail> listCart = (List<OrderDetail>) session.getAttribute("listCart");
        listCart.add(od);
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/ShoppingCart.css"/>
  
</head>
<body>

    <header>
        
        <div class="row header">
            <div class="col-md-3 logo">
                <img src="img/logo1.png">
            </div>

            <div class="col-md-6 menu">
                <a href="" class="menuText">HOME</a>
                <a href="" class="menuText active">SHOP</a>
                <a href="#footer" class="menuText">CONTACT</a>
            </div>
            
            <div class="col-md-3 user-actions">
                <div class="logout">
                    <a href=""><i class="bi bi-list"></i><i class="bi bi-person-fill"></i>Logout</a>
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

    <main>
        <h1>YOUR SHOPPING CART</h1>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="product-info">
                        <img src="img/shoes_2.png" alt="New Balance 530">
                        <div>
                            <h3>New Balance 530</h3>
                            <div class="size-selector">
                                <label">Size:</label>
                                <select id="size-nb530">
                                    <option value="38">38</option>
                                    <option value="39">39</option>
                                    <option value="40" selected>40</option>
                                    <option value="41">41</option>
                                    <option value="42">42</option>
                                    <option value="43">43</option>
                                </select>
                            </div>
                        </div>
                    </td>
                    <td>2.050.000</td>
                    <td>
                        <div class="quantity-control">
                            <button>-</button>
                            <input id="quantity1" type="text" value="1">
                            <button>+</button>
                        </div>
                    </td>
                    <td>2.050.000</td>
                </tr>
                <tr>
                    <td class="product-info">
                        <img src="img/shoes_1.png" alt="Reebok Club C Revenge">
                        <div>
                            <h3>Reebok Club C Revenge</h3>
                            <div class="size-selector">
                                <label">Size:</label>
                                <select id="size-reebok">
                                    <option value="38">38</option>
                                    <option value="39">39</option>
                                    <option value="40" selected>40</option>
                                    <option value="41">41</option>
                                    <option value="42">42</option>
                                    <option value="43">43</option>
                                </select>
                            </div>
                        </div>
                    </td>
                    <td>2.350.000</td>
                    <td>
                        <div class="quantity-control">
                            <button>-</button>
                            <input id="quantity2" type="text" value="2">
                            <button>+</button>
                        </div>
                    </td>
                    <td>4.700.000</td>
                </tr>
            </tbody>
        </table>

        <div class="cart-actions">
            <div class="coupon">
                <input id="coupon-id" type="text" placeholder="Coupon code">
                <button>Apply coupon</button>
            </div>
            <button class="update-cart">Update cart</button>
        </div>

        <div class="cart-totals">
            <h2>Cart totals</h2>
            <table>
                <tr>
                    <th>Subtotal</th>
                    <td>6.150.000</td>
                </tr>
                <tr>
                    <th>Discount</th>
                    <td>0.0</td>
                </tr>
                <tr>
                    <th>Total</th>
                    <td>6.150.000</td>
                </tr>
            </table>
            <button class="checkout">Check out</button>
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