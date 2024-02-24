package com.admin;

import java.io.IOException;
import java.security.SecureRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/CreateUser")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userid = 0;
		userid = 1000 + new Random().nextInt(9000);
		HttpSession hs = request.getSession();
		String fullname = request.getParameter("fullname");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String username = request.getParameter("uname");
		String password = request.getParameter("password");
		try {
			// connection = DatabaseConnection.getConnection();
			if (fullname != null && address != null && phone != null && email != null && username != null
					&& password != null) {
				
				int createUser = DatabaseConnection.insertUpdateFromSqlQuery("insert into client_details(client_id,client_name,client_address,client_phone_number,client_email,username,password)values('"
								+ userid + "','" + fullname + "','" + address + "','" + phone + "','" + email + "','"
								+ username + "','" + password + "') ");
				if (createUser > 0) {
					String message = "User added sucessfully.";
					hs.setAttribute("success-message", message);
					response.sendRedirect("createUser.jsp");
				} else {
					String message = "User creation fail";
					hs.setAttribute("fail-message", message);
					response.sendRedirect("createUser.jsp");
				}
			} else {
				System.out.println("Please check your values");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
