<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signup</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/style.js"></script>
</head>
<body>
	<%
		//allow access only if admin session exists
		String user = null;

		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user")) {
					user = cookie.getValue();
					break;
				}
			}
			if (user.equals("admin")) {
	%>
	<%@ include file="header.jsp"%>
	<div class="container-fluid">
	<div class="row regRow">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="log w3-blue">
				<label><b class="w3-text-middle">SUEU Voter Registration</b>
				</label>
			</div>
			<br>
			<%
						String success = (String) session.getAttribute("success");
                        String error = (String) session.getAttribute("error");
						if (success != null) {
			%>
			<h3 style="color: #00ff00"><%=success%></h3>
			<br>
			<%
				} else if(error != null){%>
				<h3 style="color: red"><%=error%></h3>
			<br>
				<%} %>

			<form action="<%=response.encodeURL("registerVoter")%>"
				method="post" id="regForm">
				<div>
					<label>First name</label> <input type="text" name="fName" id="fName"
						class="w3-input">
				</div>
				<br>
				<div>
					<label>Last name</label> <input type="text" name="lName" id="lName"
						class="w3-input">
				</div>
				<br>
				<div>
					<label>Registration Number</label> <input type="text" name="regNo" id="regNo"
						class="w3-input">
				</div>
				<br>
				<div>
					<label>Faculty</label> <select class="form-control" name="faculty">
						<option value="science">science</option>
						<option value="maths">agriculture</option>
					</select>
				</div>
				<br>
				<div>
					<label>Residence</label> <select class="form-control"
						name="residence">
						<option value="buruburu">buruburu</option>
						<option value="tatton">tatton</option>
					</select>
				</div>
				<br>

				<button type="submit"
					class="w3-btn w3-ripple w3-green w3-hover-border-khaki w3-right"
					onclick="validation(this.form)" id="regButton">Register</button>
				<br> <br>
				<br>
			</form>
		</div>
		<div class="col-sm-4"></div>
	</div>
	</div>
	<%
		}
		}
	%>
	
</body>
</html>