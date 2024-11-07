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
<%@ page import = "camping.Model.Booking" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Payment Page</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
    <link rel="stylesheet" href="cssCustomer/tailwindcss-colors.css">
    <link rel="stylesheet" href="cssCustomer/payment.css">
</head>
<body>
    <%@ include file="includesCustomer/welcomenav.html" %>
    <%
        HttpSession sessions = request.getSession();
        Booking booking = (Booking) session.getAttribute("booking");
        int packageId = booking.getPackageId();
        int night = booking.getNightNum();
        String startDate = booking.getStartDate();
        String endDate = booking.getEndDate();
        int adult = booking.getAdult();
        int child = booking.getChild();
        int lot = booking.getLotNum();

        double adultTotal = adult * 40;
        double childTotal = child * 20;  
        double total = adultTotal + childTotal;
    %>
    
    <c:set var="packagePrice" value="${bookings.packagePrice}" />
    
    <%
        double packagePrice = (Double) pageContext.getAttribute("packagePrice");
        double allTotal = total + packagePrice;
    %>
    
    <!-- start: Payment -->
    <section class="payment-section">
        <div class="container">
            <div class="payment-wrapper">
                <div class="payment-left">
                    <div class="payment-header">
                        <div class="payment-header-icon"><i class="ri-flashlight-fill"></i></div>
                        <div class="payment-header-title">Order Summary</div>
                        <p class="payment-header-description"><c:out value="${bookings.packageName}"></c:out></p>
                        <p class="payment-summary-name" style="color: white;"><c:out value="${bookings.services}"></c:out></p>
                        <p class="payment-header-description">Here Your Booking Details. Please Check Before Payment</p>
                    </div>
                    <div class="payment-content">
                        <div class="payment-body">
                            <div class="payment-plan">
                                <div class="payment-plan-type">Details</div>
                                <div class="payment-plan-info">
                                    <div class="payment-plan-info-name"><c:out value="${bookings.packageName }"></c:out></div>
                                    <div class="payment-plan-info-price">RM <c:out value="${bookings.packagePrice}"></c:out> per night</div>
                                </div>
                                <a href="./rooms.jsp" class="payment-plan-change">Change</a>
                            </div>
                            <div class="payment-summary">
                                <div class="payment-summary-item">
                                    <div class="payment-summary-name">No Adult <%= adult %></div>
                                    <div class="payment-summary-price">RM <%= adultTotal %></div>
                                </div>
                                <div class="payment-summary-item">
                                    <div class="payment-summary-name">No Child <%= child %></div>
                                    <div class="payment-summary-price">RM <%= childTotal %></div>
                                </div>
                                <div class="payment-summary-item">
                                    <div class="payment-summary-name">Sub Total</div>
                                    <div class="payment-summary-price">RM <%= total %></div>
                                </div>
                                <div class="payment-summary-divider"></div>
                                <div class="payment-summary-item payment-summary-total">
                                    <div class="payment-summary-name">Total</div>
                                    <div class="payment-summary-price">RM <%= allTotal %></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="payment-right">
                    <form action="./CampingController?action=book" method="POST" class="payment-form">
                        <h1 class="payment-title">Payment Details</h1>
                        <div class="payment-method">
                            <input type="radio" name="payment-method" id="method-1" checked>
                            <label for="method-1" class="payment-method-item">
                                <img src="imageCustomer/visa.png" alt="">
                            </label>
                            <input type="radio" name="payment-method" id="method-2">
                            <label for="method-2" class="payment-method-item">
                                <img src="imageCustomer/mastercard.png" alt="">
                            </label>
                            <input type="radio" name="payment-method" id="method-3">
                            <label for="method-3" class="payment-method-item">
                                <img src="imageCustomer/paypal.png" alt="">
                            </label>
                            <input type="radio" name="payment-method" id="method-4">
                            <label for="method-4" class="payment-method-item">
                                <img src="imageCustomer/stripe.png" alt="">
                            </label>
                        </div>
                        <div class="payment-form-group">
                            <input type="text" name="cardName" placeholder=" " class="payment-form-control" id="email">
                            <label for="namecard" class="payment-form-label payment-form-label-required">Name on Card</label>
                        </div>
                        <div class="payment-form-group">
                            <input type="text" name="cardNum" placeholder=" " class="payment-form-control" id="card-number">
                            <label for="card-number" class="payment-form-label payment-form-label-required">Card Number</label>
                        </div>
                        <div class="payment-form-group-flex">
                            <div class="payment-form-group">
                                <input type="date" name="expiryDate" placeholder=" " class="payment-form-control" id="expiry-date">
                                <label for="expiry-date" class="payment-form-label payment-form-label-required">Expiry Date</label>
                            </div>
                            <div class="payment-form-group">
                                <input type="text" name="cvv" placeholder=" " class="payment-form-control" id="cvv">
                                <label for="cvv" class="payment-form-label payment-form-label-required">CVV</label>
                            </div>
                        </div>
                        <input type="hidden" name="custID" value="${sessionScope.sessionId}">
                        <input type="hidden" name="packageID" value="${bookings.packageId}">
                        <input type="hidden" name="night" value="<%= night %>">
                        <input type="hidden" name="startDate" value="<%= startDate %>">
                        <input type="hidden" name="endDate" value="<%= endDate %>">
                        <input type="hidden" name="lot" value="<%= lot %>">
                        <input type="hidden" name="child" value="<%= child %>">  
                        <input type="hidden" name="adult" value="<%= adult %>">  
                        <button type="submit" class="payment-form-submit-button"><i class="ri-wallet-line"></i> Pay</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- end: Payment -->
    <%@ include file="includesCustomer/footeruser.html" %>
</body>
</html>
