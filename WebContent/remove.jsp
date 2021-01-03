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
   	<title>STS Bank&reg; Remove Customer page </title>
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
	function validate(){
		 
		 var x=document.sgu.cusnum;
		var y=document.sgu.acc_no;
		 
		 
		 if(x.value==""){
				alert("enter customer name");
				x.focus();
				return false;
				
				
			}
		 else if(acc.value==""){
				alert("Enter account number");
				acc.focus();
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
   <%@page import="getdatabase.*,java.sql.*,java.util.*"%>
   <%
   try{
		Connection cn=Data.getData();
		String cusnum=request.getParameter("cusnum");
		String acc_no=request.getParameter("acc_no");
		String sql="select * from customer_tab where acc_no=? and cusnum=?";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, acc_no);
		ps.setString(2, cusnum);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			String sql1="delete from customer_tab where acc_no=? and cusnum=?";
			PreparedStatement ps1=cn.prepareStatement(sql1);
			ps1.setString(1, acc_no);
			ps1.setString(2, cusnum);
			ps1.execute();
   %>
   			<div class="alert alert-success container text-center alert-dismissable">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  				<h4><strong>Your account has been successfully closed...</strong></h4>
			</div>
   <%}else{ %>
			<div class="alert alert-warning container text-center alert-dismissable">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  				<h4><strong>Warning! </strong>Please enter details...</h4>
			</div>
		<%} %>
   <%
    	}catch(Exception e){
			System.out.println(e);
		}
    %>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="container well col-md-6">
   		<form action="" name="sgu" method="post" onsubmit="return validate()">
   	 		<table align="center" class="table table-bordered">
          		<tr><th colspan="2" style="text-align:center;" class="p2"><h1 style="color: white;">Remove customer</h1></th></tr>
          		<tr><td colspan="2"></td></tr>
          		<tr><td><h4 class="text-center">Customer Name </h4></td>
          		<td><input type="text" name="cusnum" class="form-control" placeholder="Enter Name"></td></tr>
          		<tr><td style="text-align: center;"><h4>Account No</h4></td>
          		<td><input type="text" name="acc_no" class="form-control" placeholder="Enter account no"></td></tr>	
		        <tr><td colspan="2" class="text-center"><button type="submit" class="btn btn-success btn-lg">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;		<button type="reset" class="btn btn-danger btn-lg">Clear</button></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<br>
	</div>
	<footer style="text-align:center">
		<p	style="color: white;" class="text-center">Copyright&copy; 2017 STS Bank. All Rights Reserved</p>
	</footer>
</body>
</html>
