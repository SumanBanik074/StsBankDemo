<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
	if(session.getAttribute("adm_num") == "" || session.getAttribute("adm_num") == null) {
	session.setAttribute("flash_msg", "Please login to view content!");
	response.sendRedirect("homepage.jsp");
	} 
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STS Bank&reg; Admin page </title>
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
      		font-size: large;
      	}
      	.p2 {
            			background-color: #6D0026;  
		 }
	</style>
	<script type="text/javascript">
	function validcheck(){
	 var acc=document.bl.acc_no;
		var cust=document.bl.cusnum;
		
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
	}
	
	</script>
	
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
		<nav class="navbar navbar-default">
   		<div class="conatiner">
   				<div class="navbar-collapse-collapse container">
  					<ul class="nav navbar-nav">
  						<li style="padding-right: 15px;"><a href="homeAdmin.jsp">Home</a></li>
  						<li style="padding-right: 15px;"><a href="admin.jsp">Customer Details</a></li>
 						<li style="padding-right: 15px;"><a href="remove.jsp">Remove Customer</a></li>
  						<li style="padding-right: 15px;"><a href="update.jsp">Update</a></li>
  						<li style="padding-right: 15px;"><a href="deposit.jsp">Deposit fund</a></li>
     				</ul>
     				<ul class="nav navbar-nav navbar-right">
     					<li class="active"><p style="font-weight: bold;" class="navbar-text">Hello, <%=session.getAttribute("adm_num")%></p></li>
     					<li><a href="logout_adm.jsp"><span class="glyphicon glyphicon-off"></span>Logout</a></li>
     				</ul>
    		</div>
    	</div>
    </nav>
	<br>
	<br>
	<div class="row">
			<div class="col-md-3"></div>
			<div class="container well col-md-6">
			<form action="customerDetails.jsp" name="bl" method="post" onsubmit="return validcheck()">
   				<table class="table table-bordered">
   					<tr><th colspan="2" style="text-align: center;"class="p2"><h1 style="color: white">Customer Details</h1></th></tr><tr><td colspan="2"></td></tr>
   					<tr><td style="text-align: center;"><h4>Account No</h4></td><td><input type="text" name="acc_no" class="form-control" placeholder="Enter account no"></td></tr>
   					<tr><td style="text-align: center;"><h4>CustomerName</h4></td><td><input type="text" name="cusnum" class="form-control"  placeholder="Enter customer name "></td></tr>
   					<tr><td colspan="2" align="center"><button class="btn btn-success btn-block" type="submit" style="text-align: center;" >Submit</button></td></tr>
   				</table>
   			</form>
   			<br>
   			<form action="customerDetails1.jsp" method="post">
   				<button class="btn btn-primary btn-block" type="submit"" >View All Customer Details</button>
   			</form>
   		</div>
    </div>
	<br>
	<br>
	</div>
	<footer style="text-align:center">
		<p	style="color: white;" class="text-center">Copyright&copy; 2017 STS Bank. All Rights Reserved</p>
	</footer>


</body>
</html>