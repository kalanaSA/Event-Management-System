<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../includes/layout/header.jsp" >
    <jsp:param name="title" value="Login" />
</jsp:include>

<body>

        
	
	<div class="limiter">
		<div class="container-login100">
		
		<div class="container">
                    <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-4 text-center">
                               <img src="../assets/images/logo.png" alt="logo" style="margin: auto">
                            </h2>
		
		
		</div>
		
		
		<%
              if(request.getParameter("msg") != null){
                 String msg = request.getParameter("msg");
                  if(msg.equalsIgnoreCase("success")){
                      %>
                      
                      <div class="container">
                            <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-4 text-center">
                               Registration Successfull!
                            </h2>
                                 <h4 class="mbr-section-title align-center pb-3 mbr-fonts-style display-6 text-center text-light">
                               Wait till you are approved by the admin
                            </h4>  
                                   <h6 class="mbr-section-title align-center pb-3 mbr-fonts-style display-7 text-center text-light">
                               If not approved by maximum 24hrs please contact us
                            </h6>  
                                    </div>
                      <%
                  }
              }
              %>
			<div class="wrap-login100">
			
				<div class="login100-pic js-tilt" data-tilt>
					<img src="../assets/images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" action="../Login" method="post">
					<span class="login100-form-title">
						Member Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit" name="login" value="login">
							Login
						</button>
					</div>
                                    
                                    <small  class="form-text text-muted" style="color:red;">                         
                 <%
              if(request.getParameter("err") == null){
                  
              }else{
              out.println(request.getParameter("err"));
              }
              %></small>

					

					<div class="text-center p-t-136">
						<a class="txt2" href="register.jsp">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="../assets/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../assets/vendor/bootstrap/js/popper.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../assets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../assets/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="../assets/js/main.js"></script>

</body>
</html>