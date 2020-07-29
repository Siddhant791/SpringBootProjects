
<!DOCTYPE html>
<html>
<head>
<link href="../css/loginstyle.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body bgcolor="F5F5F5">

		<%@ include file="nav.jsp" %>
	
	<center><h1 style="font-size:40px">Account Search</h1></center>
	<form action="/sendData_AccountSearch" method="get">
	<table  style="margin-top:-2em" align="center"  width="480" height="200" >
		<tr><td height="32"><b>Account ID:</b></td>
		<td ><input type="text" id="accountId" name="accountId" required="required" max="20" size="33" height="32"></td><br>
		<tr>
		<td height="10" ><b><input type="submit" value="View" style="width:120px; height:30px; color:#000000; font-weight:bold; background-color:#D3D3D3;"></b></td>		
		</tr>
	</table>
	</form>
	<%-- <center><h2 style="font-size:20px" "color:blue">${accountDetail}</h2></center> --%>
	<tr>
		<td>${accountDetail}</td>


	
	<!--<img src="https://cdn.zeebiz.com/sites/default/files/styles/zeebiz_850x478/public/2020/05/07/118298-screenshot-2020-05-07-at-102551.png?itok=cX0pCSOv" style="width:1500px; height:200px;">  -->
	
	



</body>
</html>