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
@WebServlet("/update3")
public class AdminEdit extends HttpServlet {
	
    public AdminEdit() {
        super();
        
    }
      

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
			
			String name=request.getParameter("uname");
			String age=request.getParameter("age");
			String town=request.getParameter("town");
			String msg="Updated Successfully";
			String url="jdbc:mysql://localhost:3306/hackers?useSSL=false&serverTimezone=UTC";
			String user="root";
			String pass="root";
			Connection con=null;
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection(url,user,pass);
				Statement statement3=con.createStatement();
				ResultSet rs1=statement3.executeQuery("SELECT * FROM hackerr_detail");
				
				while(rs1.next())
				{
					String k=rs1.getString(1);
					String name1=request.getParameter(k);
					
					int l=Integer.parseInt(rs1.getString(1));
					if(name1!=null)
					{
						
						Statement statement4=con.createStatement();
						statement4.executeUpdate("update hackers.hackerr_detail set name=\""+name+"\",age="+age+",Town=\""+town+"\"where id="+l);
					}
				}
				
			 }
			 catch(Exception e)
			 {
				e.printStackTrace();
			 }
			
			request.getSession().setAttribute("msg5",msg);
		response.sendRedirect("edit1.jsp");
	}

	
}
