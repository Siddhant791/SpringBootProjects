
<!DOCTYPE html>
<html>
<head>
<link href="../css/loginstyle.css" rel="stylesheet" type="text/css">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body bgcolor="F5F5F5">

		<%@ include file="nav2.jsp" %>
	
	<center><h1 style="font-size:40px">WithDraw Amount</h1></center>
	<form action="/user/sendData_WithDrawAmount" method="get">
	<table  style="margin-top:-5em" align="center"  width="480" height="400" >
		<tr><td height="32"><b>Customer ID</b></td>
		<td ><input type="text" id="customerId" name="customerId" value="${withDrawMoneyAccountDetail.customerId}" max="20" size="33" height="32"></td><br>
		<tr><td height="32"><b>Account Id</b></td>
		<td><input type="text" id="accountId" name="accountId" value="${withDrawMoneyAccountDetail.accountId}"  max="20" size="33" height="32"></td><br> 
		<tr><td height="32"><b>Account Type</b></td>
		<td><input type="text" id="accountType" name="accountType" value="${withDrawMoneyAccountDetail.accountType}" max="20" size="33" height="32"></td><br>
		<tr><td height="32"><b>Balance</b></td>
		<td><input type="text" id="balance" name="balance" value="${withDrawMoneyAccountDetail.balance}" max="20" size="33" height="32"></td><br>
		<tr><td height="32"><b>WithDraw Amount</b></td>
		<td><input type="text" id="withDrawAmount" name="withDrawAmount" required="required" max="20" size="33" height="32"></td><br>
				
		<tr><td height="50" align="center"><b><input type="submit" value="Submit" style="width:120px; height:30px; color:#FFFFFF; font-weight:bold; background-color:#FF0000;"></b></td>
		<td height="50"><b><input type="reset" value="Reset" style="width:120px; color:#FFFFFF; height:30px; font-weight:bold; background-color:#FF0000;"></b></td>
		</tr>
	</table>
	</form>
	<!--<img src="https://cdn.zeebiz.com/sites/default/files/styles/zeebiz_850x478/public/2020/05/07/118298-screenshot-2020-05-07-at-102551.png?itok=cX0pCSOv" style="width:1500px; height:200px;">  -->

</body>
</html>