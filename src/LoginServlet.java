

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String n= request.getParameter("name");
		String p=request.getParameter("pass");
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "");
			PreparedStatement ps=con.prepareStatement("select * from EmpInfo where name=? and password=?");
			ps.setString(1, n);
			ps.setString(2, p);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				HttpSession session=request.getSession();
				session.setAttribute("UserName",n);
				RequestDispatcher rd=request.getRequestDispatcher("Welcome.jsp");
				rd.forward(request,response);
				
			}
			else
			{
				out.println("invalid login detAILS");
				RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
				rd.include(request,response);

				
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
