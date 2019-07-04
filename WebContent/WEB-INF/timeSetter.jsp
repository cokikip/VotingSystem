<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/datetimepicker.min.css">

<script src="js/jquery2.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/datetimepicker.min.js"></script>
<script src="js/style.js"></script>

</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ page import="votingServlets.TimeSetter" %>

	<div class="container">
		<div class="row">
		<div class="col-sm-3"></div>
			<div class='col-sm-6'>
			<form action="<%=response.encodeURL("timer")%>" method="post">
				<div class="form-group">
					<div class='input-group date' id='datetimepicker1'>
						<input type='text' name="timer" class="form-control" /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
				</div>
				<button class="btn btn-success" >Set</button>
				</form>
			</div>
			
			
			<div class="col-sm-3"></div>
		</div>
	</div>
	<script type="text/javascript">
				$(function() {
					$('#datetimepicker1').datetimepicker();
					
				});
			
			</script>
</body>
</html>