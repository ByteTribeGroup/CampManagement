<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.addHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.addHeader("Cache-Control", "pre-check=0, post-check=0");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />

    <style>
        .card {
            box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0, 0, 0, .125);
            border-radius: 1rem;
        }
	    .billed-to-details p {
	        margin: 0;
	        padding: 5px 0;
	    }
	    .billed-to-details i {
	        margin-right: 8px;
	        color: #6c757d;
	    }
	    .text-uppercase {
        	text-transform: uppercase;
    	}
    </style>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <!-- Invoice Title and Header -->
                    <div class="invoice-title">
                        <h4 class="float-end font-size-15">Invoice <c:out value="${bookings.packagetype.packageId}" /><span class="badge bg-success font-size-12 ms-2">Paid</span></h4>
                        <div class="mb-4">
                            <h2 class="mb-1 text-muted">ByteTribe Camping Site</h2>
                        </div>
                        <div class="text-muted">
                            <p class="mb-1">Lot 13, 9, Jalan Golden Hills, Brinchang, 39000 Brinchang, Pahang</p>
                            <p class="mb-1"><i class="uil uil-envelope-alt me-1"></i> ByteTribe.com</p>
                            <p><i class="uil uil-phone me-1"></i> 011-60616627</p>
                        </div>
                    </div>

                    <hr class="my-4">

                    <!-- Billing Information -->
                    <div class="row">
                        <div class="col-sm-6">
						    <div class="text-muted">
						        <h5 class="font-size-16 mb-3">Billed To:</h5>
						        <div class="billed-to-details">
						            <h5 class="font-size-15 mb-2 text-uppercase"><c:out value="${bookings.firstName} ${bookings.lastName}" /></h5>
						            <p class="mb-1"><i class="fa fa-map-marker-alt"></i> <c:out value="${bookings.address}" /></p>
						            <p class="mb-1"><i class="fa fa-envelope"></i> <c:out value="${bookings.email}" /></p>
						            <p><i class="fa fa-phone"></i> <c:out value="${bookings.phoneNum}" /></p>
						        </div>
						    </div>
						</div>
                        <div class="col-sm-6">
                            <div class="text-muted text-sm-end">
                                <div>
                                    <h5 class="font-size-15 mb-1">Invoice No:</h5>
                                    <p><c:out value="${bookings.packagetype.packageId}" /></p>
                                </div>
                                <div class="mt-4">
                                    <h5 class="font-size-15 mb-1">Invoice Date:</h5>
                                    <p><%= new java.util.Date() %></p>
                                </div>
                                <div class="mt-4">
                                    <h5 class="font-size-15 mb-1">Order No:</h5>
                                    <p><c:out value="${bookings.booking.bookId}" /></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Order Summary -->
                    <div class="py-2">
                        <h5 class="font-size-15">Order Summary</h5>

                        <div class="table-responsive">
                            <table class="table align-middle table-nowrap table-centered mb-0">
                                <thead>
                                    <tr>
                                        <th style="width: 70px;">No.</th>
                                        <th>Package Name</th>
                                        <th>Package Price</th>
                                        <th>People</th>
                                        <th>Night</th>
                                        <th class="text-end" style="width: 160px;">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>
                                            <div>
                                                <h5 class="text-truncate font-size-14 mb-1"><c:out value="${bookings.packagetype.packageName}" /></h5>
                                                <p class="text-muted mb-0"></p>
                                            </div>
                                        </td>
                                        <td>RM <c:out value="${bookings.packagetype.packagePrice}" /></td>
                                        <td>
                                            Adult x <c:out value="${bookings.booking.adult}" /><br>
                                            Child x <c:out value="${bookings.booking.child}" />
                                        </td>
                                        <td><c:out value="${bookings.booking.nightNum}" /></td>
                                        <c:set var="adult" value="${bookings.booking.adult}" />
                                        <c:set var="child" value="${bookings.booking.child}" />
                                        <%
                                            int adult = (int) pageContext.getAttribute("adult");
                                            double adultPrice = adult * 40;
                                            int child = (int) pageContext.getAttribute("child");
                                            double childPrice = child * 20;
                                            double both = adultPrice + childPrice;
                                        %>
                                        <td class="text-end">
                                            Adult: RM <%= adultPrice %><br>
                                            Child: RM <%= childPrice %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" colspan="5" class="text-end">Sub Total</th>
                                        <td class="text-end">RM <%= both %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row" colspan="5" class="border-0 text-end">Total</th>
                                        <td class="border-0 text-end">
                                            <h4 class="m-0 fw-semibold">RM <c:out value="${bookings.booking.totalPrice}" /></h4>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- Print and Main Page Buttons -->
                        <div class="d-print-none mt-4">
                            <div class="float-end">
                                <a href="javascript:window.print()" class="btn btn-success me-1"><i class="fa fa-print"></i></a>
                                <a href="homeadmin.jsp" class="btn btn-primary w-md">Main Page</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
