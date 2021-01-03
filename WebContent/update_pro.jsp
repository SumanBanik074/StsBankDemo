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
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>STS Bank&reg; Update Profile</title>
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
		 
	</style>
	<script>
		function validate(){
		 
		 var x= document.sgu.acc_no;
		 var y=document.sgu.cusnum;
		 var z=document.sgu.psw;
		 var p1=document.sgu.rpsw;
		 var p2=document.sgu.phno;
		 
			if(x.value==""){
				alert("Enter Account no");
				x.focus();
				return false;
				
				
			}
			else if(y.value==""){
				alert("enter customer name");
				y.focus();
				return false;
			}
			else if(p2.value==""){
				alert("Enter Phone number");
				p2.focus();
				return false;
			}
			else if(isNaN(p2.value)){
				alert("phone no must be numeric");
				p2.select();
				p2.focus();
				return false;
			}
			else if(!(p2.value.length==10)){
				alert("phone number must be 10 digit");
				p2.select();
				p2.focus();
				return false;
			}
			else if(z.value==""){
				alert("Enter Phone number");
				p2.focus();
				return false;
			}
			else if(!(z.value.length==8)){
				alert("password must be greater than 8 char");
				y.select();
				y.focus();
				return false;
			}
			else if(p1.value==""){
				alert("ReEnter Password");
				z.focus();
				return false;
			}
			else if(z.value!=p1.value){
				alert("Re-Enter password");
				return false;
			}
	}	
	</script>
  	</head>
   	<body>
		<header>
		<table>
			<tr><td>
					<img src="STS Bank.png" height="100" width="100">
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
  						<li style="padding-right: 15px;"><a href="Transfer.jsp">Fund Transfer</a></li> 
  						 						
     					<li class="dropdown">
   							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
   								Paybills Online<b class="caret"></b></a>
   							<ul class="dropdown-menu">					     							
   								<li><a href="telephone_bill.jsp">Telephone Bills</a></li>
    							<li><a href="electric_bill.jsp">Electricity Bills</a></li>
    						</ul>
    					</li>
    					<li style="padding-right: 15px;"><a href="transac_detail.jsp">Transaction Details</a></li>
    					<li class="active" style="padding-right: 15px;"><a href="update_pro.jsp">Update Profile</a></li>
	 			</ul>
	 			<ul class="nav navbar-nav navbar-right">
                	<li class="active"><p style="font-weight: bold;" class="navbar-text">Hello, <%=session.getAttribute("cusnum")%></p></li>
                	<li><a href="logout_customer.jsp"><span class="glyphicon glyphicon-off"></span>Logout</a></li>
                </ul>
    		</div>
    	</div>
    </nav>
	<%@page import="getdatabase.*,java.util.*,java.sql.*" %>
	<%
		try{
			Connection cn=Data.getData();
			String acc_no=request.getParameter("acc_no");
			String cusnum=request.getParameter("cusnum");
			String phno=request.getParameter("phno");
			String psw=request.getParameter("psw");
			if(acc_no.equals(session.getAttribute("acc_no"))){
				String sql="select * from customer_tab where acc_no=? and cusnum=? and phno=?";
				PreparedStatement ps=cn.prepareStatement(sql);
				ps.setString(1, acc_no);
				ps.setString(2, cusnum);
				ps.setString(3, phno);
				ResultSet rs=ps.executeQuery();
				if(rs.next()){
					String sql1="update customer_tab set psw=? where acc_no=? and cusnum=? and phno=?";
					PreparedStatement ps1=cn.prepareStatement(sql1);
					ps1.setString(1, psw);
					ps1.setString(2, acc_no);
					ps1.setString(3, cusnum);
					ps1.setString(4, phno);
					ps1.executeUpdate();	
				%>
				<div class="alert alert-success container text-center alert-dismissable">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  					<h4><strong>Your Profile's Password has been updated successfully...</strong></h4>
				</div>
				<%}else{ %>
				<div class="alert alert-warning container text-center alert-dismissable">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  					<h4><strong>Warning! </strong>Please enter2 correct details...</h4>
				</div>
				<%} %>
			<%}else{ %>
				<div class="alert alert-warning container text-center alert-dismissable">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  					<h4><strong>Warning! </strong>Please enter1 correct details...</h4>
				</div>
			<%} %>
		<%}catch(Exception e){
			System.out.print(e);
		}
	%>
	
	<div class="col-md-3"></div>
	<div class="container well col-md-6">
   		<form action="" name="sgu" method="post" onsubmit="return validate()">
   	 		<table align="center" class="table table-bordered">
          		<tr><th colspan="2" style="text-align:center; background-color: #6D0026"><h1 style="color: white;">Update Profile</h1></th></tr>
          		<tr><td colspan="2"></td></tr>
          		<tr><td><h4 class="text-center">Account no </h4></td><td><input type="text" name="acc_no" class="form-control" placeholder="Enter Account no"></td></tr>
          		<tr><td><h4 class="text-center">Customer Name </h4></td><td><input type="text" name="cusnum" class="form-control" placeholder="Enter Name"></td></tr>
          		<tr><td><h4 class="text-center">Phone-no</h4></td><td><input type="text" name="phno" class="form-control" placeholder="Enter your phone-no"></td></tr>
          		<tr><td><h4 class="text-center">Password</h4></td><td><input type="password" name="psw" class="form-control"placeholder="Enter password"></td></tr>
         		<tr><td><h4 class="text-center">Re-enter Password</h4></td><td><input type="password" name="rpsw" class="form-control"placeholder="Re-Enter password"></td></tr>
				<tr><td colspan="2" class="text-center"><button type="submit" class="btn btn-success btn-lg">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-danger btn-lg">Clear</button></td>
				</tr>
			</table>
		</form>
		</div>
		<br>
	</div>
	<footer>
		<p	style="color: white; text-align: center;">Copyright&copy; 2017 STS Bank. All Rights Reserved</p>
	</footer>
</body>
</html>