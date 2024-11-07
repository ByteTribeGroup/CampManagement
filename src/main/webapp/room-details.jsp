<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%
	  response.addHeader("Pragma", "no-cache");
	  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	  response.addHeader("Cache-Control", "pre-check=0, post-check=0");
	  response.setDateHeader("Expires", 0);
	  
	  if(session.getAttribute("sessionId")==null)	  
	      response.sendRedirect("index.jsp");
  	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Room Details</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/moment@2.29.1/min/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <style>
        .disabled-date {
            background-color: red !important;
            color: white !important;
            pointer-events: none; /* Prevent clicking on these dates */
            opacity: 0.6;
        }
    </style>
</head>
<body>

        <%-- User is logged in, proceed with rendering the page --%>
        <%@ include file="includesCustomer/welcomenav.html" %>
        <!-- Breadcrumb Section Begin -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <h2>Our Camping Package</h2>
                            <div class="bt-option">
                                <a href="./home.html">Home</a>
                                <span>Package</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section End -->

        <!-- Room Details Section Begin -->
        <section class="room-details-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="room-details-item">
                            <img src="data:image/jpg;base64,${packagetype.image}">
                            <div class="rd-text">
                                <div class="rd-title">
                                    <h3><c:out value="${packagetype.packageName}"></c:out></h3>
                                    <div class="rdt-right">
                                        <div class="rating">
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star"></i>
                                            <i class="icon_star-half_alt"></i>
                                        </div>
                                        
                                    </div>
                                </div>
                                <h2>RM <c:out value="${packagetype.packagePrice}"></c:out><span>/Pernight</span></h2>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Price:</td>
                                            <td>RM <c:out value="${packagetype.packagePrice}"></c:out>, 
                                                Public Holiday RM1388 (Breakfast and dinner provided)</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max 4 Adults</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td>2 Queen Beds</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td>Shared bathroom with hot shower, dental kit, toiletries, 
                                                towels, hair dryer, portable fan, power plug, projector, water dispenser and outdoor dining area</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="rd-reviews">
                        </div>
                        <div class="review-add">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="room-booking">
                            <h3>Your Reservation</h3>
                            <form action="./CampingController" method="POST">
                                <div class="check-date">
                                    <label for="date-in">Check In/Check Out:</label>
                                    <input type="text" id="daterange" name="daterange"/>
                                    <i class="icon_calendar"></i>
                                </div>
                                <div class="check-date">
                                <label for="nights">Number of Night Stays :</label>
        						<input type="number" id="nights" name="nights" required><br><br>
	                            </div>
	                            <div class="check-date">
	                                <label for="children">Number of Adults :</label>
	        						<input type="number" id="adults" name="adults" required><br><br>
	                            </div>
	                            <div class="check-date">
	                                <label for="children">Number of Children : </label>
	        						<input type="number" id="child" name="child" required><br><br>
	                            </div>
                                <div class="select-option">
                                <label for="lotNum">Number of Lot :</label>
						        <select id="lotNum" name="lotNum">
						        	<option value="0">~Select Number~</option>
						            <option value="1">1</option>
						            <option value="2">2</option>
						            <option value="3">3</option>
						        </select>
                            	</div>
                                <input type="hidden" name ="packageID" value="${packagetype.packageId}">
                                <input type="hidden" name ="userId" value="${sessionScope.sessionId}">
                                <input type="hidden" id="action" name="action" value="book">
                                <button type="submit" onclick="document.getElementById('action').value='booking'">Book Now</button>
                        		<button type="submit" onclick="document.getElementById('action').value='invoice'">Pay Now</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Room Details Section End -->

        <!-- Footer Section Begin -->
        <%@ include file="includesCustomer/footeruser.html" %>

        <script type="text/javascript">
            $(function() {
                // Calculate minimum date as today
                var minDate = moment().startOf('day');
                
                // Dates to disable (fetched from the servlet)
                var disabledDates = [];
                <c:forEach var="date" items="${bookedDates}">
                    disabledDates.push(moment("${date}"));
                </c:forEach>

                $('#daterange').daterangepicker({
                    opens: 'left', // position the calendar to the left of the input
                    autoApply: true, // apply the selection when user clicks outside the calendar
                    locale: {
                        format: 'YYYY-MM-DD', // format of the date
                        cancelLabel: 'Clear' // label for the cancel button
                    },
                    minDate: minDate, // minimum date user can select is today
                    isInvalidDate: function(date) {
                        // Disable dates before today
                        if (date.isBefore(minDate, 'day')) {
                            return true;
                        }
                        // Disable specific dates
                        for (var i = 0; i < disabledDates.length; i++) {
                            if (date.isSame(disabledDates[i], 'day')) {
                                return true;
                            }
                        }
                        return false;
                    },
                    isCustomDate: function(date) {
                        for (var i = 0; i < disabledDates.length; i++) {
                            if (date.isSame(disabledDates[i], 'day')) {
                                return 'disabled-date'; // Add a class to the disabled dates
                            }
                        }
                        return '';
                    }
                });
            });
        </script>
</body>
</html>
