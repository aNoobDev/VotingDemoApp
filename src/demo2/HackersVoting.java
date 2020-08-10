package demo2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class HackersVoting
 */
@WebServlet("/HackersVoting")
public class HackersVoting extends HttpServlet {
	
    public HackersVoting() {
        super();
        
    }
      
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		Cookie[] cookie=null;
		cookie=request.getCookies();
		String userId = null;
		for(Cookie c : cookie)
		{
		    if("25".equals(c.getName()))
		    {
		        userId = c.getValue();
		    }
		}
		
		if(userId!=null)
		{
			request.getSession().setAttribute("msg2", "You have already Voted");
			response.sendRedirect("votingCount.jsp");
		}
		else
		{
			Cookie c=new Cookie("25","aafat");
			response.addCookie(c);
			request.getSession().setAttribute("msg2", "Thank you, Your vote is registered successfully");
			
			String url="jdbc:mysql://localhost:3306/hackers?useSSL=false&serverTimezone=UTC";
			String user="root";
			String pass="root";
			Connection con=null;
			Statement statement=null;
			ResultSet rs=null;
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection(url,user,pass);
				statement = con.createStatement();
				rs=statement.executeQuery("SELECT * FROM hackerr_detail");
				
				while(rs.next())
				{
					String k=rs.getString(1);
					String name1=request.getParameter(k);
					
					if(name1!=null)
					{
						
						Statement statement1=con.createStatement();
						ResultSet rs1=statement1.executeQuery("select * from hackers.hackerr_detail where id="+k);
						rs1.next();
						int v=Integer.parseInt(rs1.getString(5));
						v++;
						
						Statement statement2=con.createStatement();
						statement2.executeUpdate("update hackers.hackerr_detail set Vote_Count="+v+" where id="+k);
						
					 }
				 }
				
			  }
			  catch(Exception e)
			  {
				  e.printStackTrace();
			  }
		
			response.sendRedirect("votingCount.jsp");
		}
	}

	
}
