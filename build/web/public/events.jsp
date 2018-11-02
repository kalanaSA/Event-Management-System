<%@page import="classes.User"%>
<%@page import="classes.Event"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.Core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

            <!DOCTYPE html>
<html>

<head>
    <!-- Site made with Mobirise Website Builder v4.7.7, https://mobirise.com -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="generator" content="Mobirise v4.7.7, mobirise.com">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <link rel="shortcut icon" href="../assets/images/logo-gl-events-e1427398096892-103x57.png" type="image/x-icon">
    <meta name="description" content="">
    <title>${param.title}</title>
    <link rel="stylesheet" href="../assets/web/assets/mobirise-icons/mobirise-icons.css">
    <link rel="stylesheet" href="../assets/tether/tether.min.css">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../assets/dropdown/css/style.css">
    <link rel="stylesheet" href="../assets/socicon/css/styles.css">
    <link rel="stylesheet" href="../assets/theme/css/style.css">
    <link rel="stylesheet" href="../assets/gallery/style.css">
    <link rel="stylesheet" href="../assets/mobirise/css/mbr-additional.css" type="text/css">
    
     <% 
   
    Core methods = new Core();
     Core functions = new Core();
     Event ev = new Event();
     
     
     if(session.getAttribute("auth") == null ){
                   RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                   rd.forward(request, response);
        }
                if(!(Boolean)session.getAttribute("auth")){
    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                   rd.forward(request, response);
}
    
    //get all details of item by its id to a resultset
    ResultSet rs = functions.getEventDetails(Integer.parseInt(request.getParameter("event")));
    while(rs.next()){
          
%>
    
<style>
    .cid-qXpNyK9Ndr {
  padding-top: 30vh;
  padding-bottom: 10vh;
  background-image: url("../assets/images/<% out.print(rs.getString("eventImage")); %>");
}
    
    </style>


</head>
<body>            

  <jsp:include page="../includes/layout/nav.jsp" />

<section class="engine"><a href="https://mobirise.me/i">free web creation software</a></section><section class="mbr-section content5 cid-qXpNyK9Ndr mbr-parallax-background" id="content5-j">

   

    <div class="container">
        <div class="media-container-row">
            <div class="title col-12 col-md-8">
                <h2 class="align-center mbr-bold mbr-white pb-3 mbr-fonts-style display-1">
                     <% out.print(rs.getString("eventName")); %></h2>
                <h3 class="mbr-section-subtitle align-center mbr-light mbr-white pb-3 mbr-fonts-style display-5"></h3>
                
                
            </div>
        </div>
    </div>
</section>

<section class="mbr-section content4 cid-qXpNLIyOLn" id="content4-k">
 <div class="container">
        <div class="media-container-row">
            <div class="title col-12 col-md-8">
                <h2 class="align-center pb-3 mbr-fonts-style display-2">
                    <% out.print(rs.getString("eventName")); %>
                </h2>
                <h3 class="mbr-section-subtitle align-center mbr-light mbr-fonts-style display-5">
                    <% out.print(rs.getString("category")); %>
                </h3>
                
            </div>
        </div>
    </div>
</section>

<section class="mbr-section article content9 cid-qXpOdSvP9w" id="content9-n">
    
     

    <div class="container">
        <div class="inner-container" style="width: 100%;">
            <hr class="line" style="width: 25%;">
            <div class="section-text align-center mbr-fonts-style display-5">
                    <% out.print(rs.getString("Description")); %>
                </div>
            <hr class="line" style="width: 25%;">
        </div>
        </div>
</section>

<section class="mbr-section article content11 cid-qXpNWD89uC" id="content11-l">
     

    <div class="container">
        <div class="media-container-row">
            <div class="mbr-text counter-container col-12 col-md-8 mbr-fonts-style display-7">
                <ol>
                    <li><strong>Venue</strong> - <% out.print(rs.getString("venue")); %> </li>
                    <li><strong>Date</strong> - <% out.print(rs.getString("date")); %></li>
                    
                </ol>
            </div>
        </div>
    </div>
</section>

<section class="mbr-section content8 cid-qXpOl9zUcT" id="content8-o">

    <%
        Integer uID = (Integer)session.getAttribute("userID");
        
        String op = functions.getUserEventOpinion(uID, rs.getInt("eventID"));
        String actG = "",actI = "",actM ="";
        if(!op.equals("")){
            if(op.equals("GOING")){
                actG = "active";
            }
            if(op.equals("INTERESTED")){
                actI = "active";
            }
            if(op.equals("MAYBE")){
                actM = "active";
            }
        }
    %>
    

    <div class="container">
        <div class="media-container-row title">
            <div class="col-12 col-md-8">
                <div class="mbr-section-btn align-center">
                   <a class="btn btn-secondary display-4 <%= actG %>" href="../EventServelet?opinion=going&event=<% out.print(rs.getInt("eventID")); %>&user=<%= session.getAttribute("userID")%>">Going</a>
                    <a class="btn btn-primary display-4 <%= actI %>" href="../EventServelet?opinion=interested&event=<% out.print(rs.getInt("eventID")); %>&user=<%= session.getAttribute("userID")%>">Interested</a>
                    <a class="btn btn-black-outline display-4 <%= actM %>" href="../EventServelet?opinion=maybe&event=<% out.print(rs.getInt("eventID")); %>&user=<%= session.getAttribute("userID")%>">May be</a>
                </div>
            </div>
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
                    
            
                    <form class="mbr-form" action="../EventServelet" method="post">
                       
                        
                        <div class="form-group">
                            <label class="form-control-label mbr-fonts-style display-7" for="message-form1-14">Comment</label>
                            <textarea type="text" class="form-control" name="message" rows="5" data-form-field="Message" id="message-form1-14"></textarea>
                            <input type="hidden" name="userID" value="<% out.println((Integer)session.getAttribute("userID"));%>">
                            <input type="hidden" name="eventID" value="<% out.println(request.getParameter("event"));%>">
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
            ResultSet rsx = ev.getComments(request.getParameter("event"));
            
        while(rsx.next()){
            usd = us.getDetailsByID(rsx.getString("userID"));
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
                 <em><% out.println(rsx.getString("comment")); %></em>
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


<section class="features3 cid-qXpOrdYVic" id="features3-p">
    
    <h2 class="align-center pb-3 mbr-fonts-style display-2">
                    Similar Events
                </h2>
    

    
    <div class="container">
        <div class="media-container-row">
            
            <% 
        ResultSet rs2 = methods.getRelatedEvents(Integer.parseInt(request.getParameter("event")));
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
                    <div class="mbr-section-btn text-center">
                        <a href="events.jsp?event=<%out.println(rs2.getString("eventID"));%>" class="btn btn-primary display-4">
                            View Event
                        </a>
                    </div>
                </div>
            </div>

           <% } %>

            
        </div>
    </div>
</section>

<jsp:include page="../includes/layout/footer.jsp" />