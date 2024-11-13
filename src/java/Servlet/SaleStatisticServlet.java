/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import static com.oracle.wls.shaded.org.apache.xalan.lib.ExsltDynamic.map;
import dao.OrderDB;
import dao.ProductDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.OrderDetail;
import model.Product;
import model.SalesStatistic;


/**
 *
 * @author LAPTOP
 */
public class SaleStatisticServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SaleStatisticServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SaleStatisticServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String period = request.getParameter("period");
        if (period == null) {
            period = "week"; // Default period is week
        }

        SalesStatistic stats = OrderDB.getTodayStatistics();
        request.setAttribute("stats", stats);
        
        HashMap<String, Double> hashmap = new HashMap<>();
        List<OrderDetail> odLi = OrderDB.getOrderDetail();
        for ( OrderDetail od : odLi)
        {
            Product p = ProductDB.getProductById(od.getProduct_id());
            hashmap.put(p.getProductName(), hashmap.getOrDefault(p.getProductName(), 0D) + od.getTotalPrice());
        }
        List<Map.Entry<String, Double>> list = new ArrayList<>(hashmap.entrySet());

        // Sắp xếp List theo giá trị giảm dần
        list.sort(Map.Entry.<String, Double>comparingByValue().reversed());
        LinkedHashMap<String, Double> sortedMap = new LinkedHashMap<>();
        for (Map.Entry<String, Double> entry : list) {
            sortedMap.put(entry.getKey(), entry.getValue());
        }
        
        HashMap<String, Double> hashmapBrand = new HashMap<>();
        for ( OrderDetail od : odLi)
        {
            Product p = ProductDB.getProductById(od.getProduct_id());
            hashmapBrand.put(p.getBrand(), hashmapBrand.getOrDefault(p.getProductName(), 0D) + od.getTotalPrice());
        }
        List<Map.Entry<String, Double>> list2 = new ArrayList<>(hashmapBrand.entrySet());

        // Sắp xếp List theo giá trị giảm dần
        list2.sort(Map.Entry.<String, Double>comparingByValue().reversed());
        LinkedHashMap<String, Double> sortedMap2 = new LinkedHashMap<>();
        for (Map.Entry<String, Double> entry : list2) {
            sortedMap2.put(entry.getKey(), entry.getValue());
        }
        request.setAttribute("TopProductMap", sortedMap);
        request.setAttribute("TopBrandMap", sortedMap2);

        List<Map<String, Object>> topProducts = OrderDB.getTopProducts();
        request.setAttribute("topProducts", topProducts);

        request.getRequestDispatcher("SaleStatistic.jsp").forward(request, response);
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
