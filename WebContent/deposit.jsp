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
<title>STS Bank&reg; Fund deposit page </title>
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
      	.p1{
      		background-color: #6D0026;
      	}
	</style>
	<script>
		function validcheck(){
			var acc=document.dp.acc_no;
			var cust=document.dp.cusnum;
			var phno=document.dp.phno;
			var amount=document.dp.amt;
		
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
			else if(phno.value==""){
				alert("Enter Phone number");
				phno.focus();
				return false;
			}
			else if(!(phno.value.length==10)){
				alert("Phone number must be 10 digit");
				phno.select();
				phno.focus();
				return false;
			}
			else if(isNaN(phno.value)){
				alert("phone number must be numeric");
				phno.select();
				phno.focus();
				return false;
				}
			else if(amount.value==""){
				alert("Enter the amount to deposit");
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
			<div class="alert alert-warning container text-center alert-dismissable">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  				<h4><strong>Warning! </strong>Please enter details...</h4>
			</div>
	<div class="row">
			<div class="col-md-3"></div>
			<div class="container well col-md-6">
			<form action="deposit" name="dp" method="post" onsubmit="return validcheck()">
   				<table class="table table-bordered">
   					<tr><th colspan="2" style="text-align: center;" class="p1"><h1 style="color: white;">Fund Deposit</h1></th></tr>
   					<tr><td><h4 class="text-center">Account No</h4></td><td><input type="text" name="acc_no"  class="form-control" placeholder="Enter account no"></td></tr>
   					<tr><td><h4 class="text-center">CustomerName</h4></td><td><input type="text" name="cusnum" class="form-control" placeholder="Enter customer name "></td></tr>
   					<tr><td><h4 class="text-center">Phone no</h4></td><td><input type="text" name="phno" class="form-control" placeholder="Enter phone number"></td></tr>
   					<tr><td><h4 class="text-center">Amount</h4></td><td><input type="text" name="amt" class="form-control" placeholder="Enter the amount"></td></tr>
   					<tr><td><h4 class="text-center">Date</h4></td><td><input type="date" name="date" class="form-control" placeholder="dd-mm-yyyy"></td></tr>   					
   					<tr><td colspan="2" align="center"><button class="btn btn-success btn-lg" type="submit" style="text-align: center;" onclick="">Submit</button>
   						&nbsp;&nbsp;<button class="btn btn-danger btn-lg" type="reset" style="text-align:right;">Clear</button></td></tr>
   				</table>
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