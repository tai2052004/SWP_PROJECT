/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import dao.CouponDB;
import dao.ProductDB;
import dao.ProductDetailDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import model.Coupon;
import model.OrderDetail;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author LAPTOP
 */
public class ShoppingCart extends HttpServlet {

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
            out.println("<title>Servlet CheckOutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        
        if ( action != null )
        {
            if (action.equalsIgnoreCase("updateCart")) {
                updateCart(request, response);
            } else if (action.equalsIgnoreCase("checkout")) {
                String c = request.getParameter("couponID");
                Coupon coupon = null;
                if ( c != null )
                {
                    coupon = CouponDB.getCouponById(Integer.parseInt(c));
                }
                request.setAttribute("coupon", coupon);
                request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
            } else if (action.equalsIgnoreCase("applyCoupon")) {
                applyCoupon(request, response);
            }
        }
        else
        {
            String delete = request.getParameter("DeleteAction");
            deleteCart(request, response, delete);
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

    public void updateCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<OrderDetail> lOD = (List<OrderDetail>) session.getAttribute("listCart");
        List<OrderDetail> lo = new ArrayList<OrderDetail>();
        for (OrderDetail o : lOD) {
            String s = request.getParameter("quantityChange" + o.getCart_id());
            String size = request.getParameter("sizeChange" + o.getCart_id());
            ProductDetail pd = ProductDetailDB.getProductDetailByProductDetailID(o.getProduct_detail_id());
            if (s != null) {
                int newQuantity = Integer.parseInt(s);
                if ( newQuantity > pd.getQuantity())
                {
                    session.setAttribute("error", "Quantity not enough in stock!");
                    request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
                    return;
                }
                o.setQuantity(newQuantity);
            }
            if (size != null) {
                o.setSize(size);
            }

        }
        for (OrderDetail o : lOD) {
            if (!lo.contains(o)) {
                for (OrderDetail od : lOD) {
                    if (o.getSize().equalsIgnoreCase(od.getSize()) && o.getProduct_id() == od.getProduct_id() && o.getCart_id() != od.getCart_id()) {
                        lo.add(od);
                        o.setQuantity(o.getQuantity() + od.getQuantity());
                    }
                }
            }
        }
        if (!lo.isEmpty() || lo != null) {
            for (OrderDetail od : lo) {
                lOD.remove(od);
            }
        }
        request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
    }

    public void applyCoupon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Coupon> listCoupon = CouponDB.listAllCoupons();
        String couponCode = request.getParameter("couponCode");
        Coupon cou = new Coupon();

        for (Coupon c : listCoupon) {
            if (c.getCouponCode().equalsIgnoreCase(couponCode)) {
                cou = c;
            }
        }
        request.setAttribute("coupon", cou);
        request.setAttribute("c", couponCode);
        request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
    }
    public void deleteCart(HttpServletRequest request, HttpServletResponse response, String delete) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        List<OrderDetail> lOD = (List<OrderDetail>) session.getAttribute("listCart");
        OrderDetail ode = null;

        for (OrderDetail od : lOD) {
            String cartStr = Integer.toString(od.getCart_id());
            if ( delete.equalsIgnoreCase(cartStr)) {
                    ode = od;              
            }
        }
        if (ode != null) {
            session.removeAttribute("product");
            lOD.remove(ode);
        }
        request.getRequestDispatcher("ShoppingCart.jsp").forward(request, response);
    }

}
