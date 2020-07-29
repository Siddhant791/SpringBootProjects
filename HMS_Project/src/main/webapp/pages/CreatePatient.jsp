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

    <link rel="stylesheet" href="../new css/login.css">


</head>

<body class="blue">

    <div class="container-fluid ">
    	<%@ include file="nav2.jsp" %>
    </div>

        <div class="row d-flex justify-content-center">
            <div class="col-xs-8 col-sm-8 col-md-6 col-lg-6  align-middle ">
                <div class="row">
                    <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                        <h3 style="font-weight: bold;">
                            Patient Registration
                        </h3>
                    </div>
                </div>
               <form action="/send_createPatient" method="get">
                    <div class="form ">

                        <div class="row">

                            <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                <h5 style="font-weight: bold;">Patient SSN ID *</h6>
                            </div>
                            <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <input id="patientSsnId" required name="patientSsnId" type="number">

                            </div>

                        </div>
                        <br>
                        <div class="row">

                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                <h5 style="font-weight: bold;">Patient Name *</h5>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <input id="name" name="name" pattern="[A-Za-z]+" required type="text">

                            </div>

                        </div>
                        <br>
                        <div class="row">

                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                <h5 style="font-weight: bold;">Patient Age *</h5>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <input id="age" min=0 max=999 name="age" required type="number">

                            </div>

                        </div>
                        <br>
                        <div class="row">

                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                <h5 style="font-weight: bold;">Date of Admission *</h5>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <input required id="dob" name="dob" type="date">

                            </div>

                        </div>
                        <br>
                        <div class="row">

                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right ">
                                <h5 style="font-weight: bold;">Type of Bed *</h5>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <select required id="typeOfBed" name="typeOfBed" class="browser-default custom-select"
                                    style="width: 50%;">
                                    <option value="General">General</option>
                                    <option value="Semi">Semi</option>
                                    <option value="Single">Single</option>
                                </select>

                            </div>

                        </div>
                        <br>
                        <div class="row">

                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                <h5 style="font-weight: bold;">Address *</h5>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <textarea id="address" name="address" required pattern="[a-zA-Z0-9\s]+" id="address" style="resize: none;"
                                    rows="2"></textarea>

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
                                    <option value="Delhi">Delhi</option>
                                    <option value="U.P.">U.P.</option>
                                    <option value="keral">keral</option>
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
                                    <option value="New Delhi">New Delhi</option>
                                    <option value="Ghaziabad">Ghaziabad</option>
                                    <option value="Lucknow">Lucknow</option>
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

                        <div class=" col-xs-4 col-sm-4 col-md-3 col-lg-3 text-left">
                            <button style="border-radius: 20px" type="submit"
                                class="btn btn-dark btn-rounded" onclick="alert('Created successfully')">submit</button>
                        </div>
                        <div class=" col-xs-3 col-sm-3 col-md-3 col-lg-3 text-right">
                            <button style="border-radius: 20px  " type="reset"
                                class="btn btn-dark btn-rounded">reset</button>
                        </div>

                    </div>
                </form>


            </div>

        </div>



    </div>


</body>

</html>