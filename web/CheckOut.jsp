<%-- 
    Document   : CheckOut
    Created on : Sep 25, 2024, 10:01:16 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.* , dao.*, java.util.*, java.time.LocalDateTime" %> 
<%@page import="model.User , dao.UserDB, model.OrderDetail, model.Product, model.ProductDetail" %> 
<%@ page import="java.text.NumberFormat" %>
<%
    Product p = (Product) session.getAttribute("product");
    List<ProductDetail> liPD = p.getProductDetails();
    String quantity1 = (String) request.getAttribute("productQuantity");
    String size = (String) request.getAttribute("selectedSize");   
    User user = (User) session.getAttribute("user");
    String totalCouponStringObj = (String) session.getAttribute("totalDiscount");
    double subTotal = 0;
    double allTotal = 0;
    String totalCouponString = (totalCouponStringObj != null) ? totalCouponStringObj : "0";
    Coupon coupon = (Coupon) request.getAttribute("coupon");
    Order order = (Order) session.getAttribute("order");
    float feeship = 20;
    order.setFeeship(feeship);
    int flag = 0;
    List<OrderDetail> listOD = (List<OrderDetail>) session.getAttribute("listCart");
           double couponValue = 0;
        if ( coupon != null)
        {
            couponValue = coupon.getDiscountValue();
            order.setCoupon((double)coupon.getCouponId());
        }
        int quantity = 0;
        if ( quantity1 != null )
        {
            quantity = Integer.parseInt(quantity1);
        }     
        int maxCartId = 0;

        if (listOD == null || listOD.isEmpty()) {
            maxCartId = 1;
        } else {
            for (OrderDetail ode : listOD) {
                if (ode.getCart_id() > maxCartId) {
                    maxCartId = ode.getCart_id();  
                }
            maxCartId += 1;
            }
        }
        LocalDateTime now = LocalDateTime.now();
        OrderDetail odet = null;
        OrderDetail od = null;      
        for ( OrderDetail ode : listOD)
        {
            if ( ode.getProduct_id() == p.getProductID())
            {
                if ( size == null)
                {
                    odet = ode;
                }
                else if (ode.getSize().equals(size))
                {
                    ode.setQuantity(ode.getQuantity() + quantity);
                    odet = ode;
                }
            }
        }
        if ( size != null)
        {
            od = new OrderDetail(maxCartId, p.getProductID() ,p.getProductName(), p.getBrand(), p.getPrice(), size, quantity, now);
            od.setTotalPrice(p.getPrice() * quantity);
            od.setImg_url(p.getImg_url());
            od.setProductName(p.getProductName());
            for ( ProductDetail pd : liPD)
            {
                if ( pd.getSize().equals(size))
                {
                    od.setProduct_detail_id(pd.getProductDetailID());
                }
            }
            listOD.add(od);
        }
        
        if ( odet != null && od != null)
        {
            listOD.remove(od);
        }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/CheckOut1.css"/>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
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
                    <div class="logout dropdown">
                        <a href="LogoutControl" class="dropdown-toggle"><i class="bi bi-list"></i><i class="bi bi-person-fill"></i>Logout</a>
                        <div class="dropdown-menu">
                            <a href="ManageProfile.jsp">My profile</a>
                            <a href="/TrackMyOrder.jsp">Track my order</a>
                            <a href="/favorites">Favorite Items</a>
                        </div>
                    </div>
                    <div class="cart">
                        <a href="ShoppingCart.jsp"><i class="bi bi-cart"></i></a>
                    </div>
                    <div class="search">
                        <i class="bi bi-search"></i>
                    </div>
                </div>
            </div>
        </header>
        <div>
            <p class="title"> CHECK OUT </p>  
            <div class="Form">
                <div class="form-container">
                    <div class="form-group">
                        <p class="detail">PERSONAL DETAILS</p>
                        <%
                            if (user.getFullname() != null)
                            {
                        %>    
                        <div>
                            <input class="inputName" type="text" id="fullname" name="fullname"  placeholder="Full Name" value="<%= user.getFullname() %>">
                        </div>
                        <%
                            }
                            else
                            {
                        %>
                        <div>
                            <input class="inputName" type="text" id="fullname" name="fullname"  placeholder="Full Name" value="">
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div class="input-inline" >
                        <div>
                            <%
                                if (user.getUser_email() != null)
                                {
                            %>
                            <input class ="inputEmail" type="email" id="email" name="email" placeholder="Email" cols="20" value="<%= user.getUser_email() %>">
                            <%
                                }
                                else
                                {
                            %>
                            <input class ="inputEmail" type="email" id="email" name="email" placeholder="Email" cols="20" value="">
                            <%
                                }
                            %>
                        </div>

                        <div>
                            <div class="spacenumber">
                                <select class="country-code" id="country-code" name="country-code">
                                    <option value="+84">+84</option>
                                    <option value="+1">+1</option>
                                    <option value="+44">+44</option>
                                </select>
                                <%
                                    if ( user.getPhone() != null)
                                    {
                                %>
                                <input class="inputNumber" type="text" id="phone" name="phone" placeholder="Phone Number" value="<%= user.getPhone() %>">
                                <%
                                    }
                                    else
                                    {
                                %>
                                <input class="inputNumber" type="text" id="phone" name="phone" placeholder="Phone Number" value="">
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div>
                        <p class="detail2">SHIPPING DETAILS</p>
                    </div>
                    <div>
                        <% 
                           if ( user.getAddress() != null)
                           {
                        %>
                        <input class="inputAddress" type="text" id="address" name="address"  placeholder="Address" value="<%= user.getAddress() %>">
                        <%
                            }
                            else
                            {
                        %>
                        <input class="inputAddress" type="text" id="address" name="address"  placeholder="Address" value="" required>
                        <%
                            }
                        %>
                    </div>
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

            <% 
                    for (OrderDetail o : listOD)
                    {
                        Product product = ProductDB.getProductById(o.getProduct_id());
                        String formatTotalPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(o.getTotalPrice());
                        String formatPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(o.getPrice());
                        subTotal += o.getTotalPrice();
                        
            %> 
            <div class="order-item">
                <div class="product">
                    <img src="<%= product.getImg_url() %>" alt="New Balance 530 - Dark Olivine" />
                    <div>
                        <p><%= o.getProductName()  %></p>
                        <p>Size : <%= o.getSize()  %></p>
                    </div>
                </div>
                <div><%= formatPrice  %></div>
                <div><%= o.getQuantity()  %></div>
                <div><%= formatTotalPrice  %></div>
            </div>
            <%
                            }
                            String formatSubTotal = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(subTotal);
                            double cp = 0;
                            if ( !totalCouponString.equals("0"))
                            {
                                cp = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).parse(totalCouponString).doubleValue();
                            }
                            allTotal = subTotal - cp;
                            order.setTotal_price((float)allTotal + feeship);
                            String formatAllTotal = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(allTotal);
            %>
            <!-- Order summary -->
            <div class="order-summary">
                <div></div>
                <div></div>
                <div>Subtotal</div>
                <div><%= formatSubTotal %></div>

                <div></div>
                <div></div>
                <div>Discount</div>
                <div>- <%= totalCouponString %></div>

                <div></div>
                <div></div>
                <div>Total</div>
                <div><%= formatAllTotal %></div>
            </div>

            <div class="confirm-button-container">
                <form id="checkoutForm" action="CheckOutServlet" method="post">
                    <button type="button" onclick="validateForm(event)" class="confirm-button">Confirm</button>
                </form>               
            </div>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                        function validateForm(event) {
                            event.preventDefault();
                            var fullnameInputs = document.querySelectorAll("#fullname");
                            var phoneInputs = document.querySelectorAll("#phone");
                            var addressInputs = document.querySelectorAll("#address");

                            var isValid = true;

                            fullnameInputs.forEach(function (input) {
                                var fullname = input.value.trim();
                                if (fullname == "") {
                                    input.classList.add("error-border");
                                    isValid = false;
                                } else {
                                    input.classList.remove("error-border");
                                }
                            });

                            phoneInputs.forEach(function (input) {
                                var phone = input.value.trim();
                                if (phone == "") {
                                    input.classList.add("error-border");
                                    isValid = false;
                                } else {
                                    input.classList.remove("error-border");
                                }
                            });

                            addressInputs.forEach(function (input) {
                                var address = input.value.trim();
                                if (address == "") {
                                    input.classList.add("error-border");
                                    isValid = false;
                                } else {
                                    input.classList.remove("error-border");
                                }
                            });

                            if (!isValid) {
                                Swal.fire({
                                    icon: 'warning',
                                    title: 'ERROR!',
                                    text: 'Please fill all required fields.',
                                    confirmButtonText: 'OK'
                                });
                            } else {
                                document.getElementById("checkoutForm").submit();
                            }
                        }
        </script>
    </body>
</html>
