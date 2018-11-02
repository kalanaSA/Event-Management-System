/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    User cs = new User();
    String msg=null;
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void register(String type,HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        String name = request.getParameter("name");
        String dName = request.getParameter("displayName");
        String email = request.getParameter("mail");
        String phone = request.getParameter("phone");
        String address = request.getParameter("add");
        String password = request.getParameter("pass");
        String confpassword = request.getParameter("confPass");
        if(confpassword.equals(password)){
        if(type.equals("university")){
            
            boolean valid = cs.registerUni(name, dName, address, phone, email, password);
            
              
        
            msg = "success";
            response.sendRedirect("public/login.jsp?msg="+URLEncoder.encode(msg, "UTF-8"));
            
           
        }else if(type.equals("organization")){
            boolean valid = cs.registerOrg(name, dName, address, phone, email, password);
            
           
           
            msg = "success";
            response.sendRedirect("public/login.jsp?msg="+URLEncoder.encode(msg, "UTF-8"));
            
            
        }
        
        
        }
        else{
            msg = "passwords you endtered do not match";
            response.sendRedirect("public/register.jsp?msg="+URLEncoder.encode(msg, "UTF-8"));
        }
    }
    
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
       PrintWriter out = response.getWriter();
        System.out.println("Test servelet working");
       if(request.getParameter("uni") != null){
           try {
               register("university", request, response);
           } catch (Exception ex) {
               Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
           }
       }else if(request.getParameter("org") != null){
           try {
               register("organization", request, response);
           } catch (Exception ex) {
               Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
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
