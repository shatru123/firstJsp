<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="Update.jsp">
<%
int i=Integer.parseInt(request.getParameter("uid"));
String desc=request.getParameter("desc");
try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
	PreparedStatement ps=con.prepareStatement("select * from EmpInfo where id=?");
	ps.setInt(1, i);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
%>	
<table>
<tr>
<td>Id</td>
<td><input type="text" name="id" value="<%= rs.getInt(1) %>" readonly="readonly"></td>

</tr>

<tr>
<td>Name</td>
<td><input type="text" name="name" value="<%= rs.getString(2) %>"></td>
</tr>

<tr>
<td>Password</td>
<td><input type="text" name="pas" value="<%= rs.getString(3) %>"></td>
</tr>

<tr>
<td>Email</td>
<td><input type="text" name="emai" value="<%= rs.getString(4) %>"></td>
</tr>

<tr>
<td>Dob</td>
<td><input type="date" name="date" value="<%= rs.getString(7) %>"></td>

</tr>

<tr>
<td>designation</td>
<td><input type="text" name="desc" value="<%= rs.getString(8) %>"></td>

</tr>

<td><input type="submit" value="Update"></td>

</tr>



</table>
<%
	}
	}catch(Exception e)
{
System.out.print(e);	
}

%>
</form>
</body>
</html>