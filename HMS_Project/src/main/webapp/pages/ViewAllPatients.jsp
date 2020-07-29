<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

    <!--MD Bootstrap css-->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
    <!--MD Bootstrap css-->
    <!--MD Bootstrap js-->
    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js">
    </script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js">
    </script>
    <!--MD Bootstrap js-->

    <link rel="stylesheet" href="../new css/viewPatients.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#dtDynamicVerticalScrollExample').DataTable({
                "scrollY": "50vh",
                "scrollCollapse": true,
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
			<%@ include file="nav2.jsp" %>
        <div class="row d-flex justify-content-center">

            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8  align-middle ">

                <div class="row">
                    <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                        <h3 style="font-weight: bold;">
                            View Patients
                        </h3>
                    </div>
                </div>
                <div class="wrapper mx-auto ">
                    <table class=" table white">
                        <thead class="black white-text">
                            <tr>
                                <th class="sticky-top" scope="col">Patient Id</th>
                                <th class="sticky-top" scope="col">Name</th>
                                <th class="sticky-top" scope="col">Age</th>
                                <th class="sticky-top" scope="col">Address</th>
                                <th class="sticky-top" scope="col">DOJ</th>
                                <th class="sticky-top" scope="col">Type of Room</th>
                            </tr>
                        </thead>
                        <tbody>

<c:forEach items="${mylist}" var="patients">
	<tr>
		<td>${patients.patientId}</td>
		<td>${patients.name}</td>
		<td>${patients.age}</td>
		<td>${patients.address}</td>
		<td>${patients.dob}</td>
		<td>${patients.typeOfBed}</td>
		</tr>
	</c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>

        </div>

    </div>


</body>

</html>