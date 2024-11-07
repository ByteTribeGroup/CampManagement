<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="cssCustomer/error.css" />
    <title>Web Design Mastery | 404 Not Found Page</title>
  </head>
  <body>
    <nav>
      <div class="nav__logo"><a href="#">Byte Tribe</a></div>
    </nav>
    <div class="container">
      <div class="header">
        <h1>404</h1>
        <h3>Page Not Found!</h3>
      </div>
      <img src="imageCustomer/error.jpg" alt="not found" />
      <div class="footer">
        <p>
          We're sorry, the page you requested could not be found. Please go back
          to the homepage!
        </p>
        <form action="index.jsp" method="get">
		    <button type="submit">GO HOME</button>
		</form>
      </div>
    </div>
  </body>
</html>