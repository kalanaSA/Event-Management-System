 <%@page import="classes.Core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <jsp:include page="../includes/layout/headerSite.jsp">
                <jsp:param name="title" value="My Profile | SL EVENTS" />
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
                
    User us = new User();
                
                %>
  <jsp:include page="../includes/layout/nav.jsp" />

<section class="engine"><a href="https://mobirise.me/s">bootstrap themes</a></section>
    
    <section class="features11 cid-qXN3Csj43V" id="features11-1p">

        <%
            Integer x = (Integer)session.getAttribute("userID");
            ResultSet rs = us.getDetailsByID(x);
            while(rs.next()){
                
           
                %>
    

    <div class="container">   
        <div class="col-md-12">
            <div class="media-container-row">
                <div class="mbr-figure" style="width: 50%;">
                    <img src="../assets/images/<% out.println(rs.getString("userImage")); %>" alt="Mobirise">
                </div>
                <div class=" align-left aside-content">
                    <h2 class="mbr-title pt-2 mbr-fonts-style display-2">
                        <% out.println(rs.getString("displayName")); %>
                    </h2>
                    <div class="mbr-section-text">
                        <p class="mbr-text mb-5 pt-3 mbr-light mbr-fonts-style display-5">
                        Institute Type : <% out.println(rs.getString("type").toUpperCase()); %>
                        </p>
                    </div>

                    <div class="block-content">
                        <div class="card p-3 pr-3">
                            <div class="media">
                                <div class=" align-self-center card-img pb-3">
                                    <span class="mbr-iconfont mbri-arrow-down"></span>
                                </div>     
                                <div class="media-body">
                                    <h4 class="card-title mbr-fonts-style display-7">
                                        Name
                                    </h4>
                                </div>
                            </div>                

                            <div class="card-box">
                                <p class="block-text mbr-fonts-style display-7">
                                  <% out.println(rs.getString("name")); %>
                                </p>
                            </div>
                        </div>
                        <div class="block-content">
                        <div class="card p-3 pr-3">
                            <div class="media">
                                <div class=" align-self-center card-img pb-3">
                                    <span class="mbr-iconfont mbri-arrow-down"></span>
                                </div>     
                                <div class="media-body">
                                    <h4 class="card-title mbr-fonts-style display-7">
                                        Address
                                    </h4>
                                </div>
                            </div>                

                            <div class="card-box">
                                <p class="block-text mbr-fonts-style display-7">
                                  <% out.println(rs.getString("address")); %>
                                </p>
                            </div>
                        </div>
                        <div class="block-content">
                        <div class="card p-3 pr-3">
                            <div class="media">
                                <div class=" align-self-center card-img pb-3">
                                    <span class="mbr-iconfont mbri-arrow-down"></span>
                                </div>     
                                <div class="media-body">
                                    <h4 class="card-title mbr-fonts-style display-7">
                                        Phone
                                    </h4>
                                </div>
                            </div>                

                            <div class="card-box">
                                <p class="block-text mbr-fonts-style display-7">
                                  <% out.println(rs.getString("phone")); %>
                                </p>
                            </div>
                        </div>
                        <div class="block-content">
                        <div class="card p-3 pr-3">
                            <div class="media">
                                <div class=" align-self-center card-img pb-3">
                                    <span class="mbr-iconfont mbri-arrow-down"></span>
                                </div>     
                                <div class="media-body">
                                    <h4 class="card-title mbr-fonts-style display-7">
                                        Email
                                    </h4>
                                </div>
                            </div>                

                            <div class="card-box">
                                <p class="block-text mbr-fonts-style display-7">
                                  <% out.println(rs.getString("email")); %>
                                </p>
                            </div>
                        </div>        
                                

                        
                    </div>
                </div>
            </div>
        </div> 
    </div>    
                </div>
                <div class="container">
        <div class="media-container-row title">
            <div class="col-12 col-md-8">
                <div class="mbr-section-btn align-center">
                  
                   <button class="btn btn-primary-outline display-4" onclick="showEdit()">Edit Profile</button>
                    
                </div>
            </div>
        </div>
    </div>
           
           <div id="editForm" style="display: none" class="container align-center">
                        <div class="card">
        <div class="form-container">
           
                <form method="post" action="../EditProfile" enctype="multipart/form-data" class="mbr-form"> 
                    <div data-for="name">
                        <div class="form-group">
                           <label class="control-label" for="date">Name</label>
                            <input type="text" class="form-control px-3" name="name" value="<% out.println(rs.getString("name")); %>" required="" id="name-header15-1g">
                        </div>
                    </div>
                    <div data-for="dName">
                        <div class="form-group">
                           <label class="control-label" for="date">Display Name</label>
                            <input type="text" class="form-control px-3" name="dName" value="<% out.println(rs.getString("displayName")); %>" required="" id="name-header15-1g">
                        </div>
                    </div>
                    <div data-for="address">
                        <div class="form-group">
                           <label class="control-label" for="date">Address</label>
                            <input type="text" class="form-control px-3" name="address" value="<% out.println(rs.getString("address")); %>" required="" id="name-header15-1g">
                        </div>
                    </div>
                    
                    </div>
                    <div data-for="phone">
                        <div class="form-group">
                           <label class="control-label" for="date">Phone</label>
                            <input type="text" class="form-control px-3" name="phone" value="<% out.println(rs.getString("phone")); %>" required="" id="name-header15-1g">
                        </div>
                    </div>
                    <div data-for="email">
                        <div class="form-group">
                           <label class="control-label" for="date">Email</label>
                            <input type="text" class="form-control px-3" name="email" value="<% out.println(rs.getString("email")); %>" required="" id="name-header15-1g">
                        </div>
                    </div>
                    
                        <div class="form-group">
                            <label class="control-label" for="date">Replace Event Image</label>
                            <input type="file" name="file"/>
                        </div>
                        
                        <input type="hidden" name="userID" value="<% out.println(x);%>">

                    <span class="input-group-btn" style="margin-bottom: 2vw;">
                    <button type="submit" name="submit" value="submit" class="btn btn-secondary btn-form display-4">Update Profile</button>
                    
                    
                </span>
                
                </form>
           
        </div>
                    </div>
                    </div>
                    
            </div>      
</section>

<section class="cid-qXN4d8XEnV" id="pricing-tables1-1r">

    

    
    <div class="container align-center">
       <h2 class="mbr-section-title pb-3 mbr-fonts-style display-2">
            Registered Events
        </h2>
        <div class="">
            <div class="row">
            
            <%
            Core cs = new Core(); 
            ResultSet rs2 = cs.getUserRegEvents(x);
            ResultSet rs3 = null;
            while(rs2.next()){
                rs3 = cs.getEventDetails(rs2.getInt("eventID"));
                rs3.next();
                %>
                
                <a href="events.jsp?event=<%=rs2.getInt("eventID")%>">
            <div class=" plan col-12 mx-2 my-2 justify-content-center col-lg-3">
                <div class="plan-header text-center pt-5">
                    <h3 class="plan-title mbr-fonts-style display-5">
                        <% out.println(rs3.getString("eventName")); %>
                    </h3>
                    <div class="plan-price">
                        ----------
                    </div>
                </div>
                <div class="plan-body pb-5">
                    <div class="plan-list align-center">
                        <ul class="list-group list-group-flush mbr-fonts-style display-7">
                            <li class="list-group-item">
                                Venue: <% out.println(rs3.getString("venue")); %>
                            </li>
                            <li class="list-group-item">
                                Date: <% out.println(rs3.getString("date")); %>
                            </li>
                            <li class="list-group-item">
                                Category: <% out.println(rs3.getString("category")); %>
                            </li>
                        </ul>
                    </div>
                    <div class="mbr-section-btn text-center pt-4">
                        <a href="#" class="btn btn-secondary display-4 disabled"><% out.println(rs2.getString("opinion")); %></a>
                    </div>
                </div>
            </div>
                </a>
                    
                        <%
                            }
                            %>

            
        </div>
        
        
        </div>
        
    </div>
</section>
                
                
                
                <%
                    }
                    
                    %>
                    
                    
                    <jsp:include page="../includes/layout/footer.jsp" />
                   <script>
                    
            
        
        function showEdit() {
            var x = document.getElementById("editForm");
           
            if (x.style.display === "none") {
                x.style.display = "block";
                
            } else {
                x.style.display = "none";
                
            }
        }       
                       
                       </script> 

