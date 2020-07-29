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
    
<script>
function foo()
{
	var x = ${maxQuant};
	//var jsonBom = $('#myA').val();
	//var x=document.getElementById("myA").value;
	alert("Please enter he requried quantity less than or equal to " + x + ".")
}

</script> 
    
    	
    
    
    <script>
        $(document).ready(function () {
            $('#issue_medicines_button').on('click', function (event) {
                $('#issue_medicines_div').delay(20).fadeIn();
            });
        }); 
    </script>
    
    <!-- <script >
		$(document).ready(function(){
			$('#issue_medicine_search_button').on('click', function (event) {
                $('#issue_medicines_div').delay(20);
            });
		


			});

    </script> -->
    
    <!--<script>
		$(document).ready(go(1));
		</script>
		 {	
			var x=1;
			if(x)
				{			
					$('#issue_medicines_button').on('click', function (event) {
		    			$('#issue_medicines_div').delay(20).fadeIn();
		            	});
	            	x=0
				}

			else
				{
					$('#issue_medicine_search_button').on('click', function (event) {
	    				$('#issue_medicines_div').delay(20).fadeIn();
	            		});
					
				}
		});
			
    </script> -->
    	
    
    <!-- <script>
    function go(+ x +)
	{
		return function()
		{
			if(x)
				{
				$('#issue_medicines_button').on('click', function (event) {
	    			$('#issue_medicines_div').delay(20).fadeIn();
	            	});
            	x=0
					
				}

			else 
				{
				$('#issue_medicine_search_button').on('click', function (event) {
    				$('#issue_medicines_div').delay(20).fadeIn();
            		});
					
				}
		}
	}

    
    </script>
 -->

</head>

<body class="blue">

    <div class="container-fluid ">

	<%@ include file="nav2.jsp" %>
			
        <div class="row d-flex justify-content-center">




            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8  align-middle ">
                <div class="row">
                    <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                        <h3 style="font-weight: bold;">
                            Diagnostics
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
                                    <form action="/diagnosticsPatientId" method="get">
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
                            Diagnostics Conducted
                        </h3>
                    </div>
                </div>

                <div class="row d-flex justify-content-center">


                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 text-center">
                        <table class="table white table-sm table-bordered text-center">
                            <thead class="black white-text ">
                                <tr>
                                    <th scope="col">Name of the test</th>
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
                        		if(request.getAttribute("flag2")==null){
                        			
                        		%>
                        
                        id="issue_medicines_button"<%} %> style="border-radius: 10px;"
                            class="btn btn-dark btn-rounded">Add
                            Diagnostics</button>
                    </div>


                </div>
                <br>
                <div id="issue_medicines_div" <%
                    	if(request.getAttribute("flag1")==null){
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
                                            <th scope="col">Name of the test</th>
                                            <th scope="col">Amount</th>
                                            <th scope="col">Update</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	
                                        <tr>
                                        	<th scope="row">   
                                            <form action="/diagnosticPage_GetDiagnosticName" method="get">
                                            	<select name="nameOfTest">
                                            		<!-- <option value="" disabled selected>Select</option> -->
                                   					<c:forEach items="${diagnosticMasterDetails}" var="diagnosticMasterDetails" varStatus="status">
														<option value="${diagnosticMasterDetails.testName}">${diagnosticMasterDetails.testName}</option>
												
													
												</c:forEach>
												</select>
												
												
											<button id="issue_medicine_search_button"  type="submit" onclick="foo()"><i class="fa fa-search icon"></i></button>
											
										
                                   				
                                                
                                                
                                               </form>   
                                                	
                                          <td><input name="amount"  value="${amount}" readonly="readonly"></td>
                                           <td><a href="http://localhost:8887/diagnosticsPage_UpdateNewDiagnostic?name=${nameOfTest}&amount=${amount}">
                                            <%
                                            	if(request.getAttribute("flag6")==null){
                                            		
                                            %>
                                            <%}else if(request.getAttribute("flag6").equals(true)){%><button>Submit</button><%} %></a></td>
<%--                                             <form action="/diagnosticsPage_UpdateNewDiagnostic" method="get">
                                            
                                  			<input type="hidden" name="name" value="${nameOfTest}">
                                            <td><input name="amount" class="input" value="${amount}" readonly="readonly"></td>
                                            
                                           
                                            <td><input  type="submit"></td>
                                            
                                              </form>  --%>
                                          </th>
                                           
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


</body>

</html>