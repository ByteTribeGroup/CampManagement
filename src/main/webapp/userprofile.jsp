<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    response.addHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.addHeader("Cache-Control", "pre-check=0, post-check=0");
    response.setDateHeader("Expires", 0);

    if(session.getAttribute("sessionId") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            margin: 0;
            padding-top: 40px;
            color: #2e323c;
            background: #f5f6fa;
            position: relative;
            height: 100%;
        }
        .account-settings .user-profile {
            margin: 0 0 1rem 0;
            padding-bottom: 1rem;
            text-align: center;
        }
        .account-settings .user-profile .user-avatar {
            margin: 0 0 1rem 0;
        }
        .account-settings .user-profile .user-avatar img {
            width: 90px;
            height: 90px;
            -webkit-border-radius: 100px;
            -moz-border-radius: 100px;
            border-radius: 100px;
        }
        .account-settings .user-profile h5.user-name {
            margin: 0 0 0.5rem 0;
        }
        .account-settings .user-profile h6.user-email {
            margin: 0;
            font-size: 0.8rem;
            font-weight: 400;
            color: #9fa8b9;
        }
        .account-settings .about {
            margin: 2rem 0 0 0;
            text-align: center;
        }
        .account-settings .about h5 {
            margin: 0 0 15px 0;
            color: #007ae1;
        }
        .account-settings .about p {
            font-size: 0.825rem;
        }
        .form-control {
            border: 1px solid #cfd1d8;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            font-size: .825rem;
            background: #ffffff;
            color: #2e323c;
        }
        .card {
            background: #ffffff;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            border: 0;
            margin-bottom: 1rem;
        }
                    
	    .center-div {
	        margin-left: auto;
	        margin-right: auto;
	        float: none;
	    }
        
    </style>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>

<%@ include file="includesCustomer/welcomenav.html" %>

<body>
<%
    String status = (String) request.getAttribute("status");
    if (status == null) {
        status = "";
    }
%>
<input type="hidden" id="status" value="<%= status %>" >
    <div class="container">
            <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 center-div">
                <div class="card h-100">
                    <form action="./UserController" method="get">
                    	<input type="hidden" name="action" value="update">
                    	<input type="hidden" name="userId" value="${sessionScope.sessionId }">
					    <div class="card-body">
					        <div class="row gutters">
					            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					                <h6 class="mb-2 text-primary">Personal Details</h6>
					            </div>
					            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
					                <div class="form-group">
					                    <label for="fullName">First Name</label>
					                    <input type="text" class="form-control" id="fullName" name="firstName" value="<c:out value="${users.firstName}"/>">
					                </div>
					                <div class="form-group">
					                    <label for="fullName">Last Name</label>
					                    <input type="text" class="form-control" id="fullName" name="lastName" value="<c:out value="${users.lastName}"/>">
					                </div>
					            </div>
					            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
					                <div class="form-group">
					                    <label for="eMail">Email</label>
					                    <input type="email" class="form-control" id="email" name="email" value="<c:out value="${users.email}"/>" readonly>
					                </div>
					            </div>
					            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
					                <div class="form-group">
					                    <label for="phone">Phone</label>
					                    <input type="text" class="form-control" id="phone" name="phone" value="<c:out value="${users.phoneNum}"/>">
					                </div>
					            </div>
					            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
					                <div class="form-group">
					                    <label for="website">Address</label>
					                    <input type="text" class="form-control" id="address" name="address" value="<c:out value="${users.address}"/>">
					                </div>
					            </div>
					        </div>
					        <div class="row gutters">
					            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					                <h6 class="mt-3 mb-2 text-primary">Account</h6>
					            </div>
					            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
					                <div class="form-group">
					                    <label for="Street">Username</label>
					                    <input type="text" class="form-control" id="username" name="username" value="<c:out value="${users.username}"/>" readonly>
					                </div>
					            </div>
					            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
					                <div class="form-group">
					                    <label for="ciTy">Password</label>
					                    <input type="password" class="form-control" id="password" name="password" value="<c:out value="${users.password}"/>">
					                </div>
					            </div>
					        </div>
					        <div class="row gutters">
					            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					                <div class="text-right">
					                    <button type="submit" class="btn btn-primary">Update</button>
					                </div>
					            </div>
					        </div>
					    </div>
					</form>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="includesCustomer/footeruser.html" %>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <script type="text/javascript">
        window.onload = function() {
            var status = document.getElementById("status").value;
            if (status == "success") {
                swal("Congrats", "Account Successfully Updated", "success");
            } else if (status == "failure") {
                swal("Sorry", "Account Update Fail", "error");
            }
        };
    </script>
</body>
</html>
