<%-- 
    Document   : TrackMyOrder
    Created on : Oct 22, 2024, 3:43:24 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hesh Shoes</title>
    <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="CSS/TrackMyOrder.css?v=1.0.1"/>
  
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
                <div class="logout dropdown">
                    <a href="" class="dropdown-toggle"><i class="bi bi-list"></i><i class="bi bi-person-fill"></i>Logout</a>
                    <div class="dropdown-menu">
                        <a href="ManageProfile.jsp">My profile</a>
                        <a href="TrackMyOrder.jsp">Track my order</a>
                        <a href="#">Favorite Items</a>
                    </div>
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
        <div class="status-bar">
            <button class="status-btn" data-status="pending">Pending</button>
            <button class="status-btn active" data-status="on-shipping">On shipping</button>
            <button class="status-btn" data-status="arrived">Arrived</button>
            <button class="status-btn" data-status="canceled">Canceled</button>
        </div>

        <div id="order-grid" class="order-grid">
            <div class="order-card" data-status="on-shipping">
                <div class="order-header">
                    <div class="order-id">
                        <span>OrderID</span>
                        <strong>#123</strong>
                    </div>
                    <div class="order-date">VN, 17 Sep 2024</div>
                    <div class="order-status">On Deliver</div>
                </div>
                <div class="shipping-info">
                    <div class="from">
                        <i class="bi bi-truck"></i>
                        <span>Da Nang, VietNam</span>
                    </div>
                    <div class="shipping-arrow">•••••••••&gt;</div>
                    <div class="to">
                        <i class="bi bi-geo-alt"></i>
                        <span>Ho Chi Minh, VietNam</span>
                    </div>
                </div>
                <div class="products">
                    <div class="product">
                        <img src="img/shoes_4.png" alt="Nike Full Force Low">
                        <div class="product-details">
                            <h3>Nike Full Force Low - Black / Fire Red</h3>
                            <p class="price">2.190.000 x1</p>
                            <p class="size">Size: 41</p>
                        </div>
                    </div>
                    <div class="product">
                        <img src="img/shoes_3.png" alt="Jordan 1 Low Alternate Royal Toe">
                        <div class="product-details">
                            <h3>Jordan 1 Low Alternate Royal Toe</h3>
                            <p class="price">1.550.000 x2</p>
                            <p class="size">Size: 42</p>
                        </div>
                    </div>
                </div>
                <div class="order-footer">
                    <div class="total-price">5.290.000</div>
                    <button class="details-button">Details</button>
                </div>
            </div>
            <div class="order-card" data-status="on-shipping">
                <div class="order-header">
                    <div class="order-id">
                        <span>OrderID</span>
                        <strong>#123</strong>
                    </div>
                    <div class="order-date">VN, 17 Sep 2024</div>
                    <div class="order-status">On Deliver</div>
                </div>
                <div class="shipping-info">
                    <div class="from">
                        <i class="bi bi-truck"></i>
                        <span>Da Nang, VietNam</span>
                    </div>
                    <div class="shipping-arrow">•••••••••&gt;</div>
                    <div class="to">
                        <i class="bi bi-geo-alt"></i>
                        <span>Ho Chi Minh, VietNam</span>
                    </div>
                </div>
                <div class="products">
                    <div class="product">
                        <img src="img/shoes_4.png" alt="Nike Full Force Low">
                        <div class="product-details">
                            <h3>Nike Full Force Low - Black / Fire Red</h3>
                            <p class="price">2.190.000 x1</p>
                            <p class="size">Size: 41</p>
                        </div>
                    </div>
                    <div class="product">
                        <img src="img/shoes_3.png" alt="Jordan 1 Low Alternate Royal Toe">
                        <div class="product-details">
                            <h3>Jordan 1 Low Alternate Royal Toe</h3>
                            <p class="price">1.550.000 x2</p>
                            <p class="size">Size: 42</p>
                        </div>
                    </div>
                </div>
                <div class="order-footer">
                    <div class="total-price">5.290.000</div>
                    <button class="details-button">Details</button>
                </div>
            </div>
            <div class="order-card" data-status="on-shipping">
                <div class="order-header">
                    <div class="order-id">
                        <span>OrderID</span>
                        <strong>#123</strong>
                    </div>
                    <div class="order-date">VN, 17 Sep 2024</div>
                    <div class="order-status">On Deliver</div>
                </div>
                <div class="shipping-info">
                    <div class="from">
                        <i class="bi bi-truck"></i>
                        <span>Da Nang, VietNam</span>
                    </div>
                    <div class="shipping-arrow">•••••••••&gt;</div>
                    <div class="to">
                        <i class="bi bi-geo-alt"></i>
                        <span>Ho Chi Minh, VietNam</span>
                    </div>
                </div>
                <div class="products">
                    <div class="product">
                        <img src="img/shoes_4.png" alt="Nike Full Force Low">
                        <div class="product-details">
                            <h3>Nike Full Force Low - Black / Fire Red</h3>
                            <p class="price">2.190.000 x1</p>
                            <p class="size">Size: 41</p>
                        </div>
                    </div>
                    <div class="product">
                        <img src="img/shoes_3.png" alt="Jordan 1 Low Alternate Royal Toe">
                        <div class="product-details">
                            <h3>Jordan 1 Low Alternate Royal Toe</h3>
                            <p class="price">1.550.000 x2</p>
                            <p class="size">Size: 42</p>
                        </div>
                    </div>
                </div>
                <div class="order-footer">
                    <div class="total-price">5.290.000</div>
                    <button class="details-button">Details</button>
                </div>
            </div>
            <div class="order-card" data-status="on-shipping">
                <div class="order-header">
                    <div class="order-id">
                        <span>OrderID</span>
                        <strong>#123</strong>
                    </div>
                    <div class="order-date">VN, 17 Sep 2024</div>
                    <div class="order-status">On Deliver</div>
                </div>
                <div class="shipping-info">
                    <div class="from">
                        <i class="bi bi-truck"></i>
                        <span>Da Nang, VietNam</span>
                    </div>
                    <div class="shipping-arrow">•••••••••&gt;</div>
                    <div class="to">
                        <i class="bi bi-geo-alt"></i>
                        <span>Ho Chi Minh, VietNam</span>
                    </div>
                </div>
                <div class="products">
                    <div class="product">
                        <img src="img/shoes_4.png" alt="Nike Full Force Low">
                        <div class="product-details">
                            <h3>Nike Full Force Low - Black / Fire Red</h3>
                            <p class="price">2.190.000 x1</p>
                            <p class="size">Size: 41</p>
                        </div>
                    </div>
                    <div class="product">
                        <img src="img/shoes_3.png" alt="Jordan 1 Low Alternate Royal Toe">
                        <div class="product-details">
                            <h3>Jordan 1 Low Alternate Royal Toe</h3>
                            <p class="price">1.550.000 x2</p>
                            <p class="size">Size: 42</p>
                        </div>
                    </div>
                </div>
                <div class="order-footer">
                    <div class="total-price">5.290.000</div>
                    <button class="details-button">Details</button>
                </div>
            </div>
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
    <script src="js/TrackMyOrder.js"></script>
</body>
</html>
