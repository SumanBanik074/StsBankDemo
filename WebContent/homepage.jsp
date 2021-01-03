<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>STS Bank&reg; Home Page </title>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
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
  		.carousel-inner > .item > img,
  		.carousel-inner > .item > a > img {
      		width: 70%;
      		margin: auto;
  		}
  		li{
  			font-size: large;
  		}
	</style>
	<script>
	function validcheck1(){
		var cust=document.hp.cusnum;
		var acc=document.hp.acc_no;
		var pass=document.hp.psw;
		
		if(cust.value==""){
			alert("Customer name must not be blank");
			cust.focus();
			return false;
		}
		else if(acc.value==""){
			alert("Account number must not be blank");
			acc.focus();
			return false;
		}
		else if(pass.value==""){
			alert("Password must not be blank");
			pass.focus();
			return false;
		}
		else if (!(pass.value.length==8)) {
			alert("password must be 8");
			pass.focus();
			pass.select();
			return false;
		}
	}
	function validcheck2(){
		var adm=document.hp2.adm_num;
		var pass=document.hp2.adpsw;
		
		if(adm.value==""){
			alert("Admin name must not be blank");
			adm.focus();
			return false;
		}
		else if(pass.value==""){
			alert("Password must not be blank");
			pass.focus();
			return false;
		}
		else if (!(pass.value.length==6)) {
			alert("password must be 6");
			pass.focus();
			pass.select();
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
	<div  style="background-color: #ffe5cc;" id="home">
	<nav class="navbar navbar-default" id="navbar">
		<div class="container">
			<ul class="nav navbar-nav">
      			<li class="active" style="padding-right: 30px;"><a href="#home">Home</a></li>
      			<li style="padding-right: 30px;"><a href="#service">Service</a></li>
      			<li style="padding-right: 30px;"><a href="#aboutUs">About us</a></li>
      			<li style="padding-right: 30px;"><a href="#contactUs">Contact us</a></li>
    		</ul>
    		<ul class="nav navbar-nav navbar-right">
    			<li><a href="signup.html"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li> 
      			<li>
      				<a  data-toggle="modal" data-target="#myModal" href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a>
      				<div class="modal" id="myModal" role="dialog">
   						<div class="modal-dialog">	
     						<div class="modal-content">
       							 <div class="modal-header" style="background-color: #5cb85c; text-align: 
       							 center;padding:35px 50px;font-size:larger;">
          							<button type="button" class="close" data-dismiss="modal">&times;</button>
          							<h1 class="modal-title"><span class="glyphicon glyphicon-user"></span>Customer Login here</h1>
       							 </div>
								<div class="modal-body"  style="padding:40px 50px;">
         							<form role="form" action="customer_login" method="post" name="hp" onsubmit="return validcheck1()">
           								 <div class="form-group">
              								<label for="customername"><span class="glyphicon glyphicon-user"></span> Customer name</label>
              								<input type="text" class="form-control" name="cusnum" placeholder="Enter Customer name">
            							</div>
            							<div class="form-group">
              								<label for="accountname">Account no.</label>
              								<input type="text" class="form-control" name="acc_no" placeholder="Enter Account no.">
            							</div>
            								<div class="form-group">
              								<label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             								 <input type="password" class="form-control" name="psw" placeholder="Enter password">
            								</div>
              							<button type="submit" class="btn btn-success btn-block">
              								<span class="glyphicon glyphicon-off"></span> Login</button>
          							</form>
        						</div>
        						<div class="modal-footer">
          							<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
          							<span class="glyphicon glyphicon-remove"></span> Cancel</button>
          							<p>Forgot <a href="forgetPas_cus.jsp">Password?</a></p>
        						</div>
      						</div>
    					</div>
					</div>
      			</li>
      			<li>
      				<a  data-toggle="modal" data-target="#myAdModal" style="padding-left: 50px;" href="#">
      					<span class="glyphicon glyphicon-lock"></span> Admin</a>
      				<div class="modal" id="myAdModal" role="dialog">
   						<div class="modal-dialog">	
     						<div class="modal-content">
       							 <div class="modal-header" style="background-color: #3385ff; text-align: 
       							 center;padding:35px 50px;font-size:larger;">
          							<button type="button" class="close" data-dismiss="modal">&times;</button>
          							<h1 class="modal-title"><span class="glyphicon glyphicon-lock"></span>Administrator Login here</h1>
       							 </div>
								<div class="modal-body"  style="padding:40px 50px;">
         							<form role="form" action="admin_login" method="post" name="hp2" onsubmit="return validcheck2()">
           								 <div class="form-group">
              							<label for="customername"><span class="glyphicon glyphicon-user"></span> Admin name</label>
              							<input type="text" class="form-control" name="adm_num" placeholder="Enter Customer name">
            							</div>
            								<div class="form-group">
              								<label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
             								 <input type="password" class="form-control" name="adpsw" placeholder="Enter password">
            								</div>
              								<button type="submit" class="btn btn-primary btn-block">
              								<span class="glyphicon glyphicon-off"></span> Login</button>
          							</form>
        						</div>
        						<div class="modal-footer">
          							<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
          							<span class="glyphicon glyphicon-remove"></span> Cancel</button>
          							
        						</div>
      						</div>
    					</div>
					</div>
				</li>
      			
    		</ul>
		</div>
	</nav>
	<div>
		<div class="container">
   		<% if(session.getAttribute("flash_msg") != "" && session.getAttribute("flash_msg") != null) { %>
   			<div class="alert alert-warning text-center"><h4><strong>Alert!</strong> <%=session.getAttribute("flash_msg")%></h4></div>
  		<% session.removeAttribute("flash_msg"); } %>
   		</div>
		<h1 style="text-align: center">Welcome to STS Bank</h1>
		<div class="container">
  			<div id="myCarousel" class="carousel slide" data-ride="carousel">
   			 	<ol class="carousel-indicators">
      				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      				<li data-target="#myCarousel" data-slide-to="1"></li>
      				<li data-target="#myCarousel" data-slide-to="2"></li>
    			</ol>
    			<div class="carousel-inner" role="listbox">
     	 			<div class="item active">
        				<img src="Internet-Banking.jpg" alt="InternetBanking">
      				</div>
					<div class="item">
        				<img src="upi9.png" alt="upi">
        			</div>
        			<div class="item">
        				<img src="internetbanking2.6-636x295.jpg" alt="internetbanking">
        			</div>
    			</div>
    			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      				<span class="sr-only">Previous</span>
    			</a>
    			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      				<span class="sr-only">Next</span>
    			</a>
			</div>
		</div>
	</div>
	<br>
	<div id="service" class="container text-center ">
		<h1>SERVICES</h1>
		<br>
		<p style="font-family: Cambria; font-size: x-large;">
			A bank's job is to provide customer with financial service that help people manage their life.<br>Our STS Bank 
			provides variety of services including...<br>Savings Account.<br>Current Account.<br>Credit Plans.<br>Life Insurance.
			<br>Mobile Banking<br><img alt="mobile banking" src="mobile_banking.jpg"><img alt="life insurance" src="Life_Insurance.jpg">
			<br>Besides it also
			Provides customer with scope of Digital Banking, where people can pay their <br>Telephone Bills and Electricity Bills.<br>
			We are dedicated to helping our customers get most out of their money. That's why we are offer different types of banking
			to meet a variety of needs.
		</p>
	</div>
	<br>
	<div id="aboutUs" class="container text-center">
		<h1>ABOUT US</h1>
			<img alt="aboutus" src="About_us.jpg">
		<p style="font-family: Cambria; font-size: x-large;">
			STS Bank stands tall today as one of the reputed banks in the country.<br>
			 The Bank offers a wide range of innovative products and banking services.	
		</p>
			<img alt="image" src="image.jpg">
	</div>
	<br>
	<div id="contactUs" class="container text-center">
		<h1>CONTACT US</h1>
		<p style="font-family: Cambria; font-size: x-large;">Suman Banik: 8670562542,<br>Triparno Das: 9674637590,<br>Sagar Ghosh: 7063452158
		<br>E-mail: sumanbanik074@gmail.com
		<br>triparno.14das@gmail.com
		<br>sagarghosh209@gmail.com
		</p>
	</div>
	<br>
	</div>
	<footer class="text-center">
		<a class="up-arrow" href="#home" data-toggle="tooltip" title="TO TOP">
    		<span class="glyphicon glyphicon-chevron-up"></span>
  		</a><br><br>
		<p	style="color: white;">Copyright&copy; 2017 STS Bank. All Rights Reserved</p>
	</footer>
</body>
</html>