<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Voting</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/style.js"></script>

</head>
<body>
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

	<%@ page
		import="java.util.List,votingServlets.Position,votingServlets.Contestant,votingServlets.Student"%>
	<%@ include file="/header.jsp"%>
	<br>
	<div class="container voteContainer">
		<form action="<%= response.encodeURL("confirm.jsp")%>" method="post">
			<%
				List<Position> positions = (List<Position>) session.getAttribute("positions");
				for (Position position : positions) {
			%>
	
			<div class="w3-third panelCont">
				<div class="panel">
					<div class="panel-header w3-blue w3-round">
						<h1><%=position.getPositionName()%></h1>
					</div>
					<div class="panel-body op1">
						<%
							List<Contestant> contestants = position.getContestants();
								for (Contestant contestant : contestants) {
						%>
						<div class="w3-card-4 w3-light-grey">
							<div class="w3-container ">
								<%
									String b64 = contestant.getBase64image();
								    String posName = position.getPositionName();
								    String contName = contestant.getName();
								    
								%>
								<input type="radio" class="w3-radio"
									name=<%=posName%>
									value=<%=contName%>>
								<img src="data:image/jpg;base64,<%=b64%>"
									class="img-rounded w3-circle" width="100" height="100"> <label><%=contestant.getFirstName() + " " + contestant.getLastName()%></label>
							</div>
						</div>
						<br>
						<%
							}
						%>
					</div>
				</div>
			</div>

			<%
				}
			%>
			<button type="submit" class="btn btn-success voteButton">Confirm</button>
		</form>
     
	</div>
   <br><br>
 <%  }
}

%>
</body>
</html>