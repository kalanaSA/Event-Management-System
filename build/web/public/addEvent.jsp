<%@page import="classes.Core"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <jsp:include page="../includes/layout/headerSite.jsp">
                <jsp:param name="title" value="My Event" />
            </jsp:include>
            
            <% 
Core functions = new Core();
    
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

<div class="container" style="padding: 2vw;"></div>

<section class="tabs3 cid-qXpKuOihob features18 popup-btn-cards cid-qXpJxHxTlO" id="tabs3-a">

                        <div class="container">
                            <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-2">
                                My Events
                                
                            </h2>
                            
                            <h3 class="mbr-section-subtitle  display-5 align-center mbr-light mbr-fonts-style">
                               Events by category
                            </h3>
                        </div>
                        <div class="container-fluid">
                            <div class="row tabcont">
                                <ul class="nav nav-tabs pt-3 mt-5" role="tablist">

                                    <%
            int count = 0;
            ResultSet rs = functions.getCategoryList();
            while(rs.next()){
                
               
                
                %>
                                        <li class="nav-item mbr-fonts-style">
                                            <a class="nav-link active show display-7" role="tab" data-toggle="tab" href="#tabs3-a_tab<%=String.valueOf(count)%>" aria-selected="true">
                                                <%out.println(rs.getString("category"));%>
                                            </a>
                                        </li>



                                        <%
                    count++;
            }
            %>
                                    <li class="nav-item mbr-fonts-style">
                                            <a class="nav-link active show display-7 btn-secondary" role="tab" data-toggle="tab" href="#tabs3-a_tab<%=String.valueOf(count)%>" aria-selected="true">
                                                Add a new Event
                                            </a>
                                        </li>




                                </ul>
                            </div>
                        </div>
                
                        
                        
                        
                        <div class="container" id="eventView">
                            <div class="row px-1">
                                <div class="tab-content">
                                   <%
                                   int i = 0;
                                   for(i=0;i<count;i++){
                                       %>
                                    <div id="tab<%=String.valueOf(i+1)%>" class="tab-pane in active mbr-table" role="tabpanel">
                                        <div class="row tab-content-row">
                                            <%
                                                int user = (Integer)session.getAttribute("userID");
            ResultSet rs2 = functions.getItemsByCategoryForUser(i,user);
            while(rs2.next()){
            %>
                             
                                                <div class="card p-3 col-12 col-md-6 col-lg-4">
                <div class="card-wrapper">
                    <div class="card-img">
                        <img src="../assets/images/<%out.print(rs2.getString("eventImage")); %>" alt="Mobirise">
                    </div>
                    <div class="card-box">
                        <h4 class="card-title mbr-fonts-style display-7">
                            <%out.print(rs2.getString("eventName")); %>
                        </h4>
                        <p class="mbr-text mbr-fonts-style display-7">
                            <%out.print(rs2.getString("venue")); %>
                        </p>
                        <p class="mbr-text mbr-fonts-style display-7">
                            <%out.print(rs2.getString("date")); %>
                        </p>
                    </div>
                    
                    <div class="btn btn-small">
                        <button class="btn btn-primary btn-small display-4" onclick="showEdit()">
                            Edit Event
                        </button>
                        
                    </div>
                    
                    <%
            ResultSet rsx = functions.getEventDetails(rs2.getInt("eventID"));
            while(rsx.next()){
            %>
                            
                                                 
<!--                                /*--------Edit Form -----------------*/-->
                                <div id="editForm" style="display: none" class="container align-center editForms">
                        <div class="card">
        <div class="form-container">
           
                <form method="post" action="../EditEvent" enctype="multipart/form-data" class="mbr-form"> 
                    <div data-for="eName">
                        <div class="form-group">
                           <label class="control-label" for="date">Event Name</label>
                            <input type="text" class="form-control px-3" name="eName" value="<% out.println(rsx.getString("eventName")); %>" required="" id="name-header15-1g">
                        </div>
                    </div>
                    <div data-for="venue">
                        <div class="form-group">
                           <label class="control-label" for="date">Venue</label>
                            <input type="text" class="form-control px-3" name="venue" value="<% out.println(rsx.getString("venue")); %>" required="" id="name-header15-1g">
                        </div>
                    </div>
                    <div data-for="date">
                        <div class="form-group"> <!-- Date input -->
        <label class="control-label" for="date">Date</label>
        <input class="form-control" id="date" name="date"  value="<% out.println(rsx.getString("date")); %>" type="text"/>
      </div>
                    </div>
                    <div data-for="desc">
                        <div class="form-group">
                           <label class="control-label" for="date">Event Description</label>
                            <textarea type="text" class="form-control" name="desc" rows="5" id="message-form1-14"><% out.println(rsx.getString("Description")); %></textarea>
                        </div>
                    </div>
                    <div data-for="category">
                        <div class="form-group">
                           <label class="control-label" for="date">Category</label>
                            <input type="text" class="form-control px-3" name="category" value="<% out.println(rsx.getString("category")); %>" required="" id="name-header15-1g">
                        </div>
                    </div>
                    
                        <div class="form-group">
                            <label class="control-label" for="date">Replace Event Image</label>
                            <input type="file" name="file"/>
                        </div>
                        
                        <input type="hidden" name="eventID" value="<% out.println(rs2.getInt("eventID"));%>">

                    <span class="input-group-btn" style="margin-bottom: 2vw;">
                    <button type="submit" name="submit" value="submit" class="btn btn-secondary btn-form display-4">Update event</button>
                    
                    
                </span>
                
                </form>
           
        </div>
                    </div>
                    </div>
                                <%
            }
            %>
                               
<!--                               -----------------End pf edit form----------*/-->
                        
                    
                    
                    <div class="btn btn-small">
                        <a href="../EditEvent?id=<% out.println(rs2.getInt("eventID"));%>" class="btn btn-secondary btn-small display-4">
                            Delete Event
                        </a>
                    </div>
                </div>
            </div>

                                            <%
                                                   }
           
                                                        %>


                                        </div>
                                    </div>
<%
                                   }
           
            %>              
<div id="tab<%=String.valueOf(i)%>" class="tab-pane in active mbr-table" role="tabpanel">

    <div class="card p-3 col-12 col-md-6 col-lg-4">
        <div class="form-container">
           
                <form method="post" action="../AddEvent" enctype="multipart/form-data" class="mbr-form"> 
                    <div data-for="eName">
                        <div class="form-group">
                           <label class="control-label" for="date">Event Name</label>
                            <input type="text" class="form-control px-3" name="eName" placeholder="Event Name" required="" id="name-header15-1g">
                        </div>
                    </div>
                    <div data-for="venue">
                        <div class="form-group">
                           <label class="control-label" for="date">Venue</label>
                            <input type="text" class="form-control px-3" name="venue" placeholder="Event venue" required="" id="name-header15-1g">
                        </div>
                    </div>
                    <div data-for="date">
                        <div class="form-group"> <!-- Date input -->
        <label class="control-label" for="date">Date</label>
        <input class="form-control" id="date" name="date" placeholder="YYYY-MM-DD" type="text"/>
      </div>
                    </div>
                    <div data-for="desc">
                        <div class="form-group">
                           <label class="control-label" for="date">Event Description</label>
                            <textarea type="text" class="form-control" name="desc" rows="5" id="message-form1-14"></textarea>
                        </div>
                    </div>
                    <div data-for="category">
                        <div class="form-group">
                           <label class="control-label" for="date">Category</label>
                            <input type="text" class="form-control px-3" name="category" placeholder="Category" required="" id="name-header15-1g">
                        </div>
                    </div>
                    
                        <div class="form-group">
                            <label class="control-label" for="date">Event Image</label>
                            <input type="file" name="file"/>
                        </div>
                   
                    
                    
                    
                    <input type="hidden" name="userID" value="<% out.println((Integer)session.getAttribute("userID"));%>">
                    <input type="hidden" name="type" value="<% out.println((String)session.getAttribute("type"));%>">
                    
                    

                    <span class="input-group-btn">
                    <button type="submit" name="submit" value="submit" class="btn btn-secondary btn-form display-4">Add event</button>
                    
                    
                </span>
                </form>
           
        </div>
                    </div>
                </div>
                     </div>
                                    </div>
                                </div>
                                
                                <div class="container" id="addEventView">
                                    
                                </div>
       
                                
                                
                                
                            
                    </section>
                    
                    
                    
                    
                    

<section class="cid-qXpVyupxbK mbr-fullscreen" id="header15-1g">

    

    

    <div class="container align-right">
<div class="row">
    <div class="mbr-white col-lg-8 col-md-7 content-container">
        <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">
            INTRO WITH FORM
        </h1>
        <p class="mbr-text pb-3 mbr-fonts-style display-5">
            Click any text to edit or style it. Select text to insert a link. Click blue "Gear" icon in the top right corner to hide/show  text, title and change the block or form background. Click red "+" in the bottom right corner to add a new block. Use the top left menu to create new pages, sites and add themes.
        </p>
    </div>
    <div class="col-lg-4 col-md-5">
    <div class="form-container">
        <div class="media-container-column" data-form-type="formoid">
            <div data-form-alert="" hidden="" class="align-center">
                Thanks for filling out the form!
            </div>
            <form class="mbr-form" action="https://mobirise.com/" method="post" data-form-title="Mobirise Form"><input type="hidden" name="email" data-form-email="true" value="IklTOTLjubWfNMshoBCD2+uqfvqPbvlKKsTKXAHqwEpXuYHcfLH208hbUb3EPJc7KN/l3419dJtOr4Yl2Idk0yS1CWH4cJ1eZqHvBNugb+glaUMKJ2EzPQxWo6RePpH8" data-form-field="Email">
                <div data-for="name">
                    <div class="form-group">
                        <input type="text" class="form-control px-3" name="name" data-form-field="Name" placeholder="Name" required="" id="name-header15-1g">
                    </div>
                </div>
                <div data-for="email">
                    <div class="form-group">
                        <input type="email" class="form-control px-3" name="email" data-form-field="Email" placeholder="Email" required="" id="email-header15-1g">
                    </div>
                </div>
                <div data-for="phone">
                    <div class="form-group">
                        <input type="tel" class="form-control px-3" name="phone" data-form-field="Phone" placeholder="Phone" id="phone-header15-1g">
                    </div>
                </div>
                
                <span class="input-group-btn">
                    <button href="" type="submit" class="btn btn-secondary btn-form display-4">SEND FORM</button>
                </span>
            </form>
        </div>
    </div>
    </div>
</div>
    </div>
    <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
        <a href="#next">
            <i class="mbri-down mbr-iconfont"></i>
        </a>
    </div>
</section>





<jsp:include page="../includes/layout/footer.jsp" />

<script>
    
    $(function() {
  var availableTags = [
    "ActionScript", "AppleScript", "Asp", "BASIC", "C", "C++",
    "Clojure", "COBOL", "ColdFusion", "Erlang", "Fortran",
    "Groovy", "Haskell", "Java", "JavaScript", "Lisp", "Perl",
    "PHP", "Python", "Ruby", "Scala", "Scheme"
  ];
  
  $(".autocomplete").autocomplete({
    source: availableTags
  });
});
                                    
                                    </script>
                                    
                                    
                                    <script>
                    
            
        
        function showEdit() {
            var x = document.getElementsByClassName("editForms");
           for(var i=0;i<x.length;i++){
               if (x[i].style.display === "none") {
                x[i].style.display = "block";
                
            } else {
                x[i].style.display = "none";
                
            }
           }
            
        }       
                       
                       </script> 


                                    
    
                                    