<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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


    <style>
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
    </div> 

    <div class="row d-flex justify-content-center">

        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8  align-middle ">
            <div class="row">
                <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                    <h3 style="font-weight: bold;">
                        Find Employee
                    </h3>
                </div>
            </div>
            <%
					if(request.getSession().getAttribute("SearchPatient")==null){
						
					}else if(request.getSession().getAttribute("SearchPatient").equals(true)){                
                %>
<!--             <div class="row">
                <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 "> -->
                    <form action="/searchEmployee" method="get">
                        <div class="form ">

                            <div class="row">

                                <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                    <h5 style="font-weight: bold;">Employee Name *</h6>
                                </div>
                                <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <input id="name" required name="name" type="text">
                                    <input type="submit" value="GET" style="border-radius: 20px;padding:1% 10% 1% 10% ;"
                                        class="btn-dark btn-rounded">
                                </div>
                            </div>
                        </div>
                    </form>

<!--                 </div>

            </div> -->
            <%
					}else if(request.getSession().getAttribute("SearchPatient").equals(false)){
                 %>
                <br>
                <div class="form ">

                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Name</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.name}" id="id" required name="patientId"
                                type="text" disabled>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Gender</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.gender}" id="name" name="name" pattern="[A-Za-z]+" required
                                type="text" disabled>

                        </div>

                    </div>
                    
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Phone</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" id="age" value="${patient.phone}" name="age" required type="text" disabled>

                        </div>

                    </div>
                    
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Qualification</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.qualification}" required id="dob" name="dob" type="text" disabled>

                        </div>

                    </div>

                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">District</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" id="address" value="${patient.district}" name="address" required pattern="[a-zA-Z0-9\s]+" id="address"
                                style="resize: none;" disabled>

                        </div>

                    </div>
                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">State</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.state}" id="id" required name="patientId"
                                type="text" disabled>
                        </div>
                    </div>                   
                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">CanSpeakEnglish</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.canSpeakEnglish}" id="id" required name="patientId"
                                type="text" disabled>
                        </div>
                    </div> 
                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">WorkedBefore</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.workedBefore}" id="id" required name="patientId"
                                type="text" disabled>
                        </div>
                    </div>                          
                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">DiscDate</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.discDate}" id="id" required name="patientId"
                                type="text" disabled>
                        </div>
                    </div>  
                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Action</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.action}" id="id" required name="patientId"
                                type="text" disabled>
                        </div>
                    </div>  
                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">DrivingLicence</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.drivingLicence}" id="id" required name="patientId"
                                type="text" disabled>
                        </div>
                    </div>  
                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Bike</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" style="color: #000000;" value="${patient.bike}" id="id" required name="patientId"
                                type="text" disabled>
                        </div>
                    </div>
                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Other</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <textarea style="color: #000000;" id="id" required name="patientId"
                                type="text" disabled>${patient.other}</textarea>
                        </div>
                    </div>     
                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Offered</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input style="color: #000000;" value="${patient.offered}" id="id" required name="patientId"
                                type="text" disabled>
                        </div>
                    </div>                      
            <%
					}
%>
        </div>

    </div>

    </div>
<%
	//out.print(request.getAttribute("DeletePatientError"));
	if(request.getAttribute("SearchPatientError")==null){}
	else if(request.getAttribute("SearchPatientError").equals(true)){
%>
	<script>
		alert("Incorrect Name");
	</script>
<%
	}
%>

</body>

</html>