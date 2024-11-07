<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<html lang="zxx">

<head>
    <style>
        body {
            font-size: 140%;
        }

        h2 {
            text-align: center;
            padding: 20px 0;
        }

        table caption {
            padding: .5em 0;
        }

        table.dataTable th,
        table.dataTable td {
            white-space: nowrap;
        }

        .p {
            text-align: center;
            padding-top: 140px;
            font-size: 14px;
        }
        
        .center-div {
	        margin-left: auto;
	        margin-right: auto;
	        float: none;
	    }
   
    </style>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.2.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark/dark.css">
</head>

<body>

    <%
        String status = (String) request.getAttribute("status");
        if (status == null) {
            status = "";
        }
    %>
    <input type="hidden" id="status" value="<%= status %>">
    <%@ include file="includesCustomer/welcomenav.html" %>

    <h2>Booking List</h2>

    <div class="container">
        <div class="row">
            <div class="col-xs-12 center-div">
                <table summary="This table shows how to create responsive tables using Datatables' extended functionality"
                    class="table table-bordered table-hover dt-responsive ">
                    <caption class="text-center">
                        An example of a responsive table based on 
                        <a href="https://datatables.net/extensions/responsive/" target="_blank">DataTables</a>:
                    </caption>
                    <thead>
                        <tr>
                            <th>NO.</th>
                            <th>PACKAGE NAME</th>
                            <th>TOTAL PAYMENT</th>
                            <th>PAYMENT STATUS</th>
                            <th>STATUS</th>
                            <th>ACTION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${bookings}" var="booking" varStatus="status">
                            <tr>
                                <!-- Counter -->
                                <td><c:out value="${status.count}"/></td>
                                
                                <!-- Booking Details -->
                                <td><c:out value="${booking.packageType.packageName}"/></td>
                                <td>RM <c:out value="${booking.totalPrice}"/></td>
                                <td><c:out value="${booking.payment.payStatus}"/></td>
                                <td><c:out value="${booking.bookStatus}"/></td>
                                
                                <c:set var="payStatus" value="${booking.payment.payStatus}" />
                                <%
                                    String payStatus = (String) pageContext.getAttribute("payStatus");
                                %>
                                <!-- View Button -->
                                <td>
                                    <% if ("Done".equals(payStatus)) { %>
                                        <!-- Show Invoice Form -->
                                        <form id="invoiceForm${booking.bookId}" action="./UserController" method="post" style="display:none;">
                                            <input type="hidden" name="action" value="invoice">
                                            <input type="hidden" name="bookId" value="<c:out value="${booking.bookId}"/>">
                                        </form>
                                        <a href="#" class="edit" onclick="document.getElementById('invoiceForm${booking.bookId}').submit(); return false;">
                                            Invoice
                                            <i class="fa fa-book" aria-hidden="true" title="Invoice"></i>
                                        </a>
                                        
                                    <% } else if ("Not Paid".equals(payStatus)) { %>
                                        <!-- Show Payment Form -->
                                        <form id="payForm${booking.bookId}" action="./CampingController" method="post" style="display:none;">
                                            <input type="hidden" name="action" value="view">
                                            <input type="hidden" name="bookId" value="<c:out value="${booking.bookId}"/>">
                                        </form>
                                        <a href="#" class="edit" onclick="document.getElementById('payForm${booking.bookId}').submit(); return false;">
                                            Pay Now
                                            <i class="ri-money-dollar-box-line" title="Payment"></i>
                                        </a>
                                        <form id="deleteForm${booking.bookId}" action="./CampingController" method="post" style="display:none;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="bookId" value="<c:out value="${booking.bookId}"/>">
                                        </form>
                                        <a href="#" class="edit" style="color: red;" onclick="confirmDeletion(${booking.bookId}); return false;">
                                            Delete
                                            <i class="ri-delete-bin-2-line" title="Delete" style="color: red;"></i>
                                        </a>
                                    
                                    <% } %>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <script type="text/javascript">
        window.onload = function() {
            var status = document.getElementById("status").value;
            if (status == "success") {
                Swal.fire("Congrats", "Booking Success", "success");
            } else if (status == "failure") {
                Swal.fire("Sorry", "Booking Fail", "error");
            } else if (status == "successPay") {
                Swal.fire("Success", "Payment Done", "success");
            } else if (status == "successDelete") {
                Swal.fire("Success", "Booking Deleted Successfully", "success");
            }
        };
    </script>
    
    <script>
        function confirmDeletion(bookId) {
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('deleteForm' + bookId).submit();
                }
            });
        }
    </script>

    <%@ include file="includesCustomer/footeruser.html" %>
</body>

</html>
