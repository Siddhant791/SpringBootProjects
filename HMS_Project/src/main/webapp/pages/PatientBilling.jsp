<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <link rel="stylesheet" href="../new css/login.css">

    <style>
        .input-icons i {
            position: absolute;
        }

        .input-icons {
            width: 100%;
            margin-bottom: 10px;
        }

        .icon {
            padding: 10px;
            min-width: 40px;
        }

        .input-field {
            text-align: left;
            border: none;
            width: 50%;
        }

        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
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
                            Patient Billing
                        </h3>
                    </div>
                </div>

                <div class="row " style="margin-bottom: 0%;padding-bottom: 0%;">

                    <table style="margin-bottom: 0%;padding-bottom: 0%;"
                        class="table white table-sm table-bordered text-center">
                        <thead class="black white-text ">
                            <tr>
                                <th scope="col">Patient Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Age</th>
                                <th scope="col">Address</th>
                                <th scope="col">DOJ</th>
                                <th scope="col">Date of Discharge</th>
                                <th scope="col">Type of Room</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">
                                    <form action="/FindBillOfPatient">
                                        <input class="input-field" type="number" name="patientId" required>
                                        <button type="submit"><i class="fa fa-search icon"></i></button>
                                    </form>

                                </th>
                                <td>${patientDetails.name}</td>
                                <td>${patientDetails.age}</td>
                                <td>${patientDetails.address}</td>
                                <td>${patientDetails.dob}</td>
                                <td>${DateOfDischarge}</td>
                                <td>${patientDetails.typeOfBed}</td>
                            </tr>
                        </tbody>
                    </table>


                </div>

                <div class="row d-flex justify-content-end">
                    <table class="text-center">
                        <thead>
                            <tr>
                                <th style="padding:5px 15px 0 15px ;" scope="col">
                                    <p class="font-weight-bold">No. of Days</p>
                                </th>
                                <th style="padding:5px 15px 0 15px ;" scope="col">
                                    <p>${NoOfDays}</p>
                                </th>
                                <th style="padding:5px 15px 0 15px ;" scope="col">
                                    <p class="font-weight-bold">Bill for Room</p>
                                </th>
                                <th style="padding:5px 15px 0 15px " scope="col">
                                    <p>Rs.${ChargesForRoom}</p>
                                </th>
                            </tr>
                        </thead>
                    </table>
                </div>

                <div class="row">
                    <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                        <h3 style="font-weight: bold;">
                            Pharmacy Charges
                        </h3>
                    </div>
                </div>

                <div class=" row d-flex justify-content-center">


                    <div class=" col-xs-10 col-sm-10 col-md-10 col-lg-10 text-center">
                        <table style="padding-bottom: 0px;margin-bottom: 0px;"
                            class="table white table-sm table-bordered text-center">
                            <thead class="black white-text ">
                                <tr>
                                    <th scope="col">Medicine</th>
                                    <th scope="col">Quantitiy</th>
                                    <th scope="col">Rate</th>
                                    <th scope="col">Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                            	
                            	<c:forEach items="${patientMedicineDetails}" var="patientMedicineDetails" varStatus="status">
									<tr>
										<td>${patientMedicineDetails.medicineIssued}</td>
										<td>${patientMedicineDetails.quantityIssued}</td>
										<td>${rateArray[status.index]}</td>
										<td>${amountArray[status.index]}</td>
									</tr>
								</c:forEach>

                            </tbody>
                        </table>
                    </div>

                </div>

                <div class=" row d-flex justify-content-center">
                    <div class=" col-xs-10 col-sm-10 col-md-10 col-lg-10 text-center">
                        <div class="row d-flex justify-content-end">
                            <table class="text-center">
                                <thead>
                                    <tr>

                                        <th style="padding:5px 15px 0 15px ;" scope="col">
                                            <p class="font-weight-bold">Bill for Pharmacy</p>
                                        </th>
                                        <th style="padding:5px 15px 0 15px " scope="col">
                                            <p>Rs. ${totalBillOfMedicines}</p>
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>



                <div class="row">
                    <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                        <h3 style="font-weight: bold;">
                            Diagnostics Charges
                        </h3>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">


                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 text-center">
                        <table style="padding-bottom: 0px;margin-bottom: 0%;"
                            class="table white table-sm table-bordered text-center">
                            <thead class="black white-text ">
                                <tr>
                                    <th scope="col">Name of Test</th>
                                    <th scope="col">Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                            
                               <c:forEach items="${patientDiagnosticDetails}" var="patientDiagnosticDetails" varStatus="status">
									<tr>
										<td>${patientDiagnosticDetails.testName1}</td>
										<td>${amountArrayForDiagnostics[status.index]}</td>
									</tr>
								</c:forEach>
                            	
                            </tbody>
                        </table>
                    </div>




                </div>

                <div class=" row d-flex justify-content-center">
                    <div class=" col-xs-10 col-sm-10 col-md-10 col-lg-10 text-center">
                        <div class="row d-flex justify-content-end">
                            <table class="text-center">
                                <thead>
                                    <tr>

                                        <th style="padding:5px 15px 0 15px ;" scope="col">
                                            <p class="font-weight-bold">Bill for Diagnostics</p>
                                        </th>
                                        <th style="padding:5px 15px 0 15px " scope="col">
                                            <p>Rs.${totalBillOfDiagnostics}</p>
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>


                <div class=" row d-flex justify-content-center">
                    <div class=" col-xs-10 col-sm-10 col-md-10 col-lg-10 text-center">
                        <div class="row d-flex justify-content-end">
                            <table class="text-center">
                                <thead>
                                    <tr>

                                        <th style="padding:5px 15px 0 15px ;" scope="col">
                                            <h6 class="font-weight-bold">Grant Total</h6>
                                        </th>
                                        <th style="padding:5px 15px 0 15px " scope="col">
                                            <h6 class="font-weight-bold">Rs.${finalBill}</h6>
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">

                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <a href="/discharge?patientId=${patientIdToDischarge}"><button style="border-radius: 20px  " type="button"
                            class="btn btn-dark btn-rounded">Confirm</button></a>
                    </div>
                </div>

            </div>

        </div>



    </div>
<%

	if(request.getAttribute("PatientBillingError")==null){}
	else if(request.getAttribute("PatientBillingError").equals(true)){
%>
	<script>
		alert("Incorrect PatientId");
	</script>
<%
	}
%>

</body>

</html>