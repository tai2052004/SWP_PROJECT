<%-- 
    Document   : CheckOut
    Created on : Sep 25, 2024, 10:01:16 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/CheckOut.css"/>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body>
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
        <div>
        <p class="title"> CHECK OUT </p>  
        <div class="form-container">
            <div class="form-group">
                <p class="detail">PERSONAL DETAILS</p>

                <div>
                    <input type="text" id="fullname" name="fullname"  placeholder="Full Name">
                </div>
            </div>
            <div class="form-group-inline">
                <div>
                    <input class="inputEmail" type="email" id="email" name="email" placeholder="Email">
                </div>

                <div>
                    <div class="phone-input">
                        <select id="country-code" name="country-code">
                            <option value="+84">+84</option>
                            <option value="+1">+1</option>
                            <option value="+44">+44</option>
                        </select>
                        <input type="text" id="phone" name="phone" placeholder="Phone Number">
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div>
            <p class="detail">SHIPPING DETAILS</p>
            </div>
            <div>
            <input type="text" id="fullname" name="fullname"  placeholder="Address">
            </div>
        </div>
        </div>
        
         <div class="order-container">
    <h2>Your Order</h2>
    <div class="order-header">
        <div>Product</div>
        <div>Price</div>
        <div>Quantity</div>
        <div>Subtotal</div>
    </div>

    <!-- Item 1 -->
    <div class="order-item">
        <div class="product">
            <img src="img/new-balance-530.png" alt="New Balance 530 - Dark Olivine" />
            <div>
                <p>New Balance 530 - Dark Olivine</p>
                <p>Size: 40</p>
            </div>
        </div>
        <div>2.050.000</div>
        <div>1</div>
        <div>2.050.000</div>
    </div>

    <!-- Item 2 -->
    <div class="order-item">
        <div class="product">
            <img src="img/reebok-club-c.png" alt="Reebok Club C Revenge - Pink Clay" />
            <div>
                <p>Reebok Club C Revenge - Pink Clay</p>
                <p>Size: 38</p>
            </div>
        </div>
        <div>2.350.000</div>
        <div>2</div>
        <div>4.100.000</div>
    </div>

    <!-- Order summary -->
    <div class="order-summary">
        <div></div>
        <div></div>
        <div>Subtotal</div>
        <div>6.150.000</div>

        <div></div>
        <div></div>
        <div>Discount</div>
        <div>0.0</div>

        <div></div>
        <div></div>
        <div>Total</div>
        <div>6.150.000</div>
    </div>

    <!-- Confirm button -->
    <button class="confirm-button">Confirm</button>
</div>

    </body>
</html>
