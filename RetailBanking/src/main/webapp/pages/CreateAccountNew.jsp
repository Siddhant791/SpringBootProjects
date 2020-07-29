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

    <br>
    
	<center><h1 style="font-size:40px">Create Account</h1></center>
	<form action="/sendData_CreateAccount" method="get">
	<table  style="margin-top:-2em" align="center"  width="480" height="400" >
		<tr><td height="32"><b>Customer ID:</b></td>
		<td ><input type="text" id="customerId" name="customerId" required="required" max="20" size="33" height="32"></td><br>
		<tr><td height="32"><b>Account Type:</b></td>
		<td ><select name="accountType" id="accountType" style="width:221px" height="32">
			<option value="Select">Select</option>
			<option value="Current">Current</option>
			<option value="Savings">Savings</option>
		</select></td><br>
		<tr><td height="32"><b>Deposit Amount</b></td>
		<td><input type="text" id="balance" name="balance" required="required" max="20" size="33" height="32"></td><br>
		<tr><td></td>
		<td height="50" ><b><input type="submit" value="Submit" style="width:120px; height:30px; color:#000000; font-weight:bold; background-color:#D3D3D3;"></b></td>
		
		</tr>
	</table>
	<%
		if(request.getSession().getAttribute("accountCreateFlag")==null && request.getSession().getAttribute("accountCreateFlag1")==null && request.getSession().getAttribute("accountCreateFlag2")==null){
			out.print("Yo");
		}if(request.getSession().getAttribute("accountCreateFlag1").equals(true)){
			request.getSession().setAttribute("accountCreateFlag1", false);
			out.print("<h1>Account Exists<h1>");
		}if(request.getSession().getAttribute("accountCreateFlag").equals(true)){
			out.print("<h1>Account Created Successfully<h1>");
			request.getSession().setAttribute("accountCreateFlag", false);
		}if(request.getSession().getAttribute("accountCreateFlag2").equals(true)){
			out.print("<h1>Invalid Customer Id<h1>");
			request.getSession().setAttribute("accountCreateFlag2", false);
		}
	%>
	</form>
	<!--<img src="https://cdn.zeebiz.com/sites/default/files/styles/zeebiz_850x478/public/2020/05/07/118298-screenshot-2020-05-07-at-102551.png?itok=cX0pCSOv" style="width:1500px; height:200px;">  -->
	
	



</body>
</html>