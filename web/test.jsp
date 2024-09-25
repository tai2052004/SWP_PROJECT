<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Page</title>
    <link rel="stylesheet" href="css/test.css">
</head>
<body>

    <!-- Navigation Bar -->
    <header>
        <div class="nav-container">
            <div class="logo">
                <img src="hesh-logo.png" alt="Hesh Logo">
                <span>Hesh</span>
            </div>
            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Shop</a></li>
                    <li><a href="#">Sales</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
            <div class="user-options">
                <span>Logout</span>
                <img src="cart-icon.png" alt="Cart Icon">
            </div>
        </div>
    </header>

    <!-- Checkout Form -->
    <div class="checkout-container">
        <h1>Check Out</h1>

        <!-- Personal Details Section -->
        <section class="personal-details">
            <h2>Personal Details</h2>
            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input type="text" id="fullname" placeholder="Nguyen Van A">
            </div>
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" id="email" placeholder="abc@gmail.com">
            </div>
            <div class="form-group">
                <label for="phone">Phone number</label>
                <input type="tel" id="phone" placeholder="+84 702411147">
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" placeholder="12 My Da Tay 8, Da Nang">
            </div>
        </section>

        <!-- Shipping Details Section -->
        <section class="order-details">
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
                    <img src="new-balance-530.png" alt="New Balance 530 - Dark Olivine">
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
                    <img src="reebok-club-c.png" alt="Reebok Club C Revenge - Pink Clay">
                    <div>
                        <p>Reebok Club C Revenge - Pink Clay</p>
                        <p>Size: 38</p>
                    </div>
                </div>
                <div>2.350.000</div>
                <div>2</div>
                <div>4.100.000</div>
            </div>

            <!-- Order Summary -->
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

            <!-- Confirm Button -->
            <button class="confirm-button">Confirm</button>
        </section>
    </div>

    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-about">
                <h3>HESH</h3>
                <p>HESH (Heaven Shoes) is your top choice for stylish, high-quality footwear. We believe the right shoes boost your confidence and comfort, making every step a delight.</p>
            </div>
            <div class="footer-links">
                <h3>Information</h3>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">About Us</a></li>
                </ul>
            </div>
            <div class="footer-contact">
                <h3>Contact Us</h3>
                <p>Phone: +84 123456789</p>
                <p>Email: contact@hesh.com</p>
            </div>
        </div>
    </footer>

</body>
</html>
