<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration</title>
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
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) {
		user = cookie.getValue();
		break;
	}
	}
 if(user.equals("admin")){
	
 %>
	<%@ page import="votingServlets.Student"%>
	<%@ include file="/header.jsp"%>
	<div class="container-fluid">
	<div class="row regRow">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<%
			 String error = (String) session.getAttribute("error");
			if (error != null){%>
				<h3 style="color: red"><%=error%></h3>
			<br>
			<%} else{
			}
				Student student = (Student) session.getAttribute("student");
				if (student == null) {
			%>
			<div class="log w3-blue">
				<label><b class="w3-text-middle">Register Contestant</b> </label>
			</div>
			<br>
			<form action="search" method="post" id="searchForm">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Registration number" name="regNo" id="regNo">
					<div class="input-group-btn">
						<button type="submit" class="btn btn-success" id="searchButton">Search</button>
					</div>
				</div>
				<br>
				
			</form>
			<%
				} else {
			%>
			<div class="log w3-blue">
				<label><b class="w3-text-middle">Register Contestant</b> </label>
			</div>
			<br>
			<form action="search" method="post" id="searchForm">
				<div class="input-group">
					<input type="text" class="form-control"
						placeholder="Registration number" name="regNo" id="regNo">
					<div class="input-group-btn">
						<button type="submit" class="btn btn-success" id="searchButton">Search</button>
					</div>
				</div>
			</form>
			<br>
			<div class="log regColor">
				<label><%="Name : " + student.getFirstName() + " " + student.getLastName() + "<br>RegNumber : "
						+ student.getRegNo()%></label>
			</div>
			<label>Select Position</label> <br>
			<form action="register" method="post" enctype="multipart/form-data">
				<table border="1" class="table table-striped">
					<tr>
						<td>Major Positions</td>
						<td><label><input type="radio" value="Mchairman"
								name="position">Chairman</label> <label><input
								type="radio" value="Mvice-chairman" name="position">Vice
								Chairman</label> <label><input type="radio" value="Msecurity"
								name="position">Security</label>
								<label><input type="radio"
								value="Mentertainment" name="position">Entertainment</label>
								</td>
						
					</tr>
					<tr>
						<td>Residential Positions</td>
						<td><label><input type="radio" value="Mburuburu"
								name="position">BuruBuru</label> <label><input
								type="radio" value="Mtatton" name="position">Tatton</label></td>
					</tr>
					<tr>
						<td>Faculty Positions</td>
						<td><label><input type="radio" value="Mscience"
								name="position">Science</label> <label><input
								type="radio" value="Magriculture" name="position">Agriculture</label></td>
					</tr>
				</table>

				<br> <label>Add Image</label> <br>
				<div class="input-group">
					<label class="input-group-btn"> <span
						class="btn btn-info btn-file"> Browse <input type="file"
							name="image" id="imgInp">
					</span>
					</label> <input type="text" class="form-control" readonly>
				</div>
				<br> <input hidden type="text"
					value=<%=student.getFirstName()%> name="fName"> <input
					hidden type="text" value=<%=student.getLastName()%> name="lName">
				<button class="btn btn-success w3-right">Submit</button>
				<br>
				<br>
				<br>
			</form>
			<%
				}
			%>
		</div>
		<div class="col-sm-4"></div>
	</div>
	</div>
	<%  }
}

%>
</body>
</html>