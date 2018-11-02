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

<section class="engine"><a href="#">website templates</a></section><section class="timeline1 cid-qXpQvA5hnI" id="timeline1-v">

    
    
    

    <div class="container align-center">
        <h2 class="mbr-section-title pb-3 mbr-fonts-style display-2">
            IdeaHub
        </h2>
        <h3 class="mbr-section-subtitle pb-5 mbr-fonts-style display-5">
            Welcome to IdeaHub
        </h3>

        <div class="container timelines-container" mbri-timelines="">
            
            <%
                int userID = (Integer)session.getAttribute("userID");
        IdeaHub ih = new IdeaHub();
        ResultSet rs = ih.getIdeaDetails();
        while(rs.next()){
        
        %>
            
        <a href="ideaHubOne.jsp?id=<%= rs.getInt("ideaID") %>">
            <div class="row timeline-element reverse separline">
                <div class="timeline-date-panel col-xs-12 col-md-6  align-left">
                    <div class="time-line-date-content">
                       <p class="mbr-timeline-date mbr-fonts-style display-5">
                           <% out.println(rs.getString("date")); %>
                        </p>
                    </div>
                </div>
                <span class="iconBackground"></span>
                <div class="col-xs-12 col-md-6 align-right">
                    <div class="timeline-text-content">
                        <h4 class="mbr-timeline-title pb-3 mbr-fonts-style display-5">
                            <% out.println(rs.getString("ideaTitle")); %>
                        </h4>
                        <p class="mbr-timeline-text mbr-fonts-style display-7">
                            <% out.println(rs.getString("ideaDesc")); %>
                        </p>
                    </div>
                </div>
            </div>
            </a>
                        
                        <% 
                            
                if(rs.next()){ %>
            
                        <a href="ideaHubOne.jsp?id=<%= rs.getInt("ideaID") %>">
            <div class="row timeline-element">
                <div class="timeline-date-panel col-xs-12 col-md-6 align-right">
                    <div class="time-line-date-content">
                        <p class="mbr-timeline-date mbr-fonts-style display-5">
                           <% out.println(rs.getString("date")); %>
                        </p>
                    </div>
                </div>
                <span class="iconBackground"></span>
                <div class="col-xs-12 col-md-6 align-left ">
                    <div class="timeline-text-content">
                        <h4 class="mbr-timeline-title pb-3 mbr-fonts-style display-5">
                            <% out.println(rs.getString("ideaTitle")); %>
                        </h4>
                        <p class="mbr-timeline-text mbr-fonts-style display-7">
                            <% out.println(rs.getString("ideaDesc")); %>
                        </p>
                    </div>
                </div>
            </div>
                        </a>
                        <% 
                            
                } %>
            
        
        <%
            }
            %>
            
            
        </div>
    </div>
    
    
    
     <div class="container">
        <div class="media-container-row title">
            <div class="col-12 col-md-8">
                <div class="mbr-section-btn align-center">
                  
                   <button class="btn btn-primary-outline display-4" onclick="showAdd()">New Idea</button>
                    
                </div>
            </div>
        </div>
    </div>
            
           
           <div id="editForm" style="display: none" class="container align-center">
                        <div class="card">
        <div class="form-container">
           
                <form method="post" action="../IdeaHubAddNew"> 
                    <div data-for="name">
                        <div class="form-group">
                           <label class="control-label" for="date">Idea Title</label>
                            <input type="text" class="form-control px-3" name="title" required="" id="name-header15-1g">
                        </div>
                    </div>
                    <div data-for="dName">
                        <div class="form-group">
                           <label class="control-label" for="date">Idea Description</label>
                            <textarea type="text" class="form-control" name="desc" rows="5" id="message-form1-14"></textarea>
                        </div>
                    </div>
                    <input type="hidden" class="form-control px-3" name="userID" value="<%=userID%>">
                    
                    <span class="input-group-btn" style="margin-bottom: 2vw;">
                    <button type="submit" name="submit" value="submit" class="btn btn-secondary btn-form display-4">Add Idea</button>
                    
                    
                </span>
                
                </form>
           
        </div>
                    </div>
    
    
    
    
</section>


<jsp:include page="../includes/layout/footer.jsp" />


<script>
                    
            
        
        function showAdd() {
            var x = document.getElementById("editForm");
           
            if (x.style.display === "none") {
                x.style.display = "block";
                
            } else {
                x.style.display = "none";
                
            }
        }       
                       
                       </script> 






