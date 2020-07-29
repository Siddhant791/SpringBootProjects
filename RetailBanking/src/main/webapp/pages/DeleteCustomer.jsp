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

	
	<form action="/sendData_DeleteCustomer" method="get">
		<label for="customerSSN">Customer SSN ID</label>
		<input type="number" id="customerSSN" name="customerSSN" value="${customers.customerSSN}"><br>
		
		<label for="name">Customer ID</label>
		<input type="text" value="${customers.customerId}"><br> 
		
		<label for="name"> Customer Name</label>
		<input type="text" value="${customers.name}"><br> 
		
		<label for="age">Age</label>
		<input type="text" value="${customers.age}"><br>
		
		<label for="address">Address</label>
		<input type="text"  value="${customers.address}"><br>
		
		<a href="/sendData_DeleteCustomer?id=${customers.customerSSN}">DELETE</a>
		<a href="http://localhost:8080/">Cancel</a>
	</form>
	
	
	
	

</body>
</html>