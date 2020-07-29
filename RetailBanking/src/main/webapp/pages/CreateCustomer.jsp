<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="nav.jsp" %>
<link href="../css/loginstyle.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>

<body>
	
<!------------------Navigation Bar ends here, Must be included in every page------------>



	<br>
    <pre>
    </pre>
	<center><h1 style="font-size:40px">Create Customer Screen</h1></center>
	
	<form action="/sendData_CreateCustomer" method="get">
	<table  style="margin-top:-5em" align="center"  width="480" height="400" >
		<tr><td height="32"><b>Customer SSN ID</b></td>
		<td ><input type="number" id="customerSSN" name="customerSSN" required="required" max="100" size="33" height="32"></td><br>
		<tr><td height="32"><b>Customer Name</b></td>
		<td><input type="text" id="name" name="name" required="required"  max="30" size="33" height="32"></td><br> 
		<tr><td height="32"><b>Age</b></td>
		<td><input type="number" id="age" name="age" required="required" max="100" size="33" height="32"></td><br>
		<tr><td height="32"><b>Address</b></td>
		<td><input type="text" id="address" name="address" required="required" max="50" size="33" height="32"></td><br>
		<tr><td height="32"><b>State</b></td>
		<td ><select name="state" id="state" style="width:221px" height="32">
			<option value="Select">Select</option>
			<option value="Uttar Pradesh">Uttar Pradesh</option>
			<option value="Maharashtra">Maharashtra</option>
			<option value="Rajasthan">Rajasthan</option>
			<option value="Himachal Pradesh">Himachal Pradesh</option>
		</select></td><br>
		<tr><td height="32"><b>City</b></td>
		<td><select name="city" id="city" style="width:221px" height="32">
			<option value="Select">Select</option>
			<option value="Agra">Agra</option>
			<option value="Mumbai">Mumbai</option>
			<option value="Allahabad">Allahabad</option>
			<option value="Shimla">Shimla</option>
			<option value="Lucknow">Lucknow</option>
		</select></td><br>
		<tr><td height="50" align="center"><b><input type="submit" value="Submit" style="width:120px; height:30px; color:#FFFFFF; font-weight:bold; background-color:#FF0000;"></b></td>
		<td height="50"><b><input type="reset" value="Reset" style="width:120px; color:#FFFFFF; height:30px; font-weight:bold; background-color:#FF0000;"></b></td>
		</tr>
	</table>
	</form>
<%
	if(request.getSession().getAttribute("flag")==null)
	{
		//out.print("flag is null");
	}
	else if(request.getSession().getAttribute("flag").equals(true))
	{
		out.print("<h2>Submitted Successfully<h2>");
		request.getSession().setAttribute("flag", false);
	}
	else{
		//out.print("in else block");
	}
%>
</body>
</html>