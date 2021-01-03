<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% 
	if(session.getAttribute("acc_no") == "" || session.getAttribute("acc_no") == null) {
	session.setAttribute("flash_msg", "Please login to view content!");
	response.sendRedirect("homepage.jsp");
} 
%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<title>STS Bank&reg; Electric bill </title>
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
			var acc=document.ts.acc_no;
			var cust=document.ts.cusnum;
			var accc=document.ts.ebill;
			var dac=document.ts.phno;
			var amount=document.ts.amt;
		
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
			else if(accc.value==""){
				alert("Enter Electric bill ID");
				accc.focus();
				return false;
			}
			else if(dac.value==""){
				alert("Enter Phone No");
				dac.focus();
				return false;
			}
			else if(amount.value==""){
				alert("Enter the amount");
				amount.focus();
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
   			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="navbar-collapse">
   				<span class="sr-only">Toggle navigation</span>
   				<span class="icon-bar"></span>
   				<span class="icon-bar"></span>
   				<span class="icon-bar"></span>
 			 </button>
  			<div class="navbar-collapse-collapse container">
  				<ul class="nav navbar-nav">
  						<li style="padding-right: 15px;"><a href="userAcc.jsp">Home</a></li>
  						<li style="padding-right: 15px;"><a href="Balance.jsp">Balance</a></li>
  						<li  style="padding-right: 15px;"><a href="Transfer.jsp">Fund Transfer</a></li>
  						  						
     					<li class="dropdown">
   							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
   								Paybills Online<b class="caret"></b></a>
   							<ul class="dropdown-menu">					     							
   								<li><a href="telephone_bill.jsp">Telephone Bills</a></li>
    							<li class="active"><a href="electric_bill.jsp">Electricity Bills</a></li>
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
		<div class="row">
			<div class="col-md-3"></div>
			<div class="container well col-md-6">
			<form action="electricBill" name="ts" method="post" onsubmit="return validcheck()">
   				<table class="table table-bordered">
   					<tr><th colspan="2" style="text-align: center;" class="p1"><h1 style="color: white;">Pay Electricity Bills</h1></th></tr>
   					<tr><td style="text-align: center;"><h4>Account No</h4></td><td style="text-align: center;"><input type="text" name="acc_no" class="form-control" placeholder="Enter account no"></td></tr>
   					<tr><td style="text-align: center;"><h4>Customer Name</h4></td><td style="text-align: center;"><input type="text" name="cusnum" class="form-control"  placeholder="Enter customer name"></td></tr>
   					<tr><td style="text-align: center;"><h4>Electric bill ID</h4></td><td style="text-align: center;"><input type="text" name="ebill" class="form-control" placeholder="Enter Electric bill ID "></td></tr>
   					<tr><td style="text-align: center;"><h4>Phone no</h4></td><td style="text-align: center;"><input type="text" name="phno"  class="form-control" placeholder="Enter Phone no"></td></tr>
   					<tr><td style="text-align: center;"><h4>Amount</h4></td><td><input type="text" name="amt" class="form-control" placeholder="Enter the amount"></td></tr>
   					<tr><td><h4 class="text-center">Date</h4></td><td><input type="date" name="date" class="form-control" placeholder="dd-mm-yyyy"></td></tr>
   					<tr><td colspan="2" align="center"><button class="btn btn-success btn-lg" type="submit" style="text-align: center;" onclick="">Submit</button>
   						&nbsp;&nbsp;<button class="btn btn-danger btn-lg" type="reset" style="text-align:right;">Clear</button></td></tr>
   				</table>
   				</form>
   		</div>
    </div>
	
	<br>
	</div>
	<footer Class="text-center">
		<p	style="color: white;">Copyright&copy; 2017 STS Bank. All Rights Reserved</p>
	</footer>
</body>
</html>