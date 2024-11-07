<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Our Packages</title>
</head>
<body>
        <%@ include file="includesCustomer/navuser.html" %>
        <!-- Breadcrumb Section Begin -->
        <div class="breadcrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text">
                            <h2>Our Packages</h2>
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

        <!-- Rooms Section Begin -->
        <section class="rooms-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="room-item">
                            <img src="imageCustomer/room/pack/package 1.1.jpg" alt="">
                            <div class="ri-text">
                                <h4><c:out value="${packages[0].packageName}"></c:out></h4>
                                <h3>RM <c:out value="${packages[0].packagePrice}" /><span>/Pernight</span></h3>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max person <c:out value="${packages[0].capacity}"></c:out></td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td><c:out value="${packages[0].bed}"/> Queen Beds</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td><c:out value="${packages[0].services}"></c:out></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br><br><br>
                                <a href="./login.jsp" class="primary-btn">Check Availability</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-item">
                            <img src="imageCustomer/room/pack/package 2.1.jpg" alt="">
                            <div class="ri-text">
                                <h4><c:out value="${packages[1].packageName}"/></h4>
                                <h3>RM <c:out value="${packages[1].packagePrice}" /><span>/Pernight</span></h3>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max <c:out value="${packages[1].capacity}"></c:out> Adult  1 Kid</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td><c:out value="${packages[1].bed}"/> Queen bed  1 Single Bed</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td><c:out value="${packages[1].services}"></c:out></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <a href="./login.jsp" class="primary-btn">Check Availability</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-item">
                            <img src="imageCustomer/room/pack/package 3.1.jpg" alt="">
                            <div class="ri-text">
                                <h4><c:out value="${packages[2].packageName}"/></h4>
                                <h3>RM <c:out value="${packages[2].packagePrice}" /><span>/Pernight</span></h3>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max <c:out value="${packages[2].capacity }"/> Adults</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td><c:out value="${packages[2].bed}"/>Queen Beds</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td><c:out value="${packages[2].services}"></c:out></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br><br><br>
                                <a href="./login.jsp" class="primary-btn">Check Availability</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-item">
                            <img src="imageCustomer/room/pack/package 4.1.jpg" alt="">
                            <div class="ri-text">
                                <h4><c:out value="${packages[3].packageName}"/></h4>
                                <h3>RM <c:out value="${packages[3].packagePrice}" /><span>/Pernight</span></h3>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max <c:out value="${packages[3].capacity }"/> Adult</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td><c:out value="${packages[3].bed}"/> King  Single Bed</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td><c:out value="${packages[3].services}"></c:out></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br><br>
                                <a href="./login.jsp"  class="primary-btn">Check Availability</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-item">
                            <img src="imageCustomer/room/pack/package 5.1.jpg" alt="">
                            <div class="ri-text">
                                <h4><c:out value="${packages[4].packageName}"/></h4>
                                <h3>RM <c:out value="${packages[4].packagePrice}" /><span>/Pernight</span></h3>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max <c:out value="${packages[4].capacity }"/> Adult 1 Kid</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td><c:out value="${packages[4].bed}"/> Queen  Bunk Bed</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td><c:out value="${packages[4].services}"/><br>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                                <a href="./login.jsp" class="primary-btn">Check Availability</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="room-item">
                            <img src="imageCustomer/room/pack/package 6.1.jpg" alt="">
                            <div class="ri-text">
                                <h4><c:out value="${packages[5].packageName}"/></h4>
                                <h3>RM <c:out value="${packages[5].packagePrice}" /><span>/Pernight</span></h3>
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="r-o">Capacity:</td>
                                            <td>Max <c:out value="${packages[5].capacity }"/> Adults 1 Kid</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Bed:</td>
                                            <td><c:out value="${packages[5].bed}"/> Queen  Sofa Bed</td>
                                        </tr>
                                        <tr>
                                            <td class="r-o">Services:</td>
                                            <td> <c:out value="${packages[5].services}"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br>
                               <a href="./login.jsp"  class="primary-btn">Check Availability</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Rooms Section End -->

        <!-- Footer Section Begin -->
        <%@ include file="includesCustomer/footeruser.html" %>

</body>
</html>
