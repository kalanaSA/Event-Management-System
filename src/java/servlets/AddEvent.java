/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;


import classes.Event;
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
@WebServlet(name = "AddEvent", urlPatterns = {"/AddEvent"})

public class AddEvent extends HttpServlet {
private static final long serialVersionUID = 1L;
        
Event ev = new Event();

    
       String folder = "D://Projects//DEAProject//web//assets//images";  
	private final String UPLOAD_DIRECTORY = folder;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            String fname = null;
            String eName = null,venue = null, date = null, category = null, userID = null, type = null,desc = null;
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
                        if(item.getFieldName().equals("eName")){
                            eName = item.getString();
                        }
                        if(item.getFieldName().equals("venue")){
                            venue = item.getString();
                        }
                        if(item.getFieldName().equals("date")){
                            date = item.getString();
                        }
                        if(item.getFieldName().equals("desc")){
                            desc = item.getString();
                        }
                        if(item.getFieldName().equals("category")){
                            category = item.getString();
                        }
                        if(item.getFieldName().equals("userID")){
                            userID = item.getString();
                        }
                        if(item.getFieldName().equals("type")){
                            type = item.getString();
                        }
                        
                    }
                }
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully");
               
               
               ev.addEvent(eName, venue, date, fname, desc, category, userID, type);
               
 
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
            }          
         
        }else{
            request.setAttribute("message","Sorry this Servlet only handles file upload request");
        }
               
                
                 response.sendRedirect("public/addEvent.jsp");
                /*
               if ("submit".equalsIgnoreCase(request.getParameter("submit"))) {
                   String eName = request.getParameter("eName");
		String venue = request.getParameter("venue");
                String date = request.getParameter("date");
                String desc = request.getParameter("desc");
                String category = request.getParameter("category");
                String userID = request.getParameter("userID");
                String type = request.getParameter("type");
                
                
                ev.addEvent(eName, venue, date, fname, desc, category, userID, type);
                request.getRequestDispatcher("public/result.jsp").forward(request, response);
                
               }
                
               */
        
     
    }		
}