<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->

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



        <div class="top-bar blue lighten-3" style="border: 1px solid black;">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h1 class="h1 text-center">
                        ABC Hospital Management System
                        </h>
                </div>
            </div>
            <div class="row ">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ">
                    <div class="patient-dropdown" style="display: inline;">
                        <!--Trigger-->
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Patient</button>

                        <!--Menu-->
                        <div class="dropdown-menu dropdown-primary">
                            <a class="dropdown-item" href="#">Create Patient</a>
                            <a class="dropdown-item" href="#">Update Patient</a>
                            <a class="dropdown-item" href="#">Delete Patient</a>
                            <a class="dropdown-item" href="#">View All Patients</a>
                            <a class="dropdown-item" href="#">Search For a Patient</a>

                        </div>
                    </div>
                    <div class="pharmacy-dropdown" style="display: inline;">
                        <!--Trigger-->
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pharmacy</button>

                        <!--Menu-->
                        <div class="dropdown-menu dropdown-primary">
                            <a class="dropdown-item" href="#">Issue Medicines</a>
                            <a class="dropdown-item" href="#">Add Diagnostics</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                    <div class="diagnostics-dropdown" style="display: inline;">
                        <!--Trigger-->
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Diagnostics</button>

                        <!--Menu-->
                        <div class="dropdown-menu dropdown-primary">
                            <a class="dropdown-item" href="#">Final Billing</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>

                </div>
            </div>
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
                <div class="form ">

                    <div class="row">

                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Patient SSN ID *</h6  >
                        </div>
                        <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input id="id" type="text">

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Patient Name *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input id="name" type="text">

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Patient Age *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input id="age" type="text">

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Date of Admission *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input id="admission_date" type="text">

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right ">
                            <h5 style="font-weight: bold;">Type of Bed *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <!--Dropdown primary-->
                            <div class="dropdown">

                                <!--Trigger-->
                                <button class="btn white dropdown-toggle" type="button" id="dropdownMenu1"
                                    style="padding: 2%; width:40%" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">Select</button>

                                <!--Menu-->
                                <div class="dropdown-menu dropdown-primary">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                            <!--/Dropdown primary-->

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">Address *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <input type="text">

                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">State *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <!--Dropdown primary-->
                            <div class="dropdown">

                                <!--Trigger-->
                                <button class="btn white dropdown-toggle" type="button" id="dropdownMenu1"
                                    style="padding: 2%;width:40%" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">Select</button>

                                <!--Menu-->
                                <div class="dropdown-menu dropdown-primary">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                            <!--/Dropdown primary-->
                        </div>

                    </div>
                    <br>
                    <div class="row">

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                            <h5 style="font-weight: bold;">City *</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <!--Dropdown primary-->
                            <div class="dropdown">

                                <!--Trigger-->
                                <button class="btn white dropdown-toggle" type="button" id="dropdownMenu1"
                                    style="padding: 2%;width:40%" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">Select</button>

                                <!--Menu-->
                                <div class="dropdown-menu dropdown-primary">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                            <!--/Dropdown primary-->
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
                        <button style="border-radius: 20px" type="button" class="btn btn-dark btn-rounded">Submit</button>
                    </div>
                    <div class=" col-xs-3 col-sm-3 col-md-3 col-lg-3 text-right">
                        <button style="border-radius: 20px  " type="button" class="btn btn-dark btn-rounded">Reset</button>
                    </div>
                    
                </div>
                

            </div>

        </div>



    </div>


</body>

</html>