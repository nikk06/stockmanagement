package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String vercode = request.getParameter("vercode");
		String captchaDB = null;
		try {
			String tokens = UUID.randomUUID().toString();
			Random random = new Random();
			int newRandomCaptcha = random.nextInt(9000) + 10000;
			HttpSession hs = request.getSession();
			
			ResultSet captchResultSet = DatabaseConnection.getResultFromSqlQuery("select * from tblcaptcha");
			if (captchResultSet.next()) {
				captchaDB = captchResultSet.getString(1);
			}
			if (captchaDB.equals(vercode)) {
				ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from client_details where username='" + uname+ "' and password='" + upass + "'");
				if (resultset.next()) {
					hs.setAttribute("uname", resultset.getString(6));
					hs.setAttribute("client_id", resultset.getInt(1));
					int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='"+ newRandomCaptcha + "'");
					response.sendRedirect("user-dashboard.jsp");
					
				} else {
					String message = "You have enter wrong credentials";
					hs.setAttribute("credential", message);
					int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
					response.sendRedirect("userLogin.jsp");
				}
			} else {
				String message = "You have enter invalid verification code";
				hs.setAttribute("verificationCode", message);
				int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
				response.sendRedirect("userLogin.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
