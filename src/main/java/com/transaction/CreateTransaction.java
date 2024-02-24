package com.transaction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CreateTransaction
 */
@WebServlet("/CreateTransaction")
public class CreateTransaction extends HttpServlet {
	Connection connection = null;
	PreparedStatement preparedStatement = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int trans_id = 0;
		int clientId = 0;
		HttpSession hs = request.getSession();
		String clientName = request.getParameter("clientName");
		int payment = Integer.parseInt(request.getParameter("payment"));
		String bankName = request.getParameter("bankName");
		String transMode = request.getParameter("transMode");
		String date = request.getParameter("date");
		try {
			connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			if (clientName != null && payment != 0 && bankName != null && transMode != null && date != null) {
				ResultSet resultset = statement.executeQuery("select client_id from client_details where client_name='" + clientName + "'");
				if (resultset.next()) {
					clientId = resultset.getInt(1);
				}
				preparedStatement = connection.prepareStatement("insert into transaction_details(transaction_id,client_id,payment,bank,mode,date)values(?,?,?,?,?,?)");
				preparedStatement.setInt(1, trans_id);
				preparedStatement.setInt(2, clientId);
				preparedStatement.setInt(3, payment);
				preparedStatement.setString(4, bankName);
				preparedStatement.setString(5, transMode);
				preparedStatement.setString(6, date);
				int transaction = preparedStatement.executeUpdate();
				if (transaction > 0) {
					String message = "Create transaction sucessfully";
					hs.setAttribute("message", message);
					response.sendRedirect("createTransaction.jsp");
				}
			}
		} catch (Exception e) {

		} finally {
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					/* ignored */}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					/* ignored */}
			}
		}
	}

}
