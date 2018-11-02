<%-- 
    Document   : adminIndex
    Created on : Jul 15, 2018, 11:07:28 PM
    Author     : ASUS
--%>

    <%@page import="java.sql.ResultSet"%>
<%@page import="classes.User"%>
<jsp:include page="../includes/layout/headerSite.jsp">
        <jsp:param name="title" value="SL EVENTS" />
    </jsp:include>

 <% 
     
               
                if(session.getAttribute("type") == null ){
                   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                   rd.forward(request, response);
        }
                 String type = session.getAttribute("type").toString();
               
                if(!type.equals("admin")){
                   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                   rd.forward(request, response);
        }
                
%>

    <jsp:include page="../includes/layout/adminNav.jsp" />



    <section class="engine"><a href="https://mobirise.me/y">html site templates</a></section>
    <section class="section-table cid-qXq5479QUf" id="table1-1i">
    
    


        <div class="container container-table">
            <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">
                Table
            </h2>

            <div class="table-wrapper">
                <div class="container">
                    <div class="row search">
                        <div class="col-md-6"></div>
                        <div class="col-md-6">
                            <div class="dataTables_filter">
                                <label class="searchInfo mbr-fonts-style display-7">Search:</label>
                                <input class="form-control input-sm" disabled="">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <table class="table isSearch" cellspacing="0">
                        <thead>
                            <tr class="table-heads ">




                                <th class="head-item mbr-fonts-style display-7">
                                    NAME</th>
                                <th class="head-item mbr-fonts-style display-7">
                                    Display Name</th>
                                <th class="head-item mbr-fonts-style display-7">
                                    Address</th>
                                <th class="head-item mbr-fonts-style display-7">
                                    Phone</th>
                                <th class="head-item mbr-fonts-style display-7">
                                    Email</th>
                                <th class="head-item mbr-fonts-style display-7">
                                    Type</th>
                                <th class="head-item mbr-fonts-style display-7">
                                    User Image</th>
                                <th class="head-item mbr-fonts-style display-7" style="padding:2vw">
                                    Approval</th>
                                <th class="head-item mbr-fonts-style display-7" style="padding:2vw">
                                    </th>
                            </tr>
                        </thead>

                        <tbody>
                                
                            <%
                            int count = 0;
            User us = new User();
            ResultSet rs = us.getUserDetails();
            
        while(rs.next()){
            
        %>



                            <tr>




                                <td class="body-item mbr-fonts-style display-7"><% out.println(rs.getString("name")); %></td>
                                <td class="body-item mbr-fonts-style display-7"><% out.println(rs.getString("displayName")); %></td>
                                <td class="body-item mbr-fonts-style display-7"><% out.println(rs.getString("address")); %></td>
                                <td class="body-item mbr-fonts-style display-7"><% out.println(rs.getString("phone")); %></td>
                                <td class="body-item mbr-fonts-style display-7"><% out.println(rs.getString("email")); %></td>
                                <td class="body-item mbr-fonts-style display-7"><% out.println(rs.getString("type")); %></td>
                                <td class="body-item mbr-fonts-style display-7"></td>
                                <td class="body-item mbr-fonts-style display-7">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            
                                            <%
                                                String act1 = "",act2 = "";
                                            if("approved".equalsIgnoreCase(rs.getString("approval"))){
                                                act1 = "active";
                                            }
                                            if("disapproved".equalsIgnoreCase(rs.getString("approval"))){
                                                act2 = "active";
                                            }
                                                    
                                                    
                                                    %>
                                                    
                                                    
                                                    
                                            <a class="btn-sm btn-outline-primary mbr-iconfont mbri-success <%=act1%>" href="../AdminApprove?app=true&id=<% out.println(rs.getString("userID")); %>"></a>
                                        </div>
                                        <div class="col-sm-6">
                                            <a class="btn-sm btn-outline-danger mbr-iconfont mbri-close <%=act2%>" href="../AdminApprove?app=false&id=<% out.println(rs.getString("userID")); %>"></a>
                                        </div>
                                    </div>
                                </td>
                                <td class="body-item mbr-fonts-style display-7">
                                    <div class="row">

               <a class="btn-sm btn-outline-succcess" onclick="showEdit<%=count%>()">Edit</a>
             

    <a class="btn-sm btn-outline-danger" href="../AdminEditUser?id=<% out.println(rs.getInt("userID"));%>">Delete</a>
</div>
                                    </div>
                                </td>
                                
                                
                                
                                
     <div id="<%=count%>" style="display: none" class="container align-center">
                        <div class="card">
        <div class="form-container">
           
                <form method="post" action="../AdminEditUser" enctype="multipart/form-data" class="mbr-form"> 
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
                        
                        <input type="hidden" name="userID" value="<% out.println(rs.getString("userID"));%>">

                    <span class="input-group-btn" style="margin-bottom: 2vw;">
                    <button type="submit" name="submit" value="submit" class="btn btn-secondary btn-form display-4">Update User</button>
                    
                    
                </span>
                
                </form>
           
        </div>
                    </div>
                        
                        
    
                                
                                
                            </tr>
                            
                            
                            <%
                                count++;
                                }
                                %>
                        </tbody>
                    </table>
                </div>
                <div class="container table-info-container">
                    <div class="row info">
                        <div class="col-md-6">
                            <div class="dataTables_info mbr-fonts-style display-7">
                                <span class="infoBefore">Showing</span>
                                <span class="inactive infoRows"></span>
                                <span class="infoAfter">entries</span>
                                <span class="infoFilteredBefore">(filtered from</span>
                                <span class="inactive infoRows"></span>
                                <span class="infoFilteredAfter"> total entries)</span>
                            </div>
                        </div>
                        <div class="col-md-6"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>


  
  <script src="../assets/web/assets/jquery/jquery.min.js"></script>
  <script src="../assets/popper/popper.min.js"></script>
  <script src="../assets/tether/tether.min.js"></script>
  <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="../assets/smoothscroll/smooth-scroll.js"></script>
  <script src="../assets/dropdown/js/script.min.js"></script>
  <script src="../assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="../assets/theme/js/script.js"></script>
  <script src="../assets/formoid/formoid.min.js"></script>
    
    
    <script>
                    
            <%
                for(int i = 0;i<=count;i++){
                %>
        
        function showEdit<%=i%>() {
            var x = document.getElementById("<%=i%>");
           
            if (x.style.display === "none") {
                x.style.display = "block";
                
            } else {
                x.style.display = "none";
                
            }
        }       
                <%
                }
                    %>
                       
                       </script> 
    


    </body>

    </html>
