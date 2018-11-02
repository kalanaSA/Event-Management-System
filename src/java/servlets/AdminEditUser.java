/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import classes.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminEditUser", urlPatterns = {"/AdminEditUser"})
public class AdminEditUser extends HttpServlet {
    
    
    private static final long serialVersionUID = 1L;
        
User us =new User();

    
       String folder = "D://Projects//DEAProject//web//assets//images";  
	private final String UPLOAD_DIRECTORY = folder;

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
            out.println("<title>Servlet AdminEditUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminEditUser at " + request.getContextPath() + "</h1>");
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
        int userID = Integer.parseInt(request.getParameter("id"));
        us.removeUser(userID);
        response.sendRedirect("public/adminIndex.jsp");
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
        String fname = null;
            String name = null,dName = null, address = null, phone = null, userID = null, email = null;
		if(ServletFileUpload.isMultipartContent(request)){
                    
            try {
                
                request.setAttribute("message", "File Uploaded Successfully");
                
                
                /*  ------------File Upload ------------*/
            	
            	String fsize = null;
            	String ftype = null;
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        fname = new File(item.getName()).getName();
                        fsize = new Long(item.getSize()).toString();
                        ftype = item.getContentType();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + fname));
                    }else{
                        if(item.getFieldName().equals("name")){
                            name = item.getString();
                        }
                        if(item.getFieldName().equals("dName")){
                            dName = item.getString();
                        }
                        if(item.getFieldName().equals("address")){
                            address = item.getString();
                        }
                        if(item.getFieldName().equals("phone")){
                            phone = item.getString();
                        }
                        if(item.getFieldName().equals("email")){
                            email = item.getString();
                        }
                        if(item.getFieldName().equals("userID")){
                            userID = item.getString();
                        }
                        
                        
                    }
                }
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully");
               
               
               us.editUser(name, dName, address, phone, email, fname, userID);
               
 
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
         
        }else{
            request.setAttribute("message","Sorry this Servlet only handles file upload request");
        }
               
                
                 response.sendRedirect("public/adminIndex.jsp");
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
