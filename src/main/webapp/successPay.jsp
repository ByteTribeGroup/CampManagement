<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body>
<% String status = (String) request.getAttribute("status"); %>
<input type="hidden" id="status" value="<%= status %>">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	
   	 <script type="text/javascript">
	    window.onload = function() {
	        var status = document.getElementById("status").value;
	        if (status == "success") {
	            swal({
	                title: "Congrats",
	                text: "Payment Done",
	                icon: "success"
	            }).then(function() {
	                window.location.href = "welcome.jsp"; // Redirect to success page
	            });
	        } else if (status == "failure") {
	            swal({
	                title: "Oops!",
	                text: "Payment Failed",
	                icon: "error"
	            }).then(function() {
	                window.location.href = "payment.jsp"; // Redirect to retry payment page
	            });
	        }
	    };
</script>
</body>
</html>