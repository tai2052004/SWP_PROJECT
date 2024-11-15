<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.* , dao.*, java.util.*" %> 
<!DOCTYPE html>
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
        <link href="CSS/stylesss.css" rel="stylesheet" />
    </head>
    <body>
        <% if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
        <div class="alerts">    
            <div class="alert alert-success animated bounceInRight">
                <div class="icon pull-left">
                    <i class="fa fa-check-circle fa-2x"></i>
                </div>
                <div class="copy">
                    <h4>SUCCESS</h4>
                    <p>Add coupon successful!</p>
                </div>
                <a class="close">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <% } %>
        <div class="header">
            <div>
                <img src="assets/logo.svg" width="77" height="72" style="margin-left: 74px" />
                <img src="assets/logo2.png" width="110" height="27" />
                <img src="assets/back-arrow.svg" width="24" height="30" style="margin-left: 27px" />
                <img src="assets/home.svg" width="36" height="36" style="margin-left: 55px" />
                <span class="title" style="margin-left: 25px">HOME</span>
                <img src="assets/forward.svg" width="24" height="35" style="margin-left: 25px" />
                <span class="title accent-text" style="margin-left: 40px">
                    Coupon Manage
                </span>
            </div>
            <div>
                <div class="logout-button" onclick="window.location.href = 'LogoutControl'" style="cursor: pointer;">
                    <span class="title black-text">Logout</span>
                    <img src="assets/logout.svg" width="30" height="30" />
                </div>
            </div>
        </div>
        <div class="body">
            <div class="sidebar">
                <div class="sidebar-top">
                    <img src="assets/sidebar-logo.svg" width="76" height="71" />
                    <span>Administrator.</span>
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
                            <a class="sidebar-button " href="OrderList.jsp">
                                <img src="assets/cart.svg" width="36" height="36" style="margin-right: 13px" /> Orders Management
                            </a>
                            <form id="myForm" action="SaleStatisticServlet" method="post">
                                <a class="sidebar-button" onclick="document.getElementById('myForm').submit();">
                                    <img src="assets/sales.svg" width="36" height="36" style="margin-right: 13px" /> Sales Statistics
                                </a>
                            </form>
                            <a class="sidebar-button " href="UserManage.jsp">
                                <img src="assets/user.svg" width="36" height="36" style="margin-right: 13px" /> User Management
                            </a>
                            <a class="sidebar-button is-active" href="CouponList.jsp">
                                <img src="assets/coupon.svg" width="36" height="36" style="margin-right: 13px" /> Coupon Management
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div>
                    <!-- Main header section -->
                    <div class="main-header" style="margin-bottom: 40px;">
                        <span class="title">Coupon Manage</span>
                    </div>

                    <!-- Main content with light blue background -->
                    <div style="
                         background: white;
                         border-radius: 12px;
                         padding: 20px;
                         box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                         ">
                        <!-- Search and buttons bar -->
                        <div style="
                             display: flex;
                             justify-content: space-between;
                             align-items: center;
                             margin-bottom: 20px;
                             ">
                          <!-- Search section -->
<div style="display: flex; align-items: center; gap: 10px;">
    <span style="font-weight: 500;">Search:</span>
    <input type="text" placeholder="Enter Here" style="
           padding: 8px 12px;
           border: 1px solid #ccc;
           border-radius: 4px;
           width: 200px;
           " id="couponSearchInput">
    <button style="
            padding: 8px 16px;
            border-radius: 4px;
            border: 1px solid #ccc;
            background: white;
            cursor: pointer;
            " onclick="filterCoupons()">Search</button>
</div>

              <!-- Sort and Add new buttons -->
<div style="display: flex; gap: 16px; align-items: center;">
    <form action="CouponList.jsp" method="get" style="display: flex; align-items: center;">
        <div style="position: relative; display: flex; align-items: center;">
            <img src="assets/sort.svg" alt="sort" width="20" height="20" style="position: absolute; left: 10px;">
            <select name="sortOrder" onchange="this.form.submit()" style="
                    -webkit-appearance: none;
                    -moz-appearance: none;
                    appearance: none;
                    padding: 8px 16px 8px 40px;
                    border-radius: 4px;
                    border: 1px solid #1d81f3;
                    background: transparent;
                    color: #1d81f3;
                    cursor: pointer;
                    font-size: 14px;
                    min-width: 150px;">
                <option value="">Sort by</option>
                <option value="valueAsc" <%= "valueAsc".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Value ascending</option>
                <option value="valueDesc" <%= "valueDesc".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Value descending</option>
                <option value="quantityAsc" <%= "quantityAsc".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Quantity ascending</option>
                <option value="quantityDesc" <%= "quantityDesc".equals(request.getParameter("sortOrder")) ? "selected" : "" %>>Quantity descending</option>
            </select>
        </div>
    </form>

    <a href="AddCoupon.jsp" style="
       padding: 8px 16px;
       border-radius: 4px;
       background: #1d81f3;
       color: white;
       border: none;
       display: flex;
       align-items: center;
       gap: 20px;
       cursor: pointer;
       text-decoration: none;">
        + Add new
    </a>
</div>
                        </div>

                        <!-- User table -->
                        <div style="
                             background: white;
                             border-radius: 8px;
                             overflow: hidden;
                             ">
                            <!-- Table header -->
                            <div style="
                                 display: grid;
                                 grid-template-columns: 80px 200px 200px 150px 150px 100px;
                                 padding: 16px;
                                 border-bottom: 1px solid #eee;
                                 ">
                                <div style="color: #1d81f3; font-weight: 600;">ID</div>
                                <div style="color: #1d81f3; font-weight: 600;">Name</div>
                                <div style="color: #1d81f3; font-weight: 600;">Code</div>
                                <div style="color: #1d81f3; font-weight: 600;">Value</div>
                                <div style="color: #1d81f3; font-weight: 600;">Quantity</div>
                                <div style="color: #1d81f3; font-weight: 600;">Action</div>
                            </div>

                         <!-- Table rows -->
<div class="coupon-container">
    <%
        List<Coupon> coupons = CouponDB.listAllCoupons();
        String sortOrder = request.getParameter("sortOrder");
        
        // Sort the list based on sortOrder parameter
        if (sortOrder != null) {
            switch(sortOrder) {
                case "valueAsc":
                    coupons.sort(Comparator.comparingDouble(Coupon::getDiscountValue));
                    break;
                case "valueDesc":
                    coupons.sort(Comparator.comparingDouble(Coupon::getDiscountValue).reversed());
                    break;
                case "quantityAsc":
                    coupons.sort(Comparator.comparingInt(Coupon::getQuantity));
                    break;
                case "quantityDesc":
                    coupons.sort(Comparator.comparingInt(Coupon::getQuantity).reversed());
                    break;
            }
        }
        
        for(Coupon coupon : coupons) {
    %>
    <div style="
         display: grid;
         grid-template-columns: 80px 200px 200px 150px 150px 100px;
         padding: 16px;
         border-bottom: 1px solid #eee;
         " 
         class="coupon-row" 
         data-coupon-id="<%= coupon.getCouponId() %>"
         data-coupon-name="<%= coupon.getCouponName().toLowerCase() %>"
         data-coupon-code="<%= coupon.getCouponCode().toLowerCase() %>">
        <div><%= coupon.getCouponId() %></div>
        <div><%= coupon.getCouponName() %></div>
        <div><%= coupon.getCouponCode() %></div>
        <div><%= String.format("%,.0f", coupon.getDiscountValue()) %></div>
        <div><%= coupon.getQuantity() %></div>
        <div style="display: flex; gap: 8px;">
            <form id="couponSelectionForm<%= coupon.getCouponId() %>" action="UpdateCouponServlet" method="GET">
                <div style="border: none; background: none; cursor: pointer; text-decoration: none;">
                    
                    <input type="hidden" id="selectedCoupon<%= coupon.getCouponId() %>" name="couponId" value="">
                </div>
            </form>
            <button onclick="confirmDelete(<%= coupon.getCouponId() %>)" style="border: none; background: none; cursor: pointer;">
                <img src="assets/delete.svg" alt="delete" width="20" height="20">
            </button>
        </div>
    </div>
    <%
        }
    %>
</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const closeButtons = document.querySelectorAll('.alert .close');

                closeButtons.forEach(function (button) {
                    button.addEventListener('click', function () {
                        this.closest('.alert').style.display = 'none';
                    });
                });
            });
        </script>
        <script>
            function chooseCoupon(couponId) {
                document.getElementById('selectedCoupon' + couponId).value = couponId;
                document.getElementById('couponSelectionForm' + couponId).submit();
            }
        </script>
        <script>
            function confirmDelete(couponId) {
                if (confirm('Are you sure you want to delete this coupon?')) {
                    document.getElementById('deleteId').value = couponId;
                    document.getElementById('deleteForm').submit();
                }
            }

// Add this to your existing DOMContentLoaded event listener
            document.addEventListener('DOMContentLoaded', function () {
                // Your existing alert close code...

                // Add success/error alerts for deletion
                const urlParams = new URLSearchParams(window.location.search);
                if (urlParams.get('deleteSuccess') === 'true') {
                    // You can add a success alert here similar to your existing success alert
                    const alertsDiv = document.querySelector('.alerts');
                    if (alertsDiv) {
                        const successAlert = document.createElement('div');
                        successAlert.className = 'alert alert-success animated bounceInRight';
                        successAlert.innerHTML = `
                <div class="icon pull-left">
                    <i class="fa fa-check-circle fa-2x"></i>
                </div>
                <div class="copy">
                    <h4>SUCCESS</h4>
                    <p>Coupon deleted successfully!</p>
                </div>
                <a class="close">
                    <i class="fa fa-times"></i>
                </a>
            `;
                        alertsDiv.appendChild(successAlert);
                    }
                }
            });
        </script>
        <script>
    function filterCoupons() {
        const searchInput = document.getElementById('couponSearchInput').value.trim().toLowerCase();
        const coupons = document.querySelectorAll('.coupon-row');
        let visibleCouponCount = 0;
        const couponContainer = document.querySelector('.coupon-container'); // Add class "coupon-container" to your table rows container
        
        // Convert NodeList to Array for sorting
        const couponArray = Array.from(coupons);
        
        couponArray.forEach(coupon => {
            const couponName = coupon.getAttribute('data-coupon-name');
            const couponCode = coupon.getAttribute('data-coupon-code').toLowerCase();
            
            if (couponName.includes(searchInput) || couponCode.includes(searchInput)) {
                coupon.style.visibility = "visible";
                coupon.style.height = "";
                visibleCouponCount++;
                // Move matching items to top
                couponContainer.insertBefore(coupon, couponContainer.firstChild);
            } else {
                coupon.style.visibility = "hidden";
                coupon.style.height = "0";
            }
        });

        if (visibleCouponCount === 0) {
            Swal.fire({
                icon: 'error',
                title: 'ERROR',
                text: 'No coupon found',
                confirmButtonText: 'OK'
            });
            // Reset display and order
            couponArray.forEach(coupon => {
                coupon.style.visibility = "visible";
                coupon.style.height = "";
                // Restore original order by ID
                const couponId = parseInt(coupon.getAttribute('data-coupon-id'));
                const nextCoupon = Array.from(couponContainer.children).find(c => 
                    parseInt(c.getAttribute('data-coupon-id')) > couponId
                );
                if (nextCoupon) {
                    couponContainer.insertBefore(coupon, nextCoupon);
                } else {
                    couponContainer.appendChild(coupon);
                }
            });
        }
    }
</script>
    </body>
</html>
