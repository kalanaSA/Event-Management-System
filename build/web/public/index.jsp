<%@page import="classes.Core"%>
    <%@page import="java.sql.ResultSet"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
            <jsp:include page="../includes/layout/headerSite.jsp">
                <jsp:param name="title" value="SL EVENTS" />
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
                


                
                
Core functions = new Core();

String type = (String)session.getAttribute("type");

%>

                
                    <jsp:include page="../includes/layout/nav.jsp" />

                    <section class="engine"><a href="https://mobirise.me/r">bootstrap template</a></section>

                    <section class="mbr-section content8 cid-qXpPtkCB4z" id="content8-r">



                        <div class="container">
                            <div class="media-container-row title">
                                <div class="col-12 col-md-8">
                                    <div class="mbr-section-btn align-center">
                                       <a class="btn btn-black-outline display-4" onclick="showEvents();" id="eventBtn">Events</a>
                                        <a class="btn btn-black-outline display-4" onclick="showCalander();" id="listrBtn">View calander</a></div>
                                </div>
                            </div>
                        </div>
                    </section>
                    
                    <section id="listView" style="display: none">
                        <div class="container">
                        
                       
                            
                            
                        
                        
<div id="accordion">
     <% 
         int x = 0;                   
         ResultSet rs9 = null;
                        if(type.equalsIgnoreCase("university")){
                                                    rs9 = functions.getUserDetailsByType("university");
                                                }
                                                if(type.equalsIgnoreCase("organization")){
                                                    rs9 = functions.getUserDetailsByType("university","organization");
                                                }
                        while(rs9.next()){
                            
                        
                        
                        %>
    <div class="card">
        <div class="card-header" id="headingOne">
            <h5 class="mb-0">
                <button class="btn btn-link" data-toggle="collapse" data-target="#<%= String.valueOf(x)%>" aria-expanded="true" aria-controls="collapseOne">
          <%out.println(rs9.getString("displayName"));%>
        </button>
            </h5>
        </div>

        <div id="<%= String.valueOf(x)%>" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
            <div class="card-body">
               
               
               
                <div id="calendar">
                    Calander View
                </div>
            </div>
        </div>
    </div>
    
    
                        <%
                            x++;
                            }
                            %>
    
    
</div>
                        </div>
                    </section>

                    
                    <section class="tabs3 cid-qXpKuOihob features18 popup-btn-cards cid-qXpJxHxTlO" id="tabs3-a">
                        <div id="eventsView">
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
                                                ResultSet rs2 = null;
                                                
                                                if(type.equalsIgnoreCase("university")){
                                                    rs2 = functions.getItemsByCategoryForUni(i);
                                                }
                                                if(type.equalsIgnoreCase("organization")){
                                                    rs2 = functions.getItemsByCategoryForOrg(i);
                                                }
            
            while(rs2.next()){
            %>

                                                
                                                
                                                
                                                
                                                
                                                
                                                <div class="col-xs-12 col-md-6 col-lg-4">
                                                    <div class="card-wrapper">
                                                        <div class="card-img">
                                                            <div class="mbr-overlay"></div>
                                                            <div class="mbr-section-btn text-center">
                                                                <a href="events.jsp?event=<%out.println(rs2.getString("eventID"));%>" class="btn btn-primary display-4">Learn More</a>
                                                            </div>
                                                            <img src="../assets/images/<%out.println(rs2.getString("eventImage"));%>" alt="Mobirise">
                                                        </div>
                                                        <div class="card-box">

                                                            <h4 class="card-title mbr-fonts-style display-7"><%out.println(rs2.getString("eventName"));%>
                                                                <div><br></div>
                                                            </h4>
                                                            <p class="mbr-text mbr-fonts-style display-7"><%out.println(rs2.getString("date"));%>
                                                                
                                                                <br> <br><%out.println(rs2.getString("venue"));%></p>
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

                
                                   

                                        </div>
                                    </div>
                                </div>
                                
                                
                        </div>
                    </section>
                 

                    <jsp:include page="../includes/layout/footer.jsp" />
                    
                   <script>
                                        function showEvents() {
            var x = document.getElementById("eventsView");
            var y = document.getElementById("listView");
            
            if (x.style.display === "none") {
                x.style.display = "block";
                y.style.display = "none";
               
            } else {
                x.style.display = "none";
               
            }
        }

        function showCalander() {
            var x = document.getElementById("listView");
            var y = document.getElementById("eventsView");
            
            if (x.style.display === "none") {
                x.style.display = "block";
                y.style.display = "none";
                
            } else {
                x.style.display = "none";
                
            }
        }
                                        
                                        </script>
                             <script>
                                    
                                    $(document).ready(function() {
 
 
 var calendar = $('#calendar').fullCalendar({
  header: {
   left: 'prev,next today',
   center: 'title',
   right: 'month,agendaWeek,agendaDay'
  },
  selectable: true,
  selectHelper: true,
  select: function(start, end, allDay) {
   
   calendar.fullCalendar('unselect');
  },
  editable: true,
  
  
 });
                                    });
                                 
                                 
                                     $.ajax({ type: "Post", url: "CalenderEvent",
  data:{name:$("#Uname").val()},
  cache:false,
  success : function(data){
   
    var objArray=JSON.parse(data);
     $.each(objArray, function(index,jsonObject){
    
        var subject = jsonObject.Description;  //the title of the event         
     var dateStart = jsonObject.complDate;     // the day the event takes place
     var events=new Array();   
     event = new Object();     
     event.title = subject;
     event.start = dateStart;    // its a date string
     //event.end = dateEnd;        // its a date string.
     event.color = jsonObject.color;
     event.allDay = false;
           event.url="Calender_Add_Report.jsp";
     events.push(event);
     $('#calendar').fullCalendar('addEventSource',events);
     
     });
     
      var altField = $( ".selector" ).datepicker( "option", "altField" );
     alert(altField);
  }
  });
    
                                    
                                    </script>           
                                        
                                        
                                        
                                       
                                      
   