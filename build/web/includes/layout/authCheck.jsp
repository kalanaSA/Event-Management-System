<%-- 
    Document   : authCheck
    Created on : Jul 13, 2018, 7:16:50 PM
    Author     : ASUS
--%>

<% 
                if(session.getAttribute("auth") == null ){
                   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                   rd.forward(request, response);
        }
                if(!(Boolean)session.getAttribute("auth")){
    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                   rd.forward(request, response);
}
                
%>