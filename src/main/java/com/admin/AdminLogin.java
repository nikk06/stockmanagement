package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.Random;
import java.util.UUID;

import com.connection.DatabaseConnection;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String uname = request.getParameter("uname");
			String pass = request.getParameter("upass");
			String vercode = request.getParameter("vercode");
			String captchaDB = null;
			HttpSession hs = request.getSession();
			String tokens = UUID.randomUUID().toString();
			Random random = new Random();
			int newRandomCaptcha = random.nextInt(9000) + 10000;
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet captchResultSet = DatabaseConnection.getResultFromSqlQuery("select * from tblcaptcha");
			if (captchResultSet.next()) {
				captchaDB = captchResultSet.getString(1);
			}
			if (captchaDB.equals(vercode)) {
				ResultSet resultset = st.executeQuery("select * from admin where uname='" + uname + "' AND password='" + pass + "'");
				if (resultset.next()) {
					hs.setAttribute("uname",resultset.getString("uname") );
					int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='"+ newRandomCaptcha + "'");
					response.sendRedirect("dashboard.jsp?_tokens='" + tokens + "'");
				} else {
					String message = "You have enter wrong credentials";
					hs.setAttribute("credential", message);
					response.sendRedirect("adminLogin.jsp");
					int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='"+ newRandomCaptcha + "'");
				}
			} else {
				String message = "You have enter invalid verification code";
				hs.setAttribute("verificationCode", message);
				response.sendRedirect("adminLogin.jsp");
				int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='"+ newRandomCaptcha + "'");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
