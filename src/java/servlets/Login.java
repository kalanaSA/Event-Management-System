/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    private String msg = "";

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
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
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
        if("logout".equals(request.getParameter("logout"))){
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("public/login.jsp");
        }

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
        PrintWriter out = response.getWriter();
        if ("login".equalsIgnoreCase(request.getParameter("login"))) {
            String email = request.getParameter("email");
            String password = request.getParameter("pass");
            User us = new User();

            try {
                boolean login = us.loginAttempt(email, password);
                if (login == true) {
                    if(email.equals("admin")){
                        response.sendRedirect("public/adminIndex.jsp");
                        session.setAttribute("type", "admin");
                    }
                    
                    
                   
                        
                    
                    us.getUserDetails(email, password);
                     if("APPROVED".equals(us.getApproval())){
                    
                    session.setAttribute("dName", us.getdName());
                    Integer intObj = new Integer(us.getUserID());
                    session.setAttribute("userID", intObj);
                    session.setAttribute("type", us.getType());
                    session.setAttribute("type", us.getType());
                    session.setAttribute("auth", true);
                    response.sendRedirect("public/index.jsp");
                    
                    }else{
                        msg = "Your still not approved"+us.getApproval()+"name"+us.getdName()+"";
                         response.sendRedirect("public/login.jsp?err=" + msg + " ");
                    }
                    
                } else {
                    msg = "credentials you entered does not match";
                    response.sendRedirect("public/login.jsp?err=" + msg + " ");
                }

            } catch (Exception ex) {

            }

        }else{
            msg = "Failed & login btn = "+request.getParameter("login")+" & email ="+request.getParameter("email")+" & pass ="+ request.getParameter("pass");
                    response.sendRedirect("public/login.jsp?err=" + msg + " ");
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
