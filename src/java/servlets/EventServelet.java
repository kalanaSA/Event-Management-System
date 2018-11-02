/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.Event;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "EventServelet", urlPatterns = {"/EventServelet"})
public class EventServelet extends HttpServlet {
    
    
    Event ev = new Event();

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
            out.println("<title>Servlet EventServelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EventServelet at " + request.getContextPath() + "</h1>");
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
        int eventID = Integer.parseInt(request.getParameter("event"));
        int userID = Integer.parseInt(request.getParameter("user"));
       if("going".equals(request.getParameter("opinion"))){
            ev.eventOpinion("GOING", eventID, userID);           
           response.sendRedirect("public/events.jsp?event="+eventID);
        }
       if("interested".equals(request.getParameter("opinion"))){
            ev.eventOpinion("INTERESTED", eventID, userID);           
           response.sendRedirect("public/events.jsp?event="+eventID);
        }
       if("maybe".equals(request.getParameter("opinion"))){
            ev.eventOpinion("MAYBE", eventID, userID);           
            response.sendRedirect("public/events.jsp?event="+eventID);
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
        if ("comment".equalsIgnoreCase(request.getParameter("comment"))) {
            String comment = request.getParameter("message");
            String userID = request.getParameter("userID");
            String eventID = request.getParameter("eventID");
            ev.addComment(comment, userID, eventID);
            
            response.sendRedirect("public/events.jsp?event="+eventID+"");
            
            
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
