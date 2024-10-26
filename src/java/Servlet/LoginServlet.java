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
import jakarta.servlet.http.HttpSession;
import java.util.*;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.User;

/**
 *
 * @author ngoct
 */
public class LoginServlet extends HttpServlet {
   
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
            out.println("<title>Servlet LoginServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath () + "</h1>");
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
        String action = request.getParameter("action");
        
        if ( "login".equalsIgnoreCase(action)) {
            Login(request,response);
        }
        else if("register".equalsIgnoreCase(action)) {
            Register(request,response);
        }
    }
    protected void Login(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = UserDB.login(username, password);
        HttpSession session = request.getSession();
        Order o = new Order();
        List<OrderDetail> lo = new ArrayList<OrderDetail>();
        if (user != null) {            
            session.setAttribute("user", user);
            if ("admin".equals(user.getUser_role())) {
                response.sendRedirect("UserManage.jsp");
            } else if("user".equals(user.getUser_role())) {
                session.setAttribute("listCart", lo);
                session.setAttribute("order", o);
                response.sendRedirect("landingPage.jsp");
            }
        }  else {
            request.setAttribute("u",username);
            request.setAttribute("p", password);
            request.getRequestDispatcher("login.jsp?error=invalid").forward(request, response);
        }
    }
    protected void Register(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("re-password");
        String email = request.getParameter("email");
        String role = "user";
        User newUser = new User(username,password,email,role);
        if (!password.equals(rePassword)) {
        request.setAttribute("u", username);
        request.setAttribute("p", password);
        request.setAttribute("re-password", rePassword);
        request.setAttribute("e", email);
        request.getRequestDispatcher("register.jsp?error=not-match").forward(request, response);
        return;
        }
        if(UserDB.userExists(username)) {
            request.setAttribute("u", username);
            request.setAttribute("p", password);
            request.setAttribute("e", email);
            request.getRequestDispatcher("register.jsp?error=invalid").forward(request,response);
            return;
        }
        if(UserDB.userExistsEmail(email)) {
            request.setAttribute("u", username);
            request.setAttribute("p", password);
            request.setAttribute("e", email);
            request.getRequestDispatcher("register.jsp?error=existed").forward(request,response);
            return;
        }
        boolean succes = UserDB.addUser(newUser);
        if(succes) {
            response.sendRedirect("login.jsp");
        }
        else{
            response.sendRedirect("register.jsp");
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
