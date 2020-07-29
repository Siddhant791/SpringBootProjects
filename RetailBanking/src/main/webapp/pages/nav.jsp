<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<nav>
	<div class="nav">
	<ul>
	<li><a href ="Home">Home</a></li>
	<li><a href ="#">CustomerManagement</a>
	<ul>
		<li><a href ="/CreateCustomerScreen">CreateCustomer</a></li>
		<li><a href ="/UpdateDeleteCustomerScreen">Update/Delete Customer</a></li>
	
	</ul>
	</li>	
	<li><a href ="#">AccountManagement</a>
	<ul>
		<li><a href ="/CreateAccountScreen">CreateAccount</a></li>
		<li><a href ="/Error">DeleteAccount</a></li>
	
	</ul>
	</li>	
	
	
	<li><a href ="#">StatusDetails</a></li>
	<li><a href ="#">AccountOperations</a>
	<ul>
		<li><a href ="/Error">CustomerSearch</a></li>
		<li><a href ="/AccountSearch">AccountSearch</a></li>

	</ul>
	</li>	
	<li><a href ="logout">Logout</a></li>
	</ul> 
	</div>
</nav>
</body>
</html>