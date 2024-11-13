<%-- 
    Document   : SaleStatistic
    Created on : Oct 21, 2024, 8:23:18 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="model.* , dao.*, java.util.*" %> 
<%@ page import="java.text.NumberFormat" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script
            defer
            src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"
        ></script>
        <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Kavoon&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
            />
        <link href="CSS/stylesss.css" rel="stylesheet" />
    </head>
    <%

        Map<String, Double> chartData = OrderDB.getChartData();


        String[] allMonths = {
            "January", "February", "March", "April", "May", "June", 
            "July", "August", "September", "October", "November", "December"
        };


        StringBuilder labels = new StringBuilder();
        StringBuilder values = new StringBuilder();

        // Duyệt qua tất cả các tháng, nếu không có dữ liệu, gán giá trị 0
        for (String month : allMonths) {
            labels.append("\"").append(month).append("\",");
            // Kiểm tra xem có dữ liệu cho tháng này không
            if (chartData.containsKey(month)) {
                values.append(chartData.get(month)).append(",");
            } else {
                values.append("0,"); // Nếu không có dữ liệu, gán 0
            }
        }

        // Xóa dấu phẩy cuối cùng
        if (labels.length() > 0) labels.setLength(labels.length() - 1);
        if (values.length() > 0) values.setLength(values.length() - 1);
    %>
    <body>
        <div class="header">
            <div>
                <img
                    src="assets/logo.svg"
                    width="77"
                    height="72"
                    style="margin-left: 74px"
                    />
                <img src="assets/logo2.png" width="110" height="27" />
                <img
                    src="assets/back-arrow.svg"
                    width="24"
                    height="30"
                    style="margin-left: 27px"
                    />
                <img
                    src="assets/home.svg"
                    width="36"
                    height="36"
                    style="margin-left: 55px"
                    />
                <span class="title" style="margin-left: 25px">HOME</span>
                <img
                    src="assets/forward.svg"
                    width="24"
                    height="35"
                    style="margin-left: 25px"
                    />
                <span class="title accent-text" style="margin-left: 40px">
                    Sales statistics
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
                            <img
                                src="assets/dashboard.svg"
                                width="36"
                                height="36"
                                style="margin-right: 13px"
                                />
                            <span style="margin-right: auto"> Dashboard </span>
                            <img
                                src="assets/arrow-down.svg"
                                width="24"
                                height="24"
                                style="
                                margin-right: 13px;
                                transition: ease 0.2s;
                                "
                                :class="isOpen && 'is-arrow-down'"
                                />
                        </div>

                        <div
                            class="collapsible"
                            :class="isOpen && 'is-open'"
                            :style="isOpen && {height: '100%'}"
                            >
                            <a class="sidebar-button" href="OrderList.jsp">
                                <img
                                    src="assets/cart.svg"
                                    width="36"
                                    height="36"
                                    style="margin-right: 13px"
                                    />
                                Orders Management
                            </a>
                            <a
                                class="sidebar-button is-active"
                                href="SaleStatistic.jsp"
                                >
                                <img
                                    src="assets/sales.svg"
                                    width="36"
                                    height="36"
                                    style="margin-right: 13px"
                                    />
                                Sales Statistics
                            </a>
                            <a class="sidebar-button" href="UserManage.jsp">
                                <img
                                    src="assets/user.svg"
                                    width="36"
                                    height="36"
                                    style="margin-right: 13px"
                                    />
                                User Management
                            </a>
                            <a class="sidebar-button" href="CouponList.jsp">
                                <img
                                    src="assets/coupon.svg"
                                    width="36"
                                    height="36"
                                    style="margin-right: 13px"
                                    />
                                Coupon Management
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content">
                <div>
                    <span class="title">Sales statistics</span>
                    <div class="today-sales">
                        <span class="subtitle" style="margin-bottom: 6px">Today's Sales</span>
                        <span class="small">Sales Summary</span>
                        <div class="item-grid">
                            <div>
                                <div class="item">
                                    <div class="icon">
                                        <img src="assets/sales_report.svg" width="48" height="48" />
                                    </div>
                                    <%
                                        
                                        SalesStatistic ss = (SalesStatistic) request.getAttribute("stats");
                                        String formatPrice3 = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(ss.getTotalSales());
                                    %>
                                    <span class="big-text"><%= formatPrice3 %></span>
                                    <span class="small-text">Total sales</span>
                                    <span class="percent-text">+ 5% from yesterday</span>
                                </div>
                            </div>
                            <div>
                                <div class="item" style="background-color: #fff4de">
                                    <div class="icon" style="background-color: #ff9479">
                                        <img src="assets/order_report.svg" width="35" height="35" />
                                    </div>
                                    <span class="big-text">${stats.totalOrders}</span>
                                    <span class="small-text">Total orders</span>
                                    <span class="percent-text">+ 2% from yesterday</span>
                                </div>
                            </div>
                            <div>
                                <div class="item" style="background-color: #f4e8ff">
                                    <div class="icon" style="background-color: #bf83fe">
                                        <img src="assets/product_report.svg" width="30" height="27" />
                                    </div>
                                    <span class="big-text">${stats.productsSold}</span>
                                    <span class="small-text">Product sold</span>
                                    <span class="percent-text">+ 8% from yesterday</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="graph-grid" style="display: flex; justify-content: center;">
                        <div class="graph-container">
                            <div id="dataGraph"></div>
                        </div>
                    </div>
                    <div class="table-grid">
                        <div class="table-grid-item">
                            <div>
                                <span class="title">Top products</span>
                                <div class="inner-grid inner-grid-header">
                                    <div><span>#</span></div>
                                    <div><span>Name</span></div>
                                    <div><span>Sales</span></div>
                                    <span class="line"></span>
                                </div>
                                <div class="inner-grid content-grid">
                                    <%
                                        LinkedHashMap<String, Double> hashmap = (LinkedHashMap<String, Double>) request.getAttribute("TopProductMap");
                                        int i = 1;
                                        for ( Map.Entry<String, Double> entry  : hashmap.entrySet())
                                        {
                                        String formatPrice = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(entry.getValue());
                                    %>
                                    <div><%= i++ %></div>
                                    <div><%= entry.getKey() %></div>
                                    <div><%= formatPrice %></div>
                                    <span class="line"></span>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="table-grid-item">
                            <div>
                                <span class="title">Sales by brand</span>
                                <div class="inner-grid inner-grid-header">
                                    <div><span>#</span></div>
                                    <div><span>Name</span></div>
                                    <div><span>Sales</span></div>
                                    <span class="line"></span>
                                </div>
                                <div class="inner-grid content-grid">
                                    <%
                                        LinkedHashMap<String, Double> hashmapBrand = (LinkedHashMap<String, Double>) request.getAttribute("TopBrandMap");
                                        int i2 = 1;
                                        for ( Map.Entry<String, Double> entry  : hashmapBrand.entrySet())
                                        {
                                        String formatPrice1 = NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(entry.getValue());
                                    %>
                                    <div><%= i2++ %></div>
                                    <div><%= entry.getKey() %></div>
                                    <div><%= formatPrice1 %></div>
                                    <span class="line"></span>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var chartData = [];
            <c:forEach var="data" items="${chartData}">
    chartData.push({
                    label: "${data.label}",
                    value: ${data.value}
        });
        </c:forEach>

            var labels = chartData.map(data => data.label);
            var salesData = chartData.map(data => data.value);

            var ctx = document.getElementById('salesChart').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Sales',
                            data: salesData,
                            backgroundColor: 'rgba(75, 192, 192, 0.6)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            function updateChart() {
                var period = document.getElementById('periodFilter').value;
                window.location.href = 'SaleStatistic?period=' + period;
            }
                </script>
                <script>
                    // Lấy dữ liệu từ JSP
                    const xArray = [<%= labels.toString() %>];
                    const yArray = [<%= values.toString() %>];

                    // Sử dụng Plotly.js để vẽ biểu đồ
                    const data = [
                        {
                            x: xArray,
                            y: yArray,
                            type: "bar",
                        },
                    ];
                    Plotly.newPlot("dataGraph", data, {}, {staticPlot: true});
                </script>
                </body>
                </html>
