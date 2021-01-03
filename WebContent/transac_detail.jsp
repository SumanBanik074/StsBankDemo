<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
	if(session.getAttribute("acc_no") == "" || session.getAttribute("acc_no") == null) {
	session.setAttribute("flash_msg", "Please login to view content!");
	response.sendRedirect("homepage.jsp");
} 
%>
<!DOCTYPE html>
<html>
<head>
<title>STS Bank&reg; Transaction Details </title>
<meta charset="ISO-8859-1">
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
      		font-size: medium;
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
					<a href="userAcc.jsp"><img src="STS Bank.png" height="100" width="100" alt="STS Bank"></a>
				</td><td>
					<h1 style="color: white;">&nbsp;&nbsp;STS Bank</h1>
					<i style="color: white;padding: 15px; font-family:monospace;">The bank for a changing world.....</i>
			</td></tr>
		</table>
	</header>
	<div style="background-color: #ffe5cc" class="row">
		<nav class="navbar navbar-default">
   		<div class="conatiner">
   			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="navbar-collapse">
   				<span class="sr-only">Toggle navigation</span>
   				<span class="icon-bar"></span>
   				<span class="icon-bar"></span>
   				<span class="icon-bar"></span>
 			 </button>
  			<div class="navbar-collapse-collapse container">
  				<ul class="nav navbar-nav">
  						<li style="padding-right: 15px;"><a href="userAcc.jsp">Home</a></li>
  						<li class="active" style="padding-right: 15px;"><a href="Balance.jsp">Balance</a></li>
  						<li  style="padding-right: 15px;"><a href="Transfer.jsp">Fund Transfer</a></li>
  						  						
     					<li class="dropdown">
   							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
   								Paybills Online<b class="caret"></b></a>
   							<ul class="dropdown-menu">					     							
   								<li><a href="telephone_bill.jsp">Telephone Bills</a></li>
    							<li><a href="electric_bill.jsp">Electricity Bills</a></li>
    						</ul>
    					</li>
    					<li style="padding-right: 15px;"><a href="transac_detail.jsp">Transaction Details</a></li>
    					<li style="padding-right: 15px;"><a href="update_pro.jsp">Update Profile</a></li>
	 			</ul>
	 			<ul class="nav navbar-nav navbar-right">
                	<li class="active"><p style="font-weight: bold;" class="navbar-text">Hello, <%=session.getAttribute("cusnum")%></p></li>
                	<li><a href="logout_customer.jsp"><span class="glyphicon glyphicon-off"></span>Logout</a></li>
                </ul>
    		</div>
    	</div>
    </nav>
	<br>
	<%@page import="getdatabase.*,java.sql.*,java.util.*" %>
	<div class="row">
			<div class="col-md-2"></div>
			<div class="container well col-md-8">
			<form action="" name="bl" method="post">
   				<table class="table table-bordered">
   					<tr><th colspan="8" style="text-align: center;"class="p1"><h1 style="color: white">Transaction Details</h1></th></tr><tr><td colspan="2"></td></tr>
   					<tr><th>Date</th><th>Particulars</th><th>DR Amount</th><th>CR Amount</th>
   					<th>Balance</th></tr>
   	<%try{
		Connection cn=Data.getData();
		String acc_no=session.getAttribute("acc_no").toString();
		String sql="select * from trans_tab where acc_no=?";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, acc_no);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
	%>
					<tr><td><%=rs.getString(6)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td></tr>
	<%} %>
    <%}catch(Exception e){
    	System.out.print(e);
    } %>
				</table>
			</form>
		</div>
	</div>
	<br>
	<br><br><br>
	</div>
	<footer class="text-center">
		<p	style="color: white;">Copyright&copy; 2017 STS Bank. All Rights Reserved</p>
	</footer>
</body>
</html>