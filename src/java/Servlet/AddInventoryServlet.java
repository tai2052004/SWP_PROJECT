/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Servlet;

import dao.ProductDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.ProductDetail;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="AddInventoryServlet", urlPatterns={"/AddInventoryServlet"})
@MultipartConfig
public class AddInventoryServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet AddInventoryServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddInventoryServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        double price = Double.parseDouble(request.getParameter("price"));
        String discount = request.getParameter("discount");
        String description = request.getParameter("description");
        
        Product product = new Product();
        product.setProductName(name);
        product.setBrand(brand);
        product.setPrice(price);
        product.setDiscount(discount);
        product.setDescription(description);
        product.setStatus(1);
        
        String[] sizes = request.getParameterValues("size");
        String[] quantities = request.getParameterValues("quantity");

        List<ProductDetail> productDetails = new ArrayList<>();

        if (sizes != null && quantities != null && sizes.length == quantities.length) {
            for (int i = 0; i < sizes.length; i++) {
                ProductDetail detail = new ProductDetail();
                detail.setSize(sizes[i]);
                detail.setQuantity(Integer.parseInt(quantities[i]));
                productDetails.add(detail);
            }
        }
        product.setProductDetails(productDetails);
        
        Part imagePart = request.getPart("image");
        String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();

        // Set the path where images will be stored in the "img" directory
        String savePath = getServletContext().getRealPath("") + "img" + File.separator + fileName;

        // Write the image to the specified path
        imagePart.write(savePath);

        // Prepare the image URL (relative path)
        String imageUrl = "img/" + fileName; // Store in "img" folder
        product.setImg_url(imageUrl); // Set đường dẫn ảnh cho Product

        boolean success = ProductDB.addNewProduct(product);

        if (success) {
            response.sendRedirect("WarehouseInventory.jsp?success=true");
        } else {
            response.sendRedirect("WarehouseInventory.jsp?error=fail");
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
