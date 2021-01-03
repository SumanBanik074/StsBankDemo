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
   <title>STS Bank&reg; Update Customer Details </title>
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
		 
		 var x= document.sgu.cusnum;
		 var y=document.sgu.acc_no;
		 var p1=document.sgu.addr;
		 var p2=document.sgu.phno;
		 
		 if(y.value==""){
			 alert("Enter account number");
			 y.focus();
			 return false;
		 }
		 else if(x.value==""){
				alert("enter customer name");
				x.focus();
				return false;
			}
		 else if(p1.value==""){
			   alert("Address field must not be empty");
			    p1.focus();
			    p1.select();
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
    <%@page import="getdatabase.*,java.sql.*,java.util.*" %>
    <%
    try{
		Connection cn=Data.getData();
		String acc_no=request.getParameter("acc_no");
		String cusnum=request.getParameter("cusnum");
		String acc_type=request.getParameter("acc_type");
		String addr=request.getParameter("addr");
		String phno=request.getParameter("phno");
		String sql="select * from customer_tab where acc_no=?";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, acc_no);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			String sql1="update customer_tab set cusnum=?,acc_type=?,addr=?,phno=? where acc_no=?";
			PreparedStatement ps1=cn.prepareStatement(sql1);
			ps1.setString(1, cusnum);
			ps1.setString(2, acc_type);
			ps1.setString(3, addr);
			ps1.setString(4, phno);
			ps1.setString(5, acc_no);
			ps1.executeUpdate();
		%>
			<div class="alert alert-success container text-center alert-dismissable">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
  				<h4><strong>Account details has been updated successfully...</strong></h4>
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
   		<form action="" name="sgu"method="post" onsubmit="return validate()">
   	 		<table align="center" class="table table-bordered">
          		<tr><th colspan="2" style="text-align:center;" class="p2"><h1 style="color: white;">Update</h1></th></tr>
          		<tr><td colspan="2"></td></tr>
          		<tr><td><h4 class="text-center">Account No</h4></td><td><input type="text" name="acc_no" class="form-control" placeholder="Enter Account number"></td></tr>
          		<tr><td><h4 class="text-center">Customer Name </h4></td><td><input type="text" name="cusnum" class="form-control" placeholder="Enter Name"></td></tr>
          			<tr><td><h4 class="text-center">Account-type</h4></td>
        	 		<td><select class="form-control" name="acc_type">
        	    		<option value="Savings Account" class="form-control">Savings Account</option>
        	 			<option value="Current Account" class="form-control">Current Account</option>
					</select></td></tr>
    			<tr><td><h4 class="text-center">Address</h4></td><td><textarea name="addr" class="form-control"placeholder="Enter your Address" ></textarea></td></tr>
    			<tr><td><h4 class="text-center">Phone-no</h4></td><td><input type="text" name="phno" class="form-control"placeholder="Enter your phone-no"></td></tr>
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
</head>

</html>