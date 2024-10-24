/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Servlet;

import dao.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.Period;
import model.User;

/**
 *
 * @author ngoct
 */
public class ManageProfileServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ManageProfileServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageProfileServlet at " + request.getContextPath () + "</h1>");
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
        
        String fulln = request.getParameter("personal-name");
        String dob = request.getParameter("birthday");
        LocalDate dobStr = LocalDate.parse(dob);
        LocalDate today = LocalDate.now();
        int age = Period.between(dobStr, today).getYears();
        String email = request.getParameter("email");
        String phone = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        User sessionUser = (User) request.getSession().getAttribute("user");
        int userId = sessionUser.getUser_id();
        if(age < 16) {
            request.getSession().setAttribute("temp_fullname", fulln);
            request.getSession().setAttribute("temp_gender", gender);
            request.getSession().setAttribute("temp_birthday", dob);  
            request.getSession().setAttribute("temp_email", email);
            request.getSession().setAttribute("temp_phone",phone);
            request.getSession().setAttribute("temp_address", address);
            request.setAttribute("errorBirthday", "You must be over 16 years old!");
            request.getRequestDispatcher("ManageProfile.jsp").forward(request, response);
            return;
        }
        if (phone == null || !phone.matches("0\\d{9}")) {
        request.getSession().setAttribute("temp_fullname", fulln);
        request.getSession().setAttribute("temp_gender", gender);
        request.getSession().setAttribute("temp_birthday", dob);  
        request.getSession().setAttribute("temp_email", email);
        request.getSession().setAttribute("temp_phone",phone);
        request.getSession().setAttribute("temp_address", address);
        request.setAttribute("errorMessage", "Số điện thoại phải gồm 10 chữ số và bắt đầu bằng số 0!");

        request.getRequestDispatcher("ManageProfile.jsp").forward(request, response);
        return;
    }
        User user = (User) request.getSession().getAttribute("user");
        user.setUser_id(userId);
        user.setFullname(fulln);
        user.setDob(dob);
        user.setUser_email(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setGender(gender);
        boolean success = UserDB.UpdateProfile(user);
        if(success) {
            request.getSession().setAttribute("user", user);
            request.getSession().removeAttribute("temp_fullname");
            request.getSession().removeAttribute("temp_gender");
            request.getSession().removeAttribute("temp_birthday");
            request.getSession().removeAttribute("temp_email");
            request.getSession().removeAttribute("temp_phone");
            request.getSession().removeAttribute("temp_address");
            request.getRequestDispatcher("ManageProfile.jsp?success=true").forward(request,response);
        }
        else{
            response.sendRedirect("ManageProfile.jsp?error=invalid");
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
