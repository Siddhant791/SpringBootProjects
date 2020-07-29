<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0;
	background:;
}

.nav {
	width: 100%;
	background: red;
	height: 80px;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
	position: absolute;
}

ul li {
	float: left;
	margin-top: 20px;
}

ul li a {
	width: 200px;
	color: white;
	display: block;
	text-decoration: none;
	font-size: 20px;
	text-align: center;
	padding: 10px;
	border-radius: 10px;
	font-family: serif;
	font-weight: bold;
}

a:hover {
	background: #669900;
}

ul li ul {
	background: #000033;
}

ul li ul li {
	float: none;
}

ul li ul {
	display: none;
}

ul li:hover ul {
	display: block;
}
</style>
<body>
		<%
		int i=1;
		if(session.getAttribute("uname")==null)
		{
			response.sendRedirect("login");
		}
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<nav>
		<div class="nav">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">CustomerManagement</a>
					<ul>
						<li><a href="#">CreateCustomer</a></li>
						<li><a href="#">UpdateCustomer</a></li>
						<li><a href="#">DeleteCustomer</a></li>

					</ul></li>
				<li><a href="#">AccountManagement</a>
					<ul>
						<li><a href="#">CreateAccount</a></li>
						<li><a href="#">DeleteAccount</a></li>

					</ul></li>


				<li><a href="#">StatusDetails</a></li>
				<li><a href="#">AccountOperations</a>
					<ul>
						<li><a href="#">CustomerSearch</a></li>
						<li><a href="#">AccountSearch</a></li>
						<li><a href="#">DepositMoney</a></li>
						<li><a href="#">WithdrawMoney</a></li>
						<li><a href="#">TransferFunds</a></li>
						<li><a href="#">ViewStatements</a>
					</ul></li>
				<li><a href="logout">Logout</a></li>
			</ul>
		</div>
	</nav>
	<!------------------Navigation Bar ends here, Must be included in every page------------>





	<form action="sendData" method="post">
		<label for="aid">ID:</label><br> <input type="number" id="aid"
			name="aid"><br> <label for="name">NAME:</label><br>
		<input type="text" id="name" name="name"><br> <label
			for="marks">MARKS:</label><br> <input type="text" id="marks"
			name="marks"><br>
		<br> <input type="submit" value="Submit">
	</form>



</body>
</html>