<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%
	  response.addHeader("Pragma", "no-cache");
	  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
	  response.setDateHeader("Expires", 0);
  %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta name="keywords" content="Sona, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Byte Tribe</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="cssCustomer/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="cssCustomer/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="cssCustomer/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="cssCustomer/flaticon.css" type="text/css">
    <link rel="stylesheet" href="cssCustomer/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="cssCustomer/nice-select.css" type="text/css">
    <link rel="stylesheet" href="cssCustomer/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="cssCustomer/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="cssCustomer/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="cssCustomer/style.css" type="text/css">
   	<link rel="stylesheet" href="path/to/owl.carousel.css">
   	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="path/to/owl.carousel.min.js"></script>
    
    <style>
        .hero-slider .hs-item {
            width: 100%;
            height: 500px; /* Adjust height as needed */
            background-size: cover;
            background-position: center;
        }
    </style>
    
    
</head>


<body>

		<%
		    String status = (String) request.getAttribute("status");
		    if (status == null) {
		        status = "";
	    }
		%>
		<input type="hidden" id="status" value="<%= status %>" >
        <div class="menu-item">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2">
                        <div class="logo">
                            <a href="./index.jsp">
                                <img src="imageCustomer/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="nav-menu">
                            <nav class="mainmenu">
                                <ul>
                                    <li class="active"><a href="./index.jsp">Home</a></li>
                                    <li><a href="./rooms2.jsp">Packages</a>
                                        <ul class="dropdown">
                                            <li><a href="./UserController?action=view2">Caravan & Tent</a></li>
                                        </ul>
                                    </li>
                                   <li><a href="">Account</a>
                                   		<ul class="dropdown">
                                            <li><a href="login.jsp">Login & SignUp</a></li>
                                        </ul>
                                   </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- Header End -->
	
    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="hero-text">
                        <h1>Byte Tribe </h1>
                        <p>Here are the best camping booking sites, including recommendations for luxury
                            camping site.</p>
                        <a href="#" class="primary-btn">Discover Now</a>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                    <!-- <div class="booking-form">
                        <h3>Booking Your Hotel</h3>
                        <form action="#">
                            <div class="check-date">
                                <label for="date-in">Check In:</label>
                                <input type="text" class="date-input" id="date-in">
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="check-date">
                                <label for="date-out">Check Out:</label>
                                <input type="text" class="date-input" id="date-out">
                                <i class="icon_calendar"></i>
                            </div>
                            <div class="select-option">
                                <label for="guest">Guests:</label>
                                <select id="guest">
                                    <option value="">2 Adults</option>
                                    <option value="">3 Adults</option>
                                </select>
                            </div>
                            <div class="select-option">
                                <label for="room">Room:</label>
                                <select id="room">
                                    <option value="">1 Room</option>
                                    <option value="">2 Room</option>
                                </select>
                            </div>
                            <button type="submit">Check Availability</button>
                        </form>
                    </div>-->
                </div>
            </div>
        </div> 
        <div class="hero-slider owl-carousel">
            <div class="hs-item set-bg" data-setbg="imageCustomer/hero/hero-1.jpg"></div>
            <div class="hs-item set-bg" data-setbg="imageCustomer/hero/hero-2.jpg"></div>
            <div class="hs-item set-bg" data-setbg="imageCustomer/hero/hero-3.jpg"></div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- About Us Section Begin -->
   <section class="aboutus-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about-text">
                        <div class="section-title">
                            <span>About Us</span>
                            <h2>Intercontinental LA <br />Westlake Hotel</h2>
                        </div>
                        <p class="f-para">, the ultimate destination for luxury camping enthusiasts. 
                        Our site is dedicated to providing you with the finest glamping experiences, 
                        combining the beauty of the great outdoors with the comfort and sophistication 
                        of a high-end resort. Whether you seek a serene mountain retreat, a beachfront paradise, 
                        or a secluded forest hideaway, we offer a curated selection of premium camping sites and accommodations to suit every taste</p>
                        <p class="s-para">Explore our website to discover stunning locations, exceptional amenities, and unforgettable adventures 
                        that redefine the camping experience. Your journey to unparalleled outdoor luxury begins here.</p>
                        <a href="#" class="primary-btn about-btn">Byte Tribe Camping site</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-pic">
                        <div class="row">
                            <div class="col-sm-6">
                                <img src="imageCustomer/about/about-1.jpg" alt="">
                            </div>
                            <div class="col-sm-6">
                                <img src="imageCustomer/about/about-2.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    
    <script type="text/javascript">
        window.onload = function() {
            var status = document.getElementById("status").value;
            if (status == "logOut") {
                swal("Log Out", "The user has successfully logged out.", "info");
            }else if (status == "failure") {
                swal("Sorry", "Account Update Fail", "error");
            }
        };
    </script>
    
    <script>
        $(document).ready(function() {
            // Initialize the carousel
            $('.hero-slider').owlCarousel({
                items: 1,
                loop: true,
                autoplay: true,
                autoplayTimeout: 5000,
                nav: true,
                dots: true
            });

            // Set background images
            $('.set-bg').each(function() {
                var bg = $(this).data('setbg');
                $(this).css('background-image', 'url(' + bg + ')');
            });
        });
    </script>
    
    
    
    <%@ include file="includesCustomer/footeruser.html" %>
</body>
</html>