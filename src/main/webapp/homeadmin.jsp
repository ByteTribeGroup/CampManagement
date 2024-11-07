<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="camping.DAO.*" %>
<%@ page import="camping.Model.*" %>

<%
    List<Booking> bookings = BookingDAO.getCountAllBooking();
    request.setAttribute("bookings", bookings);
    
    List<Booking> packagetype = BookingDAO.getPerPackage();
    request.setAttribute("packagetype", packagetype);
    
    List<Booking> revenue = BookingDAO.getRevenue();
    request.setAttribute("revenue", revenue);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    /* Customize your CSS styles here */
    #charts-container {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        padding: 10px;
    }
    #chart-container, #revenueChart-container {
        flex: 1;
        min-width: 300px;
        max-width: 45%;
        text-align: center;
        margin: 10px;
    }
    #revenueChart-container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    canvas {
        width: 100% !important;
        height: auto !important;
    }
</style>
</head>
<body>
	id = ${sessionScope.sessionId }
    <%@ include file="includesAdmin/navadmin.html" %>
    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard Staff ${sessionScope.sessionId }</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item active">Dashboard</li>
                            
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner">
                                <c:forEach var="booking" items="${bookings}">
                                    <h3>RM${booking.totalSum}0</h3>
                                </c:forEach>
                                <p>INCOME</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                            <a href="#" class="small-box-footer">TOTAL INCOME </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-success">
                            <div class="inner">
                                <c:forEach var="booking" items="${bookings}">
                                    <h3>${booking.pendingBooking}</h3>
                                </c:forEach>
                                <p>PENDING BOOKING</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="AdminController?action=pending&bookId=" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <c:forEach var="booking" items="${bookings}">
                                    <h3>${booking.approvedBooking}</h3>
                                </c:forEach>
                                <p>APPROVED BOOKING</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                            <a href="AdminController?action=approve&bookId=" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <c:forEach var="booking" items="${bookings}">
                                    <h3>${booking.cancelBooking}</h3>
                                </c:forEach>
                                <p>CANCEL BOOKING</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                            <a href="AdminController?action=deny&bookId=" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <div id="charts-container">
            <div id="chart-container">
                <div style="width: 100%; overflow-x: auto;">
                    <canvas id="myPieChart" width="400" height="400"></canvas>
                </div>
                <p style="text-align: center; font-style: italic; margin-top: 10px;">Distribution of Packages</p>
            </div>
        
            <div id="revenueChart-container">
                <canvas id="revenueChart" width="400" height="400"></canvas>
                <p style="text-align: center; font-style: italic; margin-top: 10px;">Monthly Revenue Trend</p>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            // Prepare data for pie chart
            var packageNames = [];
            var totalBookings = [];
            
            <% for (Booking booking : packagetype) { %>
                packageNames.push('<%= booking.getPackageType().getPackageName() %>');
                totalBookings.push('<%= booking.getTotalBooking() %>');
            <% } %>
            
            // Create pie chart
            var ctx = document.getElementById('myPieChart').getContext('2d');
            var myPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: packageNames,
                    datasets: [{
                        label: 'Package Bookings',
                        data: totalBookings,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.7)',
                            'rgba(54, 162, 235, 0.7)',
                            'rgba(255, 206, 86, 0.7)',
                            'rgba(75, 192, 192, 0.7)',
                            'rgba(153, 102, 255, 0.7)',
                            'rgba(255, 159, 64, 0.7)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: true
                }
            });
        </script>

        <script>
            // Data for Chart.js line chart
            var periods = [<% for (Booking booking : revenue) { %>'<%= booking.getPeriod() %>', <% } %>];
            var revenues = [<% for (Booking booking : revenue) { %><%= booking.getRevenue() %>, <% } %>];
            
            // Create Chart.js line chart
            var ctx2 = document.getElementById('revenueChart').getContext('2d');
            var myLineChart = new Chart(ctx2, {
                type: 'line',
                data: {
                    labels: periods,
                    datasets: [{
                        label: 'Total Revenue',
                        data: revenues,
                        borderColor: 'blue',
                        borderWidth: 1,
                        fill: false
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: true, // Maintain aspect ratio
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Period'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Revenue ($)'
                            }
                        }
                    }
                }
            });
        </script>
    </div>
</body>
</html>
