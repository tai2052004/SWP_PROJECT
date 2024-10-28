<%-- 
    Document   : vnpay_pay
    Created on : Oct 27, 2024, 3:23:37 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.* , dao.*, java.util.*, java.time.LocalDateTime" %> 
<%@page import="model.User , dao.UserDB, model.OrderDetail, model.Product, model.ProductDetail" %> 
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<%
    Order order = (Order) session.getAttribute("order");
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <link rel="stylesheet" href="CSS/vnpay_pay.css" />
        <!-- Bootstrap core CSS -->
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="assets/jumbotron-narrow.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>

        <div class="container">
            <div class="header clearfix">
                <h3>VNPAY</h3>
            </div>
            <h3 class="text-center">Tạo mới đơn hàng</h3>

            <form action="${pageContext.request.contextPath}/vnpayajax" id="frmCreateOrder" method="post">
                <div class="form-group row">
                    <label for="amount" class="col-sm-3 col-form-label">Số tiền</label>
                    <div class="col-sm-9">
                        <input class="form-control" id="amount" name="amount" type="number" value="<%= (int)order.getTotal_price() %>" min="1" max="100000000" />
                    </div>
                </div>

                <h4>Chọn phương thức thanh toán</h4>

                <div class="form-group row">
                    <div class="col-md-6">
                        <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>

                        <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">

                        <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>
                    </div>

                    <div class="col-md-6">
                        <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>

                        <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">

                        <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="VNBANK">

                        <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="INTCARD">

                        <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>
                    </div>





                </div>

                <h5>Chọn ngôn ngữ:</h5>
                <div class="form-group">
                    <input type="radio" id="language1" name="language" value="vn" checked>
                    <label for="language1">Tiếng Việt</label>
                    <input type="radio" id="language2" name="language" value="en">
                    <label for="language2">Tiếng Anh</label>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-custom">Thanh toán</button>
                </div>
            </form>

            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script>
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
                var submitUrl = $("#frmCreateOrder").attr("action");
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
                            if (window.vnpay) {
                                vnpay.open({width: 768, height: 600, url: x.data});
                            } else {
                                location.href = x.data;
                            }
                            return false;
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
        </script>>     

        <!--        <script type="text/javascript">
                    console.log("auto code");
                    $("#frmCreateOrder").submit(function () {
                        // Allow the form to submit normally
                        return true; // This will let the form submission proceed
                    });
                </script>-->
    </body>
</html>
