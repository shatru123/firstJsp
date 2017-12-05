<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.*" session ="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String n=(String)session.getAttribute("UserName");
%>
<h3><b><%= "Welcome\t" +n %></b></h3>
<table border="6">
<tr>
<td>Name</td><td>Email</td><td>PassWord</td><td>Address</td><td>DoB</td>

</tr>	
<%

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test", "root","");
	PreparedStatement ps=con.prepareStatement("select * from EmpInfo where name=?");
	ps.setString(1, n);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
%>	

<tr>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(7)%></td>
</tr>

<%		
	}
	
}
catch(Exception e)
{
 System.out.print(e);	
}

%>
</body>
</html>