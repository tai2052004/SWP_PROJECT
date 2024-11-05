package Servlet;

import dao.CouponDB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteCouponServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String couponIdStr = request.getParameter("couponId");
        
        try {
            int couponId = Integer.parseInt(couponIdStr);
            boolean success = CouponDB.deleteCoupon(couponId);
            
            if (success) {
                response.sendRedirect("CouponList.jsp?deleteSuccess=true");
            } else {
                response.sendRedirect("CouponList.jsp?deleteError=true");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("CouponList.jsp?deleteError=true");
        }
    }
}