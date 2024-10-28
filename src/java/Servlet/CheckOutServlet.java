/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import model.*;
import dao.*;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author LAPTOP
 */
public class CheckOutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String address = request.getParameter("address");
        List<OrderDetail> listOD = (List<OrderDetail>) session.getAttribute("listCart");
        List<ProductDetail> listPD = ProductDetailDB.allListProductDetail();
        User user = (User) session.getAttribute("user");
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String nowStr = now.format(formatter);
        user.setAddress(address);
        UserDB.UpdateProfile(user);
        Order order = (Order) session.getAttribute("order");
        order.setAddress(address);
        order.setStatus("Pending");
        order.setOrder_date(nowStr);
        order.setFeeship(20);
        boolean success = OrderDB.addNewOrder(order);
        for ( OrderDetail od : listOD)
        {
            ProductDetail pd = ProductDetailDB.getProductDetailByProductDetailID(od.getProduct_detail_id());
            pd.setQuantity(pd.getQuantity() - od.getQuantity());
            ProductDetailDB.updateProductDetail(pd);
        }
        boolean success2 = false;
        boolean success3 = false;
        if (success)
        {
            success3 = OrderDB.addOrderDetails(listOD, order.getOrder_id());
            listOD.clear();
            if (success3)
            {
                response.sendRedirect("TrackMyOrder.jsp");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
