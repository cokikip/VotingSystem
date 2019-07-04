<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Results</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/style.js"></script>
</head>
<body class="w3-light-gray">
	<%@ page import="java.util.*,votingServlets.Position,votingServlets.Contestant"%>
	<%@ include file="header.jsp"%>
	<br><br>
	<div class="container">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="col-sm-6">
				<div style="width: 30px; height: 30px;" class="w3-green"></div>
				<label>Winner</label>
			</div>
			
			<div class="col-sm-6">
				<div style="width: 30px; height: 30px;" class="w3-blue"></div>
				<label>Runners up</label>
			</div>
			
	<%
    List<Position> posList = (List<Position>)session.getAttribute("posList");
	
    for(Position position : posList){
    	
    
         %>
            <br>
			<label><%= position.getPositionName() %></label>
			
			<table class="w3-table w3-bordered w3-striped">
			<tr>
			<th>Position</th>
			<th>Name</th>
			<th>Votes garnered</th>
			</tr>
			<% 
			int count = 0;
			List<Contestant> contList = position.getContestants();
			for(Contestant contestant : contList) {
				count++;
				if(count==1){
			%>
			<tr class="w3-green">
			<td><%= count %></td>
			<td><%= contestant.getFirstName()%> &nbsp; <%= contestant.getLastName() %></td>
			<td><%= contestant.getVotes() %></td>
			</tr>
			<%
				}else if(count==2){
			 %>
			 <tr class="w3-blue">
			<td><%= count %></td>
			<td><%= contestant.getFirstName()%> &nbsp; <%= contestant.getLastName() %></td>
			<td><%= contestant.getVotes() %></td>
			</tr>
			</table>
			<%}else{%>
				<tr>
				<td><%= count %></td>
				<td><%= contestant.getFirstName()%> &nbsp; <%= contestant.getLastName() %></td>
				<td><%= contestant.getVotes() %></td>
				</tr>
			<% }}}%>
			<br><br>
		</div>
		<div class="col-sm-3"></div>
		
    </div>
	

</body>
</html>