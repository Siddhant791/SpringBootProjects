<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="nav.jsp" %>
	<link href="../css/loginstyle.css" rel="stylesheet" type="text/css">
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
</head>
<body>

	<center><h2>Update Customer</h2></center>
	<form action="/sendData_UpdateCustomer" method="get">
		<label for="customerSSN">Customer SSN ID</label>
		<input type="number" id="customerSSN" name="customerSSN" value="${customers.customerSSN}"><br>
		
		<label for="name">Old Customer Name</label>
		<input type="text" value="${customers.name}"><br> 
		
		<label for="name">New Customer Name</label>
		<input type="text" id="name" name="name" required="required"><br> 
		
		<label for="age">Old Age</label>
		<input type="text" value="${customers.age}"><br>
		
		<label for="age">New Age</label>
		<input type="text" id="age" name="age" required="required"><br>
		
		<label for="address">Old Address</label>
		<input type="text"  value="${customers.address}"><br>
		
		<label for="address">New Address</label>
		<input type="text" id="address" name="address" required="required"><br>
		<input type="hidden" id="state" name="state" value="${customers.state}"><br>
		<input type="hidden" id="city"  name="city" value="${customers.city}"><br>
		
		<input type="submit" value="Save">
		
	</form>

</body>
</html>