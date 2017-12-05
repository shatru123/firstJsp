<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int i=Integer.parseInt(request.getParameter("uid"));
String d=request.getParameter("desc");
try
 {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
	PreparedStatement ps=con.prepareStatement("delete from EmpInfo where id=?");
	ps.setInt(1, i);
	int res=ps.executeUpdate();
	if(res>0)
	{
		out.println("record deleted!!!");
%>
<jsp:include page="EmpSearch.jsp">
<jsp:param value="<%= d %>" name="desc"/>
</jsp:include>
<%
	}
	else{
		out.println("try again!!!");
		%>
		<jsp:include page="EmpSearch.jsp">
		<jsp:param value="<%=d %>" name="desc"/>
		</jsp:include>
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