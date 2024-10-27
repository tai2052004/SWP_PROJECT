/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package servlet;

import dao.CouponDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Coupon;


public class AddCouponServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get parameters from the form
            String discountName = request.getParameter("discount_name");
            String code = request.getParameter("code");
            float discountValue = Float.parseFloat(request.getParameter("discount_value"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Validate input
            if (discountName == null || discountName.trim().isEmpty() ||
                code == null || code.trim().isEmpty() ||
                discountValue <= 0 || quantity <= 0) {
                request.setAttribute("error", "Please fill in all fields with valid values");
                request.getRequestDispatcher("AddCoupon.jsp").forward(request, response);
                return;
            }

            // Check if coupon code already exists
            if (CouponDB.couponExists(code)) {
                request.setAttribute("error", "Coupon code already exists");
                request.getRequestDispatcher("AddCoupon.jsp").forward(request, response);
                return;
            }

            // Create new Coupon object
            Coupon coupon = new Coupon();
            coupon.setCouponName(discountName);
            coupon.setCouponCode(code);
            coupon.setDiscountValue(discountValue);
            coupon.setQuantity(quantity);

            // Add coupon to database
            boolean success = CouponDB.addCoupon(coupon);

            if (success) {
                // Redirect to coupon list with success message
                response.sendRedirect("CouponList.jsp");
            } else {
                request.setAttribute("error", "Failed to add coupon");
                request.getRequestDispatcher("AddCoupon.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format");
            request.getRequestDispatcher("AddCoupon.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("AddCoupon.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to the add coupon page
        response.sendRedirect("AddCoupon.jsp");
    }
}