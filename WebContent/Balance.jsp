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
<title>STS Bank&reg; Balance Page </title>
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
	<script>
		function validcheck(){
			var acc=document.bl.acc_no;
			var cust=document.bl.cusnum;
			var pass=document.bl.psw;
		
		if(acc.value==""){
			alert("Enter account number");
			acc.focus();
			return false;
		}
		else if(cust.value==""){
			alert("Enter customer name");
			cust.focus();
			return false;
		}
		else if(pass.value==""){
			alert("Enter Password");
			pass.focus();
			return false;
		}
		else if(!(pass.value.length==8)){
			alert("Password must be 8 digit");
			pass.select();
			pass.focus();
			return false;
		}
	}
	</script>
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
	<%try{
		Connection cn=Data.getData();
		String acc_no=request.getParameter("acc_no");
		String cusnum=request.getParameter("cusnum");
		String psw=request.getParameter("psw");
		if(acc_no.equals(session.getAttribute("acc_no"))){
			String sql="select * from customer_tab where acc_no=? and cusnum=? and psw=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, acc_no);
			ps.setString(2, cusnum);
			ps.setString(3, psw);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
			%>
			<div class="alert alert-success container text-center alert-dismissable">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  				<h3><strong>Hello <%=rs.getString(2)%>, your account balance is <%=rs.getString(9)%></strong></h3>
			</div>
			<%}else{%>
			<div class="alert alert-warning container text-center alert-dismissable">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  				<h4><strong>Warning! </strong>Please enter your details...</h4>
			</div>
			<%} %>
		<%}else{%>
			<div class="alert alert-warning container text-center alert-dismissable">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  				<h4><strong>Warning! </strong>Please enter your details...</h4>
			</div>
		<%} %>	
		<%}catch(Exception e){
		System.out.println(e);
		}%>
	<div class="row">
			<div class="col-md-3"></div>
			<div class="container well col-md-6">
			<form action="" name="bl" method="post" onsubmit="return validcheck()">
   				<table class="table table-bordered">
   					<tr><th colspan="2" style="text-align: center;" class="p1"><h1 style="color: white;">Balance</h1></th></tr>
   					<tr><td style="text-align: center;"><h4>Account No</h4></td><td><input type="text" name="acc_no" class="form-control" placeholder="Enter account no"></td></tr>
   					<tr><td style="text-align: center;"><h4>CustomerName</h4></td><td><input type="text" name="cusnum" class="form-control"  placeholder="Enter customer name "></td></tr>
   					<tr><td style="text-align: center;"><h4>Password</h4></td><td><input type="password" name="psw" class="form-control" placeholder="Enter password"></td></tr>
   					<tr><td colspan="2" align="center"><button class="btn btn-success btn-lg" type="submit" style="text-align: center;">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;
   						<button class="btn btn-danger btn-lg" type="reset" style="text-align:right;">Clear</button></td></tr>
   						<tr><td colspan="2"><div id="showBal"></div></td></tr>
   				</table>
   			</form>
   		</div>
    </div>
	
	<br>
	</div>
	<footer align="center">
		<p	style="color: white;">Copyright&copy; 2017 STS Bank. All Rights Reserved</p>
	</footer>
</body>
</html>