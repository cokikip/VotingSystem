<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sueu Voting System</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/style.js"></script>
</head>
<body>
	<img class="logo" src="images/logo.png"></img>
	<%
		String message = (String) request.getAttribute("message");
		if (message == null) {
	%>
	<div class="container-fluid">
	<div class="row login">
 <div class="col-sm-4"></div>
	<div class="col-sm-4 ">
		<br> <br> <br> <br>
		<div class="log w3-blue">
			<label><b class="w3-text-middle">Login to Vote</b> </label>
		</div>
		<br>
		<form action="verification" method="post" id="loginForm">
			<div>
				<label>Registration Number</label> <input type="text"
					class="w3-input" name="regNo" id="regNo">
			</div>
			<br>
			<div>
				<label>Password</label> <input type="password" class="w3-input"
					name="password">
			</div>
			<br>
			
			<button type="submit" class="btn btn-success w3-right" id="loginButton" >login</button>
			<br> <br> <!--  <a href="forgot.jsp" class="w3-right">Forgot
				your password?</a>-->
		</form>
	</div>
	<div class="col-sm-4"></div>
	</div>
	</div>
	<%
		} else {
	%>

      <div class="container-fluid">
      <div class="row login">
     <div class="col-sm-4"></div>
	<div class="col-sm-4">
		<br> <br> <br> <br> <br>
		<div class="log w3-blue">
			<label><b class="w3-text-middle">Login to Vote</b> </label>
		</div>
	 <br>
		<form action="<%= response.encodeURL("verification")%>" method="post">
			<div>
				<label>Registration Number</label> <input type="text"
					class="w3-input" name="regNo">
			</div>
			<br>
			<div>
				<label>Password</label> <input type="password" class="w3-input"
					name="password">
			</div>
			<br>
			
			<button type="submit" class="btn btn-success w3-right" >login</button>
			<br> <br><!--  <a href="forgot.jsp" class="w3-right">Forgot
				your password?</a>-->
			<h6 style="color: red" class="w3-left">
				<%=message%>
			</h6>
		</form>
	</div>
	<div class="col-sm-4"></div>
	</div>
	</div>
	<%
		}
	%>

</body>
</html>