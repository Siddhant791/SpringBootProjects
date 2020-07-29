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
                        Delete Patient
                    </h3>
                </div>
            </div>
            <%
					if(request.getSession().getAttribute("DeletePatient")==null){
						
					}else if(request.getSession().getAttribute("DeletePatient").equals(true)){                
                %>
<!--             <div class="row">
                <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 "> -->
                    <form action="/FindPatientByIdToDelete" method="get">
                        <div class="form ">

                            <div class="row">

                                <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                    <h5 style="font-weight: bold;">Patient ID *</h6>
                                </div>
                                <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <input id="id" min=100000000 max=999999999 required name="id" type="number">
                                    <input type="submit" value="GET" style="border-radius: 20px;padding:1% 10% 1% 10% ;"
                                        class="btn-dark btn-rounded">
                                </div>
                            </div>
                        </div>
                    </form>

<!--                 </div>

            </div> -->
            <%
					}else if(request.getSession().getAttribute("DeletePatient").equals(false)){
                 %>
            <form action="/send_DeletePatient" method="get">
                <br>
                <div class="form ">

                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Patient ID *</h6>
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input value="${patient.patientId}" id="id" max=999999999 required name="patientId"
                                type="number">
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Patient Name *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input value="${patient.name}" id="name" name="name" pattern="[A-Za-z]+" required
                                type="text" readonly="readonly">

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Patient Age *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input id="age" value="${patient.age}" min=0 max=999 name="age" required type="number" readonly="readonly">

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Date of Admission *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input value="${patient.dob}" required id="dob" name="dob" type="date" readonly="readonly">

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right ">
                            <h5 style="font-weight: bold;">Type of Bed *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <select required id="bed_type" name="typeOfBed" class="browser-default custom-select"
                                style="width: 50%;">
                                <option selected>${patient.typeOfBed}</option>
                                <option value="General"disabled>General</option>
                                <option value="Semi" disabled>Semi</option>
                                <option value="Single" disabled>Single</option>
                            </select>

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Address *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <textarea id="address" name="address" required readonly="readonly" pattern="[a-zA-Z0-9\s]+" id="address"
                                style="resize: none;" rows="2">${patient.address}</textarea>

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">State *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <select required id="state" name="state" class="browser-default custom-select"
                                style="width: 50%;">
                                <option selected>${patient.state}</option>
                                <option value="Delhi" disabled>Delhi</option>
                                <option value="U.P." disabled>U.P.</option>
                                <option value="KERALA" disabled>kerala</option>
                            </select>
                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">City *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <select required id="city" name="city" class="browser-default custom-select"
                                style="width: 50%;">
                                <option selected>${patient.city}</option>
                                <option value="New Delhi" disabled>New Delhi</option>
                                <option value="Ghaziabad" disabled>Ghaziabad</option>
                                <option value="Lucknow" disabled>Lucknow</option>
                            </select>
                        </div>

                    </div>



                </div>
                <div class="row">

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <p style="font-weight: bold;">* Mandatory</p>
                    </div>

                </div>

                <div class="row d-flex justify-content-center">

                    <div class=" col-xs-4 col-sm-4 col-md-3 col-lg-3 text-center">
                        <button style="border-radius: 20px" type="submit"
                            class="btn btn-dark btn-rounded" onclick="alert('Deleted Successfully')">Delete</button>
                    </div>


                </div>

            </form>
            <%
					}
%>
        </div>

    </div>



    </div>
<%
	//out.print(request.getAttribute("DeletePatientError"));
	if(request.getAttribute("DeletePatientError")==null){}
	else if(request.getAttribute("DeletePatientError").equals(true)){
%>
	<script>
		alert("Incorrect PatientId");
	</script>
<%
	}
%>
<!-- 	<script>
		alert("llo");
	</script>	 -->
</body>

</html>