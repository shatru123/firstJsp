<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="RegisterServlet" method="get">
<h1>Welcome to Registration in Servlet Application</h1>
<table>
<tr>
<td>Name</td>
<td><input type="text" name="n"></td>
</tr>
<tr> 
<td>Password</td>
<td><input type="password" name="p"></td>
</tr>

<tr> 
<td>Email</td>
<td><input type="text" name="em"></td>
</tr>

<tr> 
<td>Address</td>
<td><textarea rows="5" cols="25" name="ad"></textarea></td>
</tr>

<tr> 
<td>Gender</td>
<td><input type="radio" name="g" value="Male">Male<br>
<input type="radio" name="g" value="Female"> Female<br> </td>
</tr>

<tr> 
<td>DOB</td>
<td><input type="date" name="dob"></td>
</tr>

<tr> 
<td>Designation</td>
<td><select name="desc">
<option>Select</option>
<option>Developer</option>
<option>Tester</option>
<option>DBA</option></select>
</td>
</tr>

<tr>
<td>Resume</td>
<td><input type="file" name="cv"></td>
</tr>
<tr>
<td><input type="submit" value="Register"></td>
<td><a href="Login.html"></a></td>
<td><input type="reset" value="Cancel"></td>

</tr>

</table>
</form>
</body>
</html>