package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.DatabaseConnection;
import java.sql.*;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cpassword = request.getParameter("cpassword");
		String password = request.getParameter("password");
		String confpass = request.getParameter("confpass");
		String pass = "";
		HttpSession session = request.getSession();
		try {

			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select password from client_details where password='" + cpassword+ "' and username='" + session.getAttribute("uname") + "'");
			if (resultset.next()) {
				pass = resultset.getString(1);
			}
			if (password.equals(confpass)) {
				if (pass.equals(cpassword)) {
					int i = DatabaseConnection.insertUpdateFromSqlQuery("update client_details set password='"+ password + "' where username='" + session.getAttribute("uname") + "' ");
					String message = "Password change successfully.";
					session.setAttribute("password-change-success", message);
					response.sendRedirect("change-user-password.jsp");

				} else {
					String message = "Old password does not match.";
					session.setAttribute("password-change-fail", message);
					response.sendRedirect("change-user-password.jsp");
				}
			} else {
				String message = "New password and re type password does not match.";
				session.setAttribute("password-not-match", message);
				response.sendRedirect("change-user-password.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
