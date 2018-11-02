<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../includes/layout/header.jsp" >
    <jsp:param name="title" value="Register" />
</jsp:include>
<body>

    <div class="limiter">
        <div class="container-login100">
           <div class="container">
                    <h2 class="mbr-section-title align-center pb-3 mbr-fonts-style display-4 text-center">
                               <img src="../assets/images/logo.png" alt="logo" style="margin: auto">
                            </h2>
		
		
		</div>
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="../assets/images/img-01.png" alt="IMG">
                </div>
                    <div class="login100-form">
                
                    <span class="login100-form-title">
						Register
					</span>
                    <div class="container" style="padding: 30px;">
                        
                            <div class="row">
                                <div class="container-login100-form-btn">
                                    <button class="login100-form-btn" onclick="showUni();" id="uniBtn">
                                    University
                                </button>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="container-login100-form-btn">
                                    <button class="login100-form-btn" onclick="showCom();" id="comBtn">
                                    Organization
                                </button>
                                </div>
                            </div>
                        
                    </div>
                    <div id="uni" style="display: none">
                        <form class="login100-form " action="../Register" method="post">

                        <div class="wrap-input100">
                            <input class="input100" type="text" required="" name="name" placeholder="Name of the University">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>

                        <div class="wrap-input100">
                            <input class="input100" type="text" required="" name="displayName" placeholder="Display name for the University">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>
                        
                        <div class="wrap-input100">
                            <input class="input100" type="text" required="" name="add" placeholder="Address of the University">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>
                        
                        <div class="wrap-input100">
                            <input class="input100" type="number" required="" name="phone" placeholder="Phone Number">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>
                        
                        <div class="wrap-input100 ">
                            <input class="input100" type="email" required="" name="mail" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>
                        

                        <div class="wrap-input100">
                            <input class="input100" type="password" required="" name="pass" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                       
                        </div>
                        <div class="wrap-input100">
                            <input class="input100" type="password" required="" name="confPass" placeholder="Confirm Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit" name="uni">
							Register University
						</button>
                        </div>
                        </form>

                    </div>

                   <div id="com" style="display: none">
                   <form class="login100-form " action="../Register" method="post">
                   
                    <div class="wrap-input100">
                            <input class="input100" type="text" required="" name="name" placeholder="Name of the Organization">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>

                        <div class="wrap-input100">
                            <input class="input100" type="text" required="" name="displayName" placeholder="Display name for the Organization">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>
                        
                        <div class="wrap-input100">
                            <input class="input100" type="text" required="" name="add" placeholder="Address of the Organization">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>
                        
                        <div class="wrap-input100">
                            <input class="input100" type="number" required="" name="phone" placeholder="Phone Number">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>
                        
                        <div class="wrap-input100">
                            <input class="input100" type="email" required="" name="mail" placeholder="Email">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>
                        

                        <div class="wrap-input100">
                            <input class="input100" type="password" required="" name="pass" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>
                        
                        <div class="wrap-input100">
                            <input class="input100" type="password" required="" name="confPass" placeholder="Confirm Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
						</span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit" name="org">
							Register Organization
						</button>
                        </div>
                       </form>

                    </div>
                    <small  class="form-text text-muted " style="color:red;">
                          <%
              if(request.getParameter("msg") == null){
                  
              }else{
              out.println(request.getParameter("msg"));
              }
              %>
              </small>


                    <div class="text-center p-t-136">
                        <a class="txt2" href="login.jsp">
							Already have a account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
                    </div>
                
                </div>
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
    <script>
        $('.js-tilt').tilt({
            scale: 1.1
        })

    </script>
    <!--===============================================================================================-->

    <script>
        $('#uniBtn').click(function(e){
      e.preventDefault();
    });
        
        $('#comBtn').click(function(e){
      e.preventDefault();
    });
        
        function showUni() {
            var x = document.getElementById("uni");
            var y = document.getElementById("com");
            var b = document.getElementById("uniBtn");
            var b2 = document.getElementById("comBtn");
            if (x.style.display === "none") {
                x.style.display = "block";
                y.style.display = "none";
                b.style.backgroundColor = "#00ACC1";
                b2.style.backgroundColor = "#29B6F6";
            } else {
                x.style.display = "none";
                b.style.backgroundColor = "#29B6F6";
            }
        }

        function showCom() {
            var x = document.getElementById("com");
            var y = document.getElementById("uni");
            var b = document.getElementById("comBtn");
            var b2 = document.getElementById("uniBtn");
            if (x.style.display === "none") {
                x.style.display = "block";
                y.style.display = "none";
                b.style.backgroundColor = "#00ACC1";
                b2.style.backgroundColor = "#29B6F6";
            } else {
                x.style.display = "none";
                b.style.backgroundColor = "#29B6F6";
            }
        }

    </script>

</body>

</html>
