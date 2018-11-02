<%@page import="classes.User"%>
<%@page import="classes.IdeaHub"%>
<%@page import="classes.Core"%>
    <%@page import="java.sql.ResultSet"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
            <jsp:include page="../includes/layout/headerSite.jsp">
                <jsp:param name="title" value="IdeaHub | SL EVENTS" />
            </jsp:include>

            
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

  <jsp:include page="../includes/layout/nav.jsp" />

<section class="engine"><a href="https://mobirise.me">Mobirise</a></section><section class="mbr-section content4 cid-qXpT8rXR9E" id="content4-16">

    <%
        User usr = new User();
        ResultSet usdr = null;
        IdeaHub ih = new IdeaHub();
        ResultSet rs = ih.getIdeaDetails(Integer.parseInt(request.getParameter("id")));
        while(rs.next()){
            usdr = usr.getDetailsByID(rs.getString("userID"));
            usdr.next();
        %>

    <div class="container">
        <div class="media-container-row">
            <div class="title col-12 col-md-8">
                <h2 class="align-center pb-3 mbr-fonts-style display-2">
                    <% out.println(rs.getString("ideaTitle")); %>
                </h2>
                <h3 class="mbr-section-subtitle pb-5 mbr-fonts-style display-5 text-center">
                    By
                    <% out.println(usdr.getString("displayName")); %>
                </h3>
                
                
            </div>
        </div>
    </div>
</section>

<section class="mbr-section article content9 cid-qXpTALwFA9" id="content9-18">
    
     

    <div class="container">
        <div class="inner-container" style="width: 100%;">
            <hr class="line" style="width: 25%;">
            <div class="section-text align-center mbr-fonts-style display-5">
                   <% out.println(rs.getString("ideaDesc")); %>
                </div>
            <hr class="line" style="width: 25%;">
        </div>
        </div>
</section>

<section class="mbr-section form1 cid-qXpSvD4oAP" id="form1-14">

    

    
    <div class="container">
        <div class="row justify-content-center">
            <div class="title col-12 col-lg-8">
                <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2">
                    Add a Comment</h2>
                
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="media-container-column col-lg-8">
                    
            
                    <form class="mbr-form" action="../IdeaHubServlet" method="post">
                       
                        
                        <div class="form-group">
                            <label class="form-control-label mbr-fonts-style display-7" for="message-form1-14">Comment</label>
                            <textarea type="text" class="form-control" name="message" rows="5" data-form-field="Message" id="message-form1-14"></textarea>
                            <input type="hidden" name="userID" value="<% out.println((Integer)session.getAttribute("userID"));%>">
                            <input type="hidden" name="ideaID" value="<% out.println(request.getParameter("id"));%>">
                        </div>
            
                        <span class="input-group-btn">
                            <button name="comment" value="comment" type="submit" class="btn btn-primary btn-form display-4">SEND</button>
                        </span>
                    </form>
            </div>
        </div>
    </div>
</section>


<% }

%>

<section class="testimonials4 cid-qXpRPPihC9" id="testimonials4-13">

  

  
  <div class="container">
    <h2 class="pb-3 mbr-fonts-style mbr-white align-center display-2">
        Comments</h2>
    
    <div class="col-md-10 testimonials-container"> 
      
        <%
            User us = new User();
            ResultSet usd = null;
            ResultSet rs2 = ih.getComments(request.getParameter("id"));
            
        while(rs2.next()){
            usd = us.getDetailsByID(rs2.getString("userID"));
            usd.next();
        %>
           
      
    <div class="testimonials-item">
        <div class="user row">
          <div class="col-lg-3 col-md-4">
            <div class="user_image">
              <img src="../assets/images/<% out.println(usd.getString("userImage")); %>">
            </div>
          </div>
          <div class="testimonials-caption col-lg-9 col-md-8">
            <div class="user_text ">
              <p class="mbr-fonts-style  display-7">
                 <em><% out.println(rs2.getString("comment")); %></em>
              </p>
            </div>
            <div class="user_name mbr-bold mbr-fonts-style align-left pt-3 display-7">
                <% out.println(usd.getString("displayName")); %>
            </div>
            <div class="user_desk mbr-light mbr-fonts-style align-left pt-2 display-7">
                 <% out.println(usd.getString("type")); %>
            </div>
          </div>
        </div>
      </div>
            
                 <% 
                     }
                     %>
       
       </div>
  </div>
</section>


<jsp:include page="../includes/layout/footer.jsp" />
