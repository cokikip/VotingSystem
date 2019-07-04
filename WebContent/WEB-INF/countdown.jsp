<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Count Down</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/style.js"></script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ page import="java.io.*,java.sql.*,votingServlets.DBCredentials,votingServlets.TimeSetter"%>
	<%
		response.setIntHeader("Refresh", 5);
		try {
			DBCredentials db = new DBCredentials();
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			Connection conn = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getPassword());
			Statement stmt = conn.createStatement();

			String query3 = "select count(status) from verification where status=true";
			String query4 = "select count(id) from verification";

			ResultSet result = stmt.executeQuery(query3);
			int castedVotes = 0;
			int registeredVoters = 0;
			while (result.next()) {
				castedVotes = result.getInt(1);
			}
			ResultSet result2 = stmt.executeQuery(query4);
			while (result2.next()) {
				registeredVoters = result2.getInt(1);
			}
	%>

	<c:set var="voters" value="<%=registeredVoters%>"></c:set>
	<c:set var="casted" value="<%=castedVotes%>"></c:set>
	<%
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	%>
	<jsp:useBean id="votes" class="votingServlets.Cast" scope="session"></jsp:useBean>
	<jsp:setProperty property="castedVotes" name="votes" value="${casted}" />
	<jsp:setProperty property="registeredVoters" name="votes"
		value="${voters}" />

	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		<form action="<%=response.encodeURL("results")%>" method="get"
			id="form_id"></form>
		<div class="panel countPanel">
			<div class="panel-heading w3-blue">
				<h4>CountDown</h4>
			</div>
			<div class="panel-body">
				<h4>
					Registered Voters : <span style="color: red"><jsp:getProperty
							property="registeredVoters" name="votes" /></span>
				</h4>
				<br>
				<h4>
					Casted Votes : <span style="color: red"><jsp:getProperty
							property="castedVotes" name="votes" /></span>
				</h4>
			</div>
			<div class="panel-footer w3-blue text-center">
			
				<h4 id="demo"></h4>
			</div>
		</div>

	</div>
	<div class="col-sm-4"></div>

	<script>
		// Set the date we're counting down to

		var countDownDate = new Date("02/20/2019 15:15:00").getTime();

		// Update the count down every 1 second
		var x = setInterval(function() {

			// Get todays date and time
			var now = new Date().getTime();

			// Find the distance between now and the count down date
			var distance = countDownDate - now;

			// Time calculations for days, hours, minutes and seconds
			var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
					/ (1000 * 60 * 60));
			var minutes = Math.floor((distance % (1000 * 60 * 60))
					/ (1000 * 60));
			var seconds = Math.floor((distance % (1000 * 60)) / 1000);

			// Output the result in an element with id="demo"
			document.getElementById("demo").innerHTML = days + "d " + hours
					+ "h " + minutes + "m " + seconds + "s ";

			// If the count down is over, write some text 
			if (distance < 0) {
				clearInterval(x);
				document.getElementById("form_id").submit();// Form submission
			}
		}, 1000);
	</script>
</body>
</html>