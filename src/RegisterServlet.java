

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String n=request.getParameter("n");
		String p=request.getParameter("p");
		String e=request.getParameter("em");
		String ad=request.getParameter("ad");
		String g=request.getParameter("g");
		String db=request.getParameter("dob");
		String des=request.getParameter("desc");
		String cv=request.getParameter("cv");
		try
		{	//System.out.print("hiaa");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","");
			PreparedStatement ps=con.prepareStatement("insert into empInfo values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, n);
			ps.setString(3, p);
			ps.setString(4, e);
			ps.setString(5, ad);
			ps.setString(6, g);
			ps.setString(7, db);
			ps.setString(8, des);
			ps.setString(9, cv);
			int r=ps.executeUpdate();
			if(r>=0)
			{
				out.println("Record Inserted!!!");
			}
			else
			{
				out.println("Try Again!!!");
			}
			
		}
		catch(Exception ae)
		{
			System.out.println(ae);
		}
	}


}
