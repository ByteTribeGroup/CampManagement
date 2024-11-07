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
    <!-- start: Payment -->
    <section class="payment-section">
        <div class="container">
            <div class="payment-wrapper">
                <div class="payment-left">
                    <div class="payment-header">
                        <div class="payment-header-icon"><i class="ri-flashlight-fill"></i></div>
                        <div class="payment-header-title">Order Summary</div>
                        <p class="payment-header-description"><c:out value="${bookings.packagetype.packageName }"></c:out></p>
                        <p class="payment-summary-name" style="color: white;"><c:out value="${bookings.packagetype.services}"></c:out></p>
                        <p class="payment-header-description">Here Your Booking Details. Please Check Before Payment</p>
                    </div>
                    <div class="payment-content">
                        <div class="payment-body">
                            <div class="payment-plan">
                                <div class="payment-plan-type">Details</div>
                                <div class="payment-plan-info">
                                    <div class="payment-plan-info-name"><c:out value="${bookings.packagetype.packageName }"></c:out></div>
                                    <div class="payment-plan-info-price">RM  <c:out value="${bookings.packagetype.packagePrice }"></c:out>per night</div>
                                </div>
                                <a href="./rooms.jsp" class="payment-plan-change">Change</a>
                            </div>
                            <div class="payment-summary">
                            	<c:set var="adult" value="${bookings.booking.adult}" />
                                <c:set var="child" value="${bookings.booking.child}" />
                                <%
							        int adult = (int) pageContext.getAttribute("adult");
							        double adultPrice = adult*40;
							        int child = (int) pageContext.getAttribute("child");
							        double childPrice = child*20;
							        double both = adultPrice+childPrice;
							        
							    %>
                                <div class="payment-summary-item">
                                    <div class="payment-summary-name">No Adult <c:out value="${bookings.booking.adult }"/></div>
                                    <div class="payment-summary-price">RM <%=adultPrice %></div>
                                </div>
                                <div class="payment-summary-item">
                                    <div class="payment-summary-name">No Child <c:out value="${bookings.booking.child }"/></div>
                                    <div class="payment-summary-price">RM <%=childPrice %></div>
                                </div>
                                <div class="payment-summary-item">
                                    <div class="payment-summary-name">Sub Total</div>
                                    <div class="payment-summary-price">RM <%=both %></div>
                                </div>
                                <div class="payment-summary-divider"></div>
                                <div class="payment-summary-item payment-summary-total">
                                    <div class="payment-summary-name">Total</div>
                                    <div class="payment-summary-price">RM <c:out value="${bookings.booking.totalPrice }"/></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="payment-right">
                    <form action="./CampingController" method="get" class="payment-form">
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
                        <input type="hidden" name="action" value="pay">
                        <input type="hidden" name="custId" value="${sessionScope.sessionId}"/>
                        <input type="hidden" name="bookId" value="${bookings.booking.bookId}"/>
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