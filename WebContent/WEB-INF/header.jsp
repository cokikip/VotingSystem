<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="votingServlets.Student" %>
<img class="logo" src="images/logo.png"></img>

<nav class="navbar navbar-default">

	<div class="container-fluid">
       
       <div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">SUEU-VOTE</a>

		</div>
        
        <c:set var="user" value="${cookie.user.getValue()}"></c:set>
		<c:choose>
		<c:when test="${user == 'admin'}">
		
		<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav">
			<li><a><strong>Administrator</strong></a></li>
			<li><a href="registration.jsp"><strong>Register Contestant</strong></a></li>
			<li><a href="signup.jsp"><strong>Register Voter</strong></a></li>
			<li><a href="countdown.jsp"><strong>View Results</strong></a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li><a id="logout" href="<%= response.encodeURL("logout")%>"
				style="text-align: center"><strong><span class="glyphicon glyphicon-log-out"></span>Log out </a></strong></li>
		</ul>
		</div>
		
		</c:when>
		<c:when test="${user == 'student'}">
		
		<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav">
			<li><a><strong>RegNo: <c:out value="${sessionScope.student.getRegNo()}"/></strong></a></li>
			<li><a><strong>Name: <c:out value="${sessionScope.student.getFirstName()}"/>&nbsp;<c:out value="${sessionScope.student.getLastName()}"/>
			</strong></a></li>
			<li><a><strong>Residence: <c:out value="${sessionScope.student.getResidence()}"/></strong></a></li>
			<li><a><strong>Faculty: <c:out value="${sessionScope.student.getFaculty()}"/></strong></a></li>
			<li><a><strong>Status: <c:out value="${sessionScope.student.getStatus()}"/></strong></a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li><a id="logout" href="<%= response.encodeURL("logout")%>"
				style="text-align: center"><strong><span
					class="glyphicon glyphicon-log-out"></span>Log out </strong></a></li>
		</ul>
		
		</div>
		</c:when>
		</c:choose>
		
	</div>
	
	
</nav>
