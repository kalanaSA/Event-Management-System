package org.apache.jsp.public_;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import classes.Core;
import java.sql.ResultSet;
import classes.User;

public final class profile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../includes/layout/headerSite.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("title", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("My Profile | SL EVENTS", request.getCharacterEncoding()), out, false);
      out.write("\n");
      out.write("\n");
      out.write("            \n");
      out.write("            ");
 
               
                if(session.getAttribute("auth") == null ){
                   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                   rd.forward(request, response);
        }
                if(!(Boolean)session.getAttribute("auth")){
    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                   rd.forward(request, response);
}
                
    User us = new User();
                
                
      out.write("\n");
      out.write("  ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../includes/layout/nav.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<section class=\"engine\"><a href=\"https://mobirise.me/s\">bootstrap themes</a></section>\n");
      out.write("    \n");
      out.write("    <section class=\"features11 cid-qXN3Csj43V\" id=\"features11-1p\">\n");
      out.write("\n");
      out.write("        ");

            Integer x = (Integer)session.getAttribute("userID");
            ResultSet rs = us.getDetailsByID(x);
            while(rs.next()){
                
           
                
      out.write("\n");
      out.write("    \n");
      out.write("\n");
      out.write("    <div class=\"container\">   \n");
      out.write("        <div class=\"col-md-12\">\n");
      out.write("            <div class=\"media-container-row\">\n");
      out.write("                <div class=\"mbr-figure\" style=\"width: 50%;\">\n");
      out.write("                    <img src=\"../assets/images/");
 out.println(rs.getString("userImage")); 
      out.write("\" alt=\"Mobirise\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\" align-left aside-content\">\n");
      out.write("                    <h2 class=\"mbr-title pt-2 mbr-fonts-style display-2\">\n");
      out.write("                        ");
 out.println(rs.getString("displayName")); 
      out.write("\n");
      out.write("                    </h2>\n");
      out.write("                    <div class=\"mbr-section-text\">\n");
      out.write("                        <p class=\"mbr-text mb-5 pt-3 mbr-light mbr-fonts-style display-5\">\n");
      out.write("                        Institute Type : ");
 out.println(rs.getString("type").toUpperCase()); 
      out.write("\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"block-content\">\n");
      out.write("                        <div class=\"card p-3 pr-3\">\n");
      out.write("                            <div class=\"media\">\n");
      out.write("                                <div class=\" align-self-center card-img pb-3\">\n");
      out.write("                                    <span class=\"mbr-iconfont mbri-arrow-down\"></span>\n");
      out.write("                                </div>     \n");
      out.write("                                <div class=\"media-body\">\n");
      out.write("                                    <h4 class=\"card-title mbr-fonts-style display-7\">\n");
      out.write("                                        Name\n");
      out.write("                                    </h4>\n");
      out.write("                                </div>\n");
      out.write("                            </div>                \n");
      out.write("\n");
      out.write("                            <div class=\"card-box\">\n");
      out.write("                                <p class=\"block-text mbr-fonts-style display-7\">\n");
      out.write("                                  ");
 out.println(rs.getString("name")); 
      out.write("\n");
      out.write("                                </p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"block-content\">\n");
      out.write("                        <div class=\"card p-3 pr-3\">\n");
      out.write("                            <div class=\"media\">\n");
      out.write("                                <div class=\" align-self-center card-img pb-3\">\n");
      out.write("                                    <span class=\"mbr-iconfont mbri-arrow-down\"></span>\n");
      out.write("                                </div>     \n");
      out.write("                                <div class=\"media-body\">\n");
      out.write("                                    <h4 class=\"card-title mbr-fonts-style display-7\">\n");
      out.write("                                        Address\n");
      out.write("                                    </h4>\n");
      out.write("                                </div>\n");
      out.write("                            </div>                \n");
      out.write("\n");
      out.write("                            <div class=\"card-box\">\n");
      out.write("                                <p class=\"block-text mbr-fonts-style display-7\">\n");
      out.write("                                  ");
 out.println(rs.getString("address")); 
      out.write("\n");
      out.write("                                </p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"block-content\">\n");
      out.write("                        <div class=\"card p-3 pr-3\">\n");
      out.write("                            <div class=\"media\">\n");
      out.write("                                <div class=\" align-self-center card-img pb-3\">\n");
      out.write("                                    <span class=\"mbr-iconfont mbri-arrow-down\"></span>\n");
      out.write("                                </div>     \n");
      out.write("                                <div class=\"media-body\">\n");
      out.write("                                    <h4 class=\"card-title mbr-fonts-style display-7\">\n");
      out.write("                                        Phone\n");
      out.write("                                    </h4>\n");
      out.write("                                </div>\n");
      out.write("                            </div>                \n");
      out.write("\n");
      out.write("                            <div class=\"card-box\">\n");
      out.write("                                <p class=\"block-text mbr-fonts-style display-7\">\n");
      out.write("                                  ");
 out.println(rs.getString("phone")); 
      out.write("\n");
      out.write("                                </p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"block-content\">\n");
      out.write("                        <div class=\"card p-3 pr-3\">\n");
      out.write("                            <div class=\"media\">\n");
      out.write("                                <div class=\" align-self-center card-img pb-3\">\n");
      out.write("                                    <span class=\"mbr-iconfont mbri-arrow-down\"></span>\n");
      out.write("                                </div>     \n");
      out.write("                                <div class=\"media-body\">\n");
      out.write("                                    <h4 class=\"card-title mbr-fonts-style display-7\">\n");
      out.write("                                        Email\n");
      out.write("                                    </h4>\n");
      out.write("                                </div>\n");
      out.write("                            </div>                \n");
      out.write("\n");
      out.write("                            <div class=\"card-box\">\n");
      out.write("                                <p class=\"block-text mbr-fonts-style display-7\">\n");
      out.write("                                  ");
 out.println(rs.getString("email")); 
      out.write("\n");
      out.write("                                </p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>        \n");
      out.write("                                \n");
      out.write("\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div> \n");
      out.write("    </div>    \n");
      out.write("                </div>\n");
      out.write("                <div class=\"container\">\n");
      out.write("        <div class=\"media-container-row title\">\n");
      out.write("            <div class=\"col-12 col-md-8\">\n");
      out.write("                <div class=\"mbr-section-btn align-center\">\n");
      out.write("                  \n");
      out.write("                   <button class=\"btn btn-primary-outline display-4\" onclick=\"showEdit()\">Edit Profile</button>\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("           \n");
      out.write("           <div id=\"editForm\" style=\"display: none\" class=\"container align-center\">\n");
      out.write("                        <div class=\"card\">\n");
      out.write("        <div class=\"form-container\">\n");
      out.write("           \n");
      out.write("                <form method=\"post\" action=\"../EditProfile\" enctype=\"multipart/form-data\" class=\"mbr-form\"> \n");
      out.write("                    <div data-for=\"name\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                           <label class=\"control-label\" for=\"date\">Name</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control px-3\" name=\"name\" value=\"");
 out.println(rs.getString("name")); 
      out.write("\" required=\"\" id=\"name-header15-1g\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div data-for=\"dName\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                           <label class=\"control-label\" for=\"date\">Display Name</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control px-3\" name=\"dName\" value=\"");
 out.println(rs.getString("displayName")); 
      out.write("\" required=\"\" id=\"name-header15-1g\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div data-for=\"address\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                           <label class=\"control-label\" for=\"date\">Address</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control px-3\" name=\"address\" value=\"");
 out.println(rs.getString("address")); 
      out.write("\" required=\"\" id=\"name-header15-1g\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    </div>\n");
      out.write("                    <div data-for=\"phone\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                           <label class=\"control-label\" for=\"date\">Phone</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control px-3\" name=\"phone\" value=\"");
 out.println(rs.getString("phone")); 
      out.write("\" required=\"\" id=\"name-header15-1g\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div data-for=\"email\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                           <label class=\"control-label\" for=\"date\">Email</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control px-3\" name=\"email\" value=\"");
 out.println(rs.getString("email")); 
      out.write("\" required=\"\" id=\"name-header15-1g\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"control-label\" for=\"date\">Replace Event Image</label>\n");
      out.write("                            <input type=\"file\" name=\"file\"/>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <input type=\"hidden\" name=\"userID\" value=\"");
 out.println(x);
      out.write("\">\n");
      out.write("\n");
      out.write("                    <span class=\"input-group-btn\" style=\"margin-bottom: 2vw;\">\n");
      out.write("                    <button type=\"submit\" name=\"submit\" value=\"submit\" class=\"btn btn-secondary btn-form display-4\">Update Profile</button>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                </span>\n");
      out.write("                \n");
      out.write("                </form>\n");
      out.write("           \n");
      out.write("        </div>\n");
      out.write("                    </div>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("            </div>      \n");
      out.write("</section>\n");
      out.write("\n");
      out.write("<section class=\"cid-qXN4d8XEnV\" id=\"pricing-tables1-1r\">\n");
      out.write("\n");
      out.write("    \n");
      out.write("\n");
      out.write("    \n");
      out.write("    <div class=\"container align-center\">\n");
      out.write("       <h2 class=\"mbr-section-title pb-3 mbr-fonts-style display-2\">\n");
      out.write("            Registered Events\n");
      out.write("        </h2>\n");
      out.write("        <div class=\"\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("            \n");
      out.write("            ");

            Core cs = new Core(); 
            ResultSet rs2 = cs.getUserRegEvents(x);
            ResultSet rs3 = null;
            while(rs2.next()){
                rs3 = cs.getEventDetails(rs2.getInt("eventID"));
                rs3.next();
                
      out.write("\n");
      out.write("                \n");
      out.write("                <a href=\"events.jsp?event=");
      out.print(rs2.getInt("eventID"));
      out.write("\">\n");
      out.write("            <div class=\" plan col-12 mx-2 my-2 justify-content-center col-lg-3\">\n");
      out.write("                <div class=\"plan-header text-center pt-5\">\n");
      out.write("                    <h3 class=\"plan-title mbr-fonts-style display-5\">\n");
      out.write("                        ");
 out.println(rs3.getString("eventName")); 
      out.write("\n");
      out.write("                    </h3>\n");
      out.write("                    <div class=\"plan-price\">\n");
      out.write("                        ----------\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"plan-body pb-5\">\n");
      out.write("                    <div class=\"plan-list align-center\">\n");
      out.write("                        <ul class=\"list-group list-group-flush mbr-fonts-style display-7\">\n");
      out.write("                            <li class=\"list-group-item\">\n");
      out.write("                                Venue: ");
 out.println(rs3.getString("venue")); 
      out.write("\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"list-group-item\">\n");
      out.write("                                Date: ");
 out.println(rs3.getString("date")); 
      out.write("\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"list-group-item\">\n");
      out.write("                                Category: ");
 out.println(rs3.getString("category")); 
      out.write("\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"mbr-section-btn text-center pt-4\">\n");
      out.write("                        <a href=\"#\" class=\"btn btn-secondary display-4 disabled\">");
 out.println(rs2.getString("opinion")); 
      out.write("</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("                </a>\n");
      out.write("                    \n");
      out.write("                        ");

                            }
                            
      out.write("\n");
      out.write("\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                ");

                    }
                    
                    
      out.write("\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../includes/layout/footer.jsp", out, false);
      out.write("\n");
      out.write("                   <script>\n");
      out.write("                    \n");
      out.write("            \n");
      out.write("        \n");
      out.write("        function showEdit() {\n");
      out.write("            var x = document.getElementById(\"editForm\");\n");
      out.write("           \n");
      out.write("            if (x.style.display === \"none\") {\n");
      out.write("                x.style.display = \"block\";\n");
      out.write("                \n");
      out.write("            } else {\n");
      out.write("                x.style.display = \"none\";\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("        }       \n");
      out.write("                       \n");
      out.write("                       </script> \n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
