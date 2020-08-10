package demo2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminController() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String name1=request.getParameter("add");
		String name2=request.getParameter("edit");
		
		
		if(name1!=null)
		{
			response.sendRedirect("add1.jsp");
		}
		else if(name2!=null)
		{
			response.sendRedirect("edit1.jsp");
		}
		else
		{
				response.sendRedirect("delete1.jsp");
		}
		
		
	}

	

}
