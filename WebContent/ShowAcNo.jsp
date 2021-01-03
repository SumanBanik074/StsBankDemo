<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Account Number</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		header{
			background-color: #6D0026;
			padding: 15px;
		}
		footer{
			background-color: #6D0026;
			padding: 15px;
		}
		li{
      		font-size: large;
      	}
      	.p1{
      		background-color: #6D0026;
      	}
	</style>
</head>
<body>
<header>
		<table>
			<tr><td>
					<img src="STS Bank.png" height="100" width="100" alt="STS Bank">
				</td><td>
					<h1 style="color: white;">&nbsp;&nbsp;STS Bank</h1>
					<i style="color: white;padding: 15px; font-family:monospace;">The bank for a changing world.....</i>
			</td></tr>
		</table>
	</header>
	<div style="background-color: #ffe5cc" class="row">
	<br><br><br><br><br><br><br><br>
	<%@page import="getdatabase.*,java.sql.*,java.util.*" %>
	<%String cusnum = (String)request.getAttribute("myname");
		String acc_no = (String)request.getAttribute("acc_no");
	%>
		<form action="homepage.jsp">
			<div class="alert alert-warning container text-center alert-dismissable">
				
  				<h2>Your account has been Created Successfully...</h2>
  				<h3><%=cusnum%>, your account number is  <%=acc_no%></h3>
			</div>
			<br>
			<div align="center">
			<button class="btn btn-primary" style="" type="submit">Back</button>
			</div>
		</form>
		<br><br><br><br><br><br>
	</div>
	<footer style="text-align:center">
		<p	style="color: white;" class="text-center">Copyright&copy; 2017 STS Bank. All Rights Reserved</p>
	</footer>
</body>
</html>