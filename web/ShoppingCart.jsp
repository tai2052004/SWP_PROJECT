<%-- 
    Document   : ShoppingCart
    Created on : Oct 21, 2024, 4:45:40 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.*" %> 
<%@ page import="java.util.*, java.time.LocalDateTime, dao.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%
        session = request.getSession();
        Product p = (Product) session.getAttribute("product");
        List<ProductDetail> liPD = null;
        if ( p != null)
        {
            liPD = p.getProductDetails();
        }       
        String quantity1 = (String) request.getAttribute("productQuantity");
        String size = (String) request.getAttribute("selectedSize");
        Coupon coupon = (Coupon) request.getAttribute("coupon");
        Order order = (Order) session.getAttribute("order");
        User user = (User) session.getAttribute("user");
        order.setUser_id(user.getUser_id());
        double couponValue = 0;
        float feeship = 20;
        int cID = -1;
        order.setFeeship(feeship);
        if ( coupon != null)
        {
            couponValue = coupon.getDiscountValue();
            order.setCoupon(coupon.getCouponId());
            cID = coupon.getCouponId();
        }
        else 
        {
            order.setCoupon(-1);
        }
        int quantity = 0;
        if ( quantity1 != null )
        {
            quantity = Integer.parseInt(quantity1);
        }     
        List<OrderDetail> listOD = (List<OrderDetail>) session.getAttribute("listCart");
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
        if ( p != null )
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
        }
        float discount = 0;
        float priceee = 0;
        if ( size != null)
        {
            discount = Float.parseFloat(p.getDiscount());
            priceee = (float) p.getPrice();
            priceee = priceee - priceee * discount / 100 ;
            od = new OrderDetail(maxCartId, p.getProductID() ,p.getProductName(), p.getBrand(), priceee, size, quantity, now, discount);
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
        double subtotal = 0;
%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Cart</title>
        <link rel="stylesheet" href="boostrap/css/bootstrap.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/ShoppingCart.css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </head>
    <body>
        <%
        String errorMessage = (String) session.getAttribute("error");
        if (errorMessage != null) {
        %>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                Swal.fire({
                    icon: 'error',
                    title: 'ERROR',
                    text: `<%= errorMessage.replace("'", "\\'") %>`,
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {
            <% session.removeAttribute("error"); %>
                    }
                });
            });
        </script>
        <% } %>
        <header>

            <div class="row header">
                <div class="col-md-3 logo">
                    <img src="img/logo1.png">
                </div>

                <div class="col-md-6 menu">
                    <a href="landingPage.jsp" class="menuText">HOME</a>
                    <a href="AllProduct.jsp" class="menuText active">SHOP</a>
                    <a href="#footer" class="menuText">CONTACT</a>
                </div>

                <div class="col-md-3 user-actions">
                    <div class="logout dropdown">
                        <a href="LogoutControl" class="dropdown-toggle"><i class="bi bi-list"></i><i class="bi bi-person-fill"></i>Logout</a>
                        <div class="dropdown-menu">
                            <a href="ManageProfile.jsp">My profile</a>
                            <a href="TrackMyOrder.jsp">Track my order</a>
                            <a href="/favorites">Favorite Items</a>
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
            <h1>YOUR SHOPPING CART</h1>
            <form action="ShoppingCart" method="post">
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                            <th></th>
                        </tr>
                    </thead>
                    <% 
                    for (OrderDetail o : listOD)
                    {
                        Product product = ProductDB.getProductById(o.getProduct_id());
                        List<ProductDetail> pd = product.getProductDetails();
                        double priceDiscount = product.getPrice() - product.getPrice() * o.getDiscount() / 100;
                        double totalPrice = priceDiscount * o.getQuantity();
                        String formattedPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(totalPrice);
                        o.setTotalPrice(totalPrice);
                        o.setImg_url(product.getImg_url());
                        o.setProductName(product.getProductName());
                        String formatPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(priceDiscount);
                        subtotal += totalPrice;
                    %>    

                    <tbody>
                        <tr>
                            <td class="product-info">
                                <img src="<%= product.getImg_url() %>" alt="New Balance 530">
                                <div>
                                    <h3><%= o.getProductName()  %></h3>
                                    <div class="size-selector">
                                        <label>Size:</label>
                                        <input type="hidden" class="sizeChange" name="sizeChange<%= o.getCart_id() %>" value="<%= o.getSize() %>" >
                                        <select class="size-nb530">

                                            <%                        
                                                for (ProductDetail detail : pd) 
                                                {
                                                    if ( o.getSize().equals(detail.getSize()))
                                                    {
                                            %>
                                            <option value="<%= o.getSize() %>" selected><%= o.getSize() %></option>
                                            <%
                                                    }
                                                    else
                                                    {
                                            %>
                                            <option value="<%= detail.getSize() %>"><%= detail.getSize() %></option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                            </td>
                            <td><input style="border: none; pointer-events: none; width: 200px" name="subPrice" value="<%= formatPrice %>" ></td>
                            <td>
                                <div class="quantity-control" style="margin-right: 50px;">
                                    <input type="hidden" class="quantityChange" name="quantityChange<%= o.getCart_id() %>" value="<%= o.getQuantity() %>" >                              
                                    <button type="button" class="decrease-btn">-</button>
                                    <input class="quantity-data" type="text" value="<%= o.getQuantity() %>">
                                    <button type="button" class="increase-btn">+</button>
                                </div>
                            </td>
                            <td style="width: 220px;"><input style="border: none; pointer-events: none; width: 100%;" name="subPrice" value="<%= formattedPrice %>" ></td>
                            <td>
                                <button type="submit" onclick="handleDelete(event,this)" name="action" value="<%= o.getCart_id() %>" class="btn btn-danger btn-sm">
                                    <span>&times;</span>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                    <%
                    }
                     String formatSubtotal = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(subtotal);
                     session.setAttribute("subTotal",subtotal);
                    %>
                </table>
                <input type="hidden" name="DeleteAction" id="deleteAction" value="">
                <div class="cart-actions">
                    <div class="coupon">
                        <input id="coupon-id" type="text" name="couponCode" placeholder="Coupon code" value="${c}">
                        <button type="submit" name="action" value="applyCoupon">Apply coupon</button>
                    </div>

                    <button type="submit" name="action" value="updateCart" class="update-cart">Update cart</button>

                </div>
            </form>
            <%                      
                        double allTotal =  subtotal - couponValue;
                        String formatCouponTotal = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(couponValue);
                        session.setAttribute("totalDiscount", formatCouponTotal);                       
                        order.setTotal_price((float)allTotal + feeship);
                        String formatAlltotal = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(allTotal);
                        session.setAttribute("formatAlltotal", allTotal);
            %>
            
            <div class="cart-totals">
                <h2>Cart totals</h2>
                <table>
                    <tr>
                        <th>Subtotal</th>
                        <td><%= formatSubtotal %></td>
                    </tr>
                    <tr>
                        <th>Coupon</th>
                        <td>- <%= formatCouponTotal %></td>
                    </tr>
                    <tr>

                        <th>Total</th>
                        <td><%= formatAlltotal %></td>
                    </tr>
                </table>
                <form action="ShoppingCart" method="post">
                    <input type="hidden" name="action" value="checkout">
                    <input type="hidden" name="couponID" value="<%= cID %>" />
                    <button type="submit" class="checkout">Check out</button>
                </form>

            </div>

        </main>   
        <script src="js/ShoppingCart.js"></script>
        <script>
            function handleDelete(event,button) {
                event.preventDefault();

                Swal.fire({
                    title: 'Are you sure?',
                    text: "Product will be deleted from your cart!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('deleteAction').value = button.value;
                        button.form.submit();
                    }
                });
            }
        </script>
    </body>
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
</html>
