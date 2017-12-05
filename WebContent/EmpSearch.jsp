<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.*" session ="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%-- <body>
<body>
<%
String n=(String)session.getAttribute("UserName");
%>
<h3><b><%= "Welcome\t"+n %></b></h3>
<form action ="EmpSearch.jsp">
Designation <select name="desc">
<%
try 
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
	PreparedStatement ps=con.prepareStatement("select * from Descgnigation");
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
%>
<option><%=rs.getString(1) %>
</option>
<%
		
	}
	
}
catch(Exception e)
{
	System.out.println(e);	
}
%>			
</select>		
<input type="submit" value="search"	>
<br>
</form>	
<%
if(request.getParameter("desc")!=null)
{
	String d=request.getParameter("desc");
	out.println("hi");
%>
<table border="6">
<tr>
<td>Name</td><td>Email</td><td>Address</td><td>DateOfBirth</td>

</tr>	
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
		PreparedStatement ps=con.prepareStatement("select * from EmpInfo where Descgination=?");
		ps.setString(1, d);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
	%>	
	<tr>
	<td><%=rs.getString(2)%></td>
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
}

%>	
</table> --%>

<%
String n=(String)session.getAttribute("UserName");
%>
<h3><b><%= "Welcome\t"+n %></b></h3>
<form action ="EmpSearch.jsp">
Designation <select name="desc">
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
PreparedStatement ps1=con1.prepareStatement("select * from Descgnigation");

ResultSet rs1=ps1.executeQuery();
while(rs1.next())
{
%>
			<option><%= rs1.getString(1) %></option>
		
<%
}
%>
</select><br>
<input type="submit" value="search"	>
<br>
</form>	
<%
if(request.getParameter("desc")!=null)
{
	String d=request.getParameter("desc");
	out.println("hi");
%>
<table border="6">
<tr>
<td>Name</td><td>Email</td><td>Address</td><td>DateOfBirth</td>

</tr>	
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
		PreparedStatement ps=con.prepareStatement("select * from EmpInfo where Descgination=?");
		ps.setString(1, d);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
	%>	
	<tr>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(7)%></td>
	<td><a href="Edit.jsp?uid=<%= rs.getInt(1) %>& desc=<%=rs.getString(8) %>">Edit</a></td>
	<td><a href="Delete.jsp?uid=<%= rs.getInt(1) %>& desc=<%=rs.getString(8) %>">Delete</a></td>
	</tr>
<%	
			}
			
		}
	catch(Exception e)
		{
		 System.out.print(e);	
		}
	}

%>	
</table>

</body>
</html>