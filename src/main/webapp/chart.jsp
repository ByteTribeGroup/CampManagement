<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="camping.DAO.*" %>
<%@ page import="camping.Model.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Revenue Chart</title>
    
    <!-- Include Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <style>
        canvas {
            width: 600px; /* Adjust width as needed */
            height: 300px; /* Adjust height as needed */
            margin: auto;
            display: block;
        }
    </style>
</head>
<body>
    <canvas id="revenueChart"></canvas>

    <%
        List<Booking> bookings = BookingDAO.getRevenue();
        request.setAttribute("bookings", bookings);
        
        // Prepare data for Chart.js
        StringBuilder periods = new StringBuilder();
        StringBuilder revenues = new StringBuilder();
        for (Booking booking : bookings) {
            periods.append("'" + booking.getPeriod() + "', ");
            revenues.append(booking.getRevenue() + ", ");
        }
    %>
    
    <script>
        // Data for Chart.js
        var ctx = document.getElementById('revenueChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [<%= periods.substring(0, periods.length() - 2) %>], // Remove the trailing comma
                datasets: [{
                    label: 'Total Revenue',
                    data: [<%= revenues.substring(0, revenues.length() - 2) %>], // Remove the trailing comma
                    borderColor: 'blue',
                    borderWidth: 1,
                    fill: false
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false, // Ensure chart maintains aspect ratio
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
</body>
</html>
