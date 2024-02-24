package contact;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class contact_us
 */
@WebServlet("/contact_us")
public class contact_us extends HttpServlet {
	Connection con;
	int i;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public contact_us() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter p=response.getWriter();
	     String n=request.getParameter("Name");
	     String n1=request.getParameter("Email");
	     String n2=request.getParameter("Phone");
	     String n3=request.getParameter("Message");
	     p.print(n);
	     p.print(n1);
	     p.print(n2);
	     p.print(n3);
	     try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stockmanagement","root","Nitin@123321@@");
				PreparedStatement ps=con.prepareStatement("Insert into contact values(?,?,?,?)");
				ps.setString(1, n);
				ps.setString(2, n1);
				ps.setString(3, n2);
				ps.setString(4, n3);
			     i=ps.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	     
			if(i==1)
			{
				response.sendRedirect("index.jsp");
				p.println("data stored succesfully");
			}
			else 
			{
				response.sendRedirect("usersignup.jsp");
			}
	     p.print(con);
	     
	}

}
