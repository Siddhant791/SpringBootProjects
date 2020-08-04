<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

<!--MD Bootstrap css-->
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css"
	rel="stylesheet">
<!--MD Bootstrap css-->
<!--MD Bootstrap js-->
<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js">
	
</script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js">
	
</script>
<!--MD Bootstrap js-->

<link rel="stylesheet" href="../new css/viewPatients.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#dtDynamicVerticalScrollExample').DataTable({
			"scrollY" : "50vh",
			"scrollCollapse" : true,
		});
		$('.dataTables_length').addClass('bs-select');
	});
</script>
<style>
.wrapper {
	height: 500px;
	border: 1px solid #333;
	overflow-y: auto;
}

thead th {
	background: #000;
	z-index: 999 !important;
}
</style>

</head>

<body class="blue">

	<div class="container-fluid ">
		<%@ include file="nav2.jsp"%>
		<div class="row d-flex justify-content-center">
			<%-- 			<%
				if (request.getSession().getAttribute("SearchPatientList") == null) {

			} else if (request.getSession().getAttribute("SearchPatientList").equals(true)) {
			%> --%>
			<form action="/searchEmployeeListByName" method="get">
				<div class="row">

					<div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
						<h5 style="font-weight: bold;">
							Employee Name *
							</h6>
					</div>
					<div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<input id="name" required name="name" type="text"> <input
							type="submit" value="GET"
							style="border-radius: 20px; padding: 1% 10% 1% 10%;"
							class="btn-dark btn-rounded">
					</div>
				</div>
		</div>
		</form>
		<%
			if (request.getSession().getAttribute("SearchPatientList").equals(false)) {
		%>
		<div class="col-xs-12 col-sm-12 col-md-8 col-lg-12  align-middle ">

			<div class="row">
				<div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
					<h3 style="font-weight: bold;">View Employees</h3>
				</div>
			</div>
			<div class="wrapper mx-auto ">
				<table class=" table white">
					<thead class="black white-text">
						<tr>
							<th class="sticky-top" scope="col">Name</th>
							<th class="sticky-top" scope="col">gender</th>
							<th class="sticky-top" scope="col">phone</th>
							<th class="sticky-top" scope="col">qualification</th>
							<th class="sticky-top" scope="col">district</th>
							<th class="sticky-top" scope="col">canSpeakEnglish</th>
							<th class="sticky-top" scope="col">workedBefore</th>
							<th class="sticky-top" scope="col">discDate</th>
							<th class="sticky-top" scope="col">action</th>
							<th class="sticky-top" scope="col">drivingLicence</th>
							<th class="sticky-top" scope="col">bike</th>
							<th class="sticky-top" scope="col">other</th>

						</tr>
					</thead>
					<tbody>

						<c:forEach items="${mylist}" var="patients">
							<tr>
								<td>${patients.name}</td>
								<td>${patients.gender}</td>
								<td>${patients.phone}</td>
								<td>${patients.qualification}</td>
								<td>${patients.district}</td>
								<td>${patients.canSpeakEnglish}</td>
								<td>${patients.workedBefore}</td>
								<td>${patients.discDate}</td>
								<td>${patients.action}</td>
								<td>${patients.drivingLicence}</td>
								<td>${patients.bike}</td>
								<td>${patients.other}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>

	</div>

	</div>
	<%
		}
	%>

</body>

</html>