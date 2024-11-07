<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
    <meta charset="ISO-8859-1"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign in and Sign up Form</title>
    <link rel="stylesheet" href="cssLogin/loginstyle.css" />
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>

<input type="hidden" id="status" value="<%=request.getAttribute("status") %>" >
<main>
      <div class="box">
        <div class="inner-box">
          <div class="forms-wrap">
            <!--For login-->
            <form action="./UserController?action=login" method="POST" autocomplete="off" class="sign-in-form">
              <div class="logo">
                <img src="imageLogin/tent-line.png" alt="easyclass" />
                <h4>ByteTribe</h4>
              </div>

              <div class="heading">
                <h2>Welcome Back</h2>
              </div>

              <div class="actual-form">
                <input type="hidden" name="form_type" value="login">
                <input type="hidden" name="login_type" value="staff">
                <div class="input-wrap">
                  <input
                    type="text"
                    name="username"
                    class="input-field"
                    autocomplete="off"
                    required
                  />
                  <label>User Name</label>
                </div>

                <div class="input-wrap">
                  <input
                    type="password"
                    name="password"
                    class="input-field"
                    autocomplete="off"
                    required
                  />
                  <label>Password</label>
                </div>

                <input type="submit" value="Sign In" class="sign-btn" />
				
				<p class="text">
                   Log In as User?
                <a href="login.jsp">Click Here</a> to signing in
                </p>
              </div>
            </form>

            <!--For registration-->
            <form action="registerUser" method="POST" autocomplete="off" class="sign-up-form">
              <div class="logo">
                <img src="imageLogin/tent-line.png" alt="easyclass" />
                <h4>ByteTribe</h4>
              </div>

              <div class="heading">
                <h2>Get Started</h2>
                <h6>Already have an account?</h6>
                <a href="#" class="toggle">Sign in</a>
              </div>

              <div class="actual-form">
                <input type="hidden" name="form_type" value="signup">
                <div class="input-wrap">
                  <input
                    type="text"
                    name="fname"
                    class="input-field"
                    autocomplete="off"
                    required
                  />
                  <label>User Name</label>
                </div>

                <div class="input-wrap">
                  <input
                    type="email"
                    class="input-field"
                    name="email"
                    autocomplete="off"
                    required
                  />
                  <label>Email</label>
                </div>

                <div class="input-wrap">
                  <input
                    type="password"
                    name="pass"
                    class="input-field"
                    autocomplete="off"
                    required
                  />
                  <label>Password</label>
                </div>

                <input type="submit" value="Sign Up" class="sign-btn" />

                <p class="text">
                  By signing up, I agree to the
                  <a href="#">Terms of Services</a> and
                  <a href="#">Privacy Policy</a>
                </p>
              </div>
            </form>
          </div>

          <!--Slider-->
          <div class="carousel">
            <div class="images-wrapper">
              <img src="imageLogin/home-lake.jpg" class="image img-1 show" alt="" />
              <img src="imageLogin/home-mountain.jpg" class="image img-2" alt="" />
              <img src="imageLogin/home-beach.jpg" class="image img-3" alt="" />
            </div>

            <div class="text-slider">
              <div class="text-wrap">
                <div class="text-group">
                  <h2>Camping Management System</h2>
                  <h2>Byte Tribe.com</h2>
                  <h2>The Best Place To Healing</h2>
                </div>
              </div>

              <div class="bullets">
                <span class="active" data-value="1"></span>
                <span data-value="2"></span>
                <span data-value="3"></span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    
    <!--========== SCROLL UP ==========-->
    <a href="#" class="scrollup" id="scroll-up">
      <i class="ri-arrow-up-double-line"></i>
    </a>

    <!--=============== SCROLLREVEAL ===============-->
    <script src="jsLogin/scroll.js"></script>
    <!-- Javascript file -->

    <script src="jsLogin/login.js"></script>
    
    <!--=============== ERROR ===============-->
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	
   	 <script type="text/javascript">
        window.onload = function() {
            var status = document.getElementById("status").value;
            if (status == "success") {
                swal("Congrats", "Account Created Successfully", "success");
            } else if (status == "failure") {
                swal("Sorry", "Account Creation Failed", "error");
            } else if (status == "email_exists") {
            	swal("Sorry", "Email is already registered.\nPlease enter another email", "error");
            } else if (status == "failed_login") {
                swal("Sorry", "Wrong Password or Username", "error");
            }
        };
    </script>
	
</body>
</html>