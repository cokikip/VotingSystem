<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Confirm</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/style.js"></script>

</head>
<body>
<%@ page import="java.util.*,javax.servlet.*"%>
<% 
//allow access only if student session exists
String user = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) {
		user = cookie.getValue();
		break;
	}
	}
 if(user.equals("student")){
	
 %>
	
	<%@ include file="/header.jsp"%>
	<br>
	<div class="col-sm-3"></div>
	<div class="col-sm-6">
	<form action="<%=response.encodeURL("count")%>" method="post">
		<table class="w3-table container">
			<tr>
				<td><label class="w3-text-green"><b>Confirm your
							choices before voting</b></label></td>
			</tr>
			<tr class="w3-red">
				<th>Position</th>
				<th>Chosen candidate</th>
			</tr>

			<%
				Enumeration enumeration = request.getParameterNames();
				if (!(enumeration.hasMoreElements())) {
					response.sendRedirect("vote.jsp");
				} else {
					while (enumeration.hasMoreElements()) {
						String paramName = (String) enumeration.nextElement();
			%>
			<tr>
				<td><%=paramName%></td>
				<td><input readonly type="text" name="<%=paramName%>"
					value="<%=request.getParameter(paramName)%>" /></td>
			</tr>
			<%
				}
				}
			%>

			<tr>
				<td></td>
				<th><a href="#" onClick="javascript:history.back()"
					class="w3-btn w3-ripple w3-blue">Edit</a>
					<button type="submit"
						class="w3-btn w3-ripple w3-green w3-hover-border-khaki ">Submit
						votes</button></th>
			</tr>

		</table>
	</form>
	<br>
	</div>
	<div class="col-sm-3"></div>
	<%  }
}

%>
</body>
</html>