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
    

    
    	
    
    
    <script>
        $(document).ready(function () {
            $('#issue_medicines_button').on('click', function (event) {
                $('#issue_medicines_div').delay(20).fadeIn();
            });
        }); 
    </script>
    

</head>

<body class="blue">

    <div class="container-fluid ">

	<%@ include file="nav2.jsp" %>
			
        <div class="row d-flex justify-content-center">




            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8  align-middle ">
                <div class="row">
                    <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                        <h3 style="font-weight: bold;">
                            Pharmacy
                        </h3>
                    </div>
                </div>

                <div class="row ">

                    <table class="table white table-sm table-bordered text-center">
                        <thead class="black white-text ">
                            <tr>
                                <th scope="col">Patient Id</th>
                                <th scope="col">Name</th>
                                <th scope="col">Age</th>
                                <th scope="col">Address</th>
                                <th scope="col">DOJ</th>
                                <th scope="col">Type of Room</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">
                                    <form action="/issueMedicinesPatientId" method="get">
                                        <input class="" type="text" id="patientId" name="patientId" required="required">
                                        <button type="submit"><i class="fa fa-search icon"></i></button>
                                    </form>

                                </th>
                                <td>${patientDetails.name}</td>
                                <td>${patientDetails.age}</td>
                                <td>${patientDetails.address}</td>
                                <td>6-9-7895</td>
                                <td>${patientDetails.typeOfBed}</td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <br>

                <div class="row">
                    <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                        <h3 style="font-weight: bold;">
                            Medicines Issued
                        </h3>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">


                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 text-center">
                        <table class="table white table-sm table-bordered text-center">
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
                            
                            
                                <%-- <tr>
                                    <th scope="row">${medicineDetails.medicineName}</th>
                                    <td>${medicineDetails.quantityAvailable}</td>
                                    <td>${medicineDetails.rate}</td>
                                    <td>${medicineDetails.amount}</td>
                                </tr> --%>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="row d-flex justify-content-center">

                    <div class=" col-xs-4 col-sm-4 col-md-3 col-lg-3 text-center">
                        <button <% 
                        		if(request.getAttribute("flag3")==null){
                        
                        %>id="issue_medicines_button"<%} %> style="border-radius: 10px;"
                            class="btn btn-dark btn-rounded">Issue
                            Medicines</button>
                    </div>


                </div>
                <br>
                <div id="issue_medicines_div" <%
                    	if(request.getAttribute("flag")==null){
  							out.print("in null block");
                    	%>
                    	style=display:none;
                    <% 
                    	}
                	%>
                >
                    <div class="row   d-flex justify-content-center">
                        
                            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 text-center">
                                
                                <table class="table white table-sm table-bordered text-center">
                                    <thead class="black white-text ">
                                        <tr>
                                            <th scope="col">Enter Medicine &Quantity</th>
                                            <th scope="col">Medicine Name</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Rate</th>
                                            <th scope="col">Amount</th>
                                            <th scope="col">Update</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">
                                            <form action="/issueMedicinesPage_GetMedicineDetails" method="get">
                                   
                                   				<label for="e">NAme</label>
                                                <input name="medicineIssued" class="" id="e" type="text" required="required">
                                                
                                   				<label for="ef">Quantity</label>
                                                <input name="quantityIssued" class="" id="ef" type="number" required="required">
                                                <!-- <input name="quantityIssued" class="input-field" type="text"> -->
                                                
                                                <button id="issue_medicine_search_button"  type="submit" onclick="foo()"><i class="fa fa-search icon"></i></button>
 
                                               </form>   
                                            	</th>
                                          	<td><input name="medicineIssued" value="${medicines.medicineName}" disabled></td>
                                            <td><input name="quantityIssued" value="${quant}" disabled></td>
                                            <td><input name="rate"  value="${medicines.rate}" disabled></td>
                                            <td><input name="amount" value="${amount}" disabled></td>


                                            <td><a href="http://localhost:8887/issueMedicinesPage_UpadteNewMedicines?medicineIssued=${medicines.medicineName}&quantityIssued=${quant}&rate=${medicines.rate}&amount=${amount}">
                                            <%
                                            	if(request.getAttribute("flag5")==null){
                                            %>
                                            <%}else if(request.getAttribute("flag5").equals(true)){%><button>Submit</button><%} %></a></td>

                                              
                                            <%-- <form action="/issueMedicinesPage_UpadteNewMedicines" method="get">
                                            <td><label name="medicineIssued" value="${medicines.medicineName}"></label></td>
                                            <td><input name="quantityIssued" value="${quant}"  max="${medicines.quantityAvailable}" required="required" readonly="readonly"></td>
                                            <td><input name="rate" class="input" value="${medicines.rate}" required="required" readonly="readonly"></td>
                                            <td><input name="amount" class="input" value="${amount}" required="required" readonly="readonly"></td>
                                            <td><input  type="submit"></td>
                                            <td><input name="a" id="myA" value="${maxQuant}"></td>
                                              </form> --%>
                                            <!-- </th> -->
                                           
                                        </tr>
                                    </tbody>
                                </table>
                            </div>


                            <div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center align-self-center">
                                <input type="submit" style=" border-radius: 10px;" 
                                    class="align-middle btn btn-dark btn-rounded">UPDATE</button>
                            </div>



                    </div>
                </div>

            </div>

        </div>


    </div>
<%
	if(request.getAttribute("issueMedicineQuantityError")==null){
		
	}else if(request.getAttribute("issueMedicineQuantityError").equals(true)){
%>    
<script>
	alert("Quantity available in stock is "+${maxQuant}+".");
</script>    
<%
	}
%>

<%
	if(request.getAttribute("issueMedicineInvalidNameError")==null){
		
	}else if(request.getAttribute("issueMedicineInvalidNameError").equals(true)){
%>    
<script>
	alert("Invalid Name entered");
</script>    
<%
	}
%>

</body>

</html>