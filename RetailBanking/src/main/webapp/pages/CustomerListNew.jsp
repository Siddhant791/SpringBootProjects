<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="nav.jsp" %>
<link href="../css/loginstyle.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

	<h2>Customer List</h2>
	
	<%-- Welcome ${mylist[0].customerSSN} , ${mylist[0].name} --%> 
	<%-- <c:forEach  var="emp" items= "${mylist}">
		<li>${emp}</li> --%>
	
	
	
	
	<table style="margin-top:0px; margin-left:100px; ">
	<tr>
		<th>Customer SSN ID</th>
		<th>Customer Name</th>
		<th>Age</th>
		<th>Address</th>
		<th>State</th>
		<th>City</th>
	</tr>
		
	<c:forEach items="${mylist}" var="customers">
	<tr>
		<td>${customers.customerSSN}</td>
		<td>${customers.name}</td>
		<td>${customers.age}</td>
		<td>${customers.address}</td>
		<td>${customers.state}</td>
		<td>${customers.city}</td>
		<td>
			<a href="/UpdateCustomerScreen?id=${customers.customerSSN}">UPDATE</a>
		</td>
		<td>
			<a href="/DeleteCustomerScreen?id=${customers.customerSSN}">DELETE</a>
		</td>
		</tr>
	</c:forEach>
	
	
	
	</table>
	



</body>
</html>