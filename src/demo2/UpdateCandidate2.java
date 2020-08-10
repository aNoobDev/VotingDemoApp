package demo2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HackersVoting
 */
@WebServlet("/update4")
public class UpdateCandidate2 extends HttpServlet {
	
    public UpdateCandidate2() {
        super();
        
    }
      

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
			
			String name=request.getParameter("uid");
			//System.out.println(name);
			String url="jdbc:mysql://localhost:3306/hackers?useSSL=false&serverTimezone=UTC";
			String user="root";
			String pass="root";
			Connection con=null;
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection(url,user,pass);
				Statement statement3=con.createStatement();
				ResultSet rs1=statement3.executeQuery("SELECT * FROM hackerr_detail where id="+name);
				
				if(rs1.next())
				{
					request.getSession().setAttribute("id5", name);
					response.sendRedirect("edit3.jsp");
				}
				else
				{
					request.getSession().setAttribute("msg6", "Wrong Details");
					response.sendRedirect("Voting.jsp");
				}
				
				
			 }
			 catch(Exception e)
			 {
				e.printStackTrace();
			 }
			
			
		
	}

	
}
