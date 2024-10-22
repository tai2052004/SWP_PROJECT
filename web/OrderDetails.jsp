<%-- 
    Document   : OrderDetails
    Created on : Oct 2, 2024, 9:52:55 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nike Full Force Low</title>
    <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/OrderDetails.css?v=1.0.1"/>
  
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

    <div class="order-header">
        <a href="" class="return-btn">
            <i class="bi bi-arrow-return-left"></i>Return
        </a>
        <h1>Order Details</h1>
    </div>
    <div class="order-card">
        <div class="order-id">
            <h2>OrderID: #123</h2>
        </div>
        <div class="order-info">
            <span class="order-info-first">Information Address:</span>
            <span>Tran Ngoc Thien - 0702411147</span><br>
            <span>Address: 12 My Da Tay 8, Khue My, Ngu Hanh Son, Da Nang, Viet Nam</span>
        </div>
        <div class="order-status">
            <p><strong>Order status:</strong> <span class="status-pending">Pending</span></p>
            <p><strong>Date order:</strong> 13-09-2024</p>
        </div>
        <div class="product-info">
            <img src="img/shoes_4.png" alt="Nike Full Force Low" class="product-img">
            <div class="product-details">
                <h3>Nike Full Force Low - Black / Fire Red</h3>
                <p class="price">2.190.000</p>
            </div>
        </div>
        <table class="order-summary">
            <tr>
                <td class="text-left">Total cost of goods</td>
                <td class="text-right">2.190.000</td>
            </tr>
            <tr>
                <td class="text-left">Shipping fee</td>
                <td class="text-right">30.000</td>
            </tr>
            <tr>
                <td class="text-left">Discount on shipping fees</td>
                <td class="text-right">-100.000</td>
            </tr>
            <tr>
                <td class="text-left">Voucher from Shop</td>
                <td class="text-right">-30.000</td>
            </tr>
            <tr>
                <td class="text-left">Total price</td>
                <td class="text-right">2.090.000</td>
            </tr>
            <tr>
                <td class="text-left">Payment Method</td>
                <td class="text-right">Payment upon receipt</td>
            </tr>
        </table>
        <button id="cancelOrderBtn" class="cancel-btn">Cancel order</button>
    </div>

    
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