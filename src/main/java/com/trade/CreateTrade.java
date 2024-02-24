package com.trade;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class CreateTrade
 */
@WebServlet("/CreateTrade")
public class CreateTrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection = null;
	PreparedStatement preparedStatement = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int trade_id = 0;
		int clientId = 0;
		HttpSession hs = request.getSession();
		String clientName = request.getParameter("clientName");
		String date = request.getParameter("date");
		String script = request.getParameter("script");
		String trandeLimit = request.getParameter("trandeLimit");
		double buyPrice = Double.parseDouble(request.getParameter("buyPrice"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double sellPrice = Double.parseDouble(request.getParameter("sellPrice"));
		double volume = Double.parseDouble(request.getParameter("volume"));
		int poolAmount = Integer.parseInt(request.getParameter("poolAmount"));
		double brokarage = Double.parseDouble(request.getParameter("brokarage"));
		double profLoss = Double.parseDouble(request.getParameter("profLoss"));
		double netBalance = Double.parseDouble(request.getParameter("netBalance"));

		try {
			preparedStatement = null;
			connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			if (clientName != null && date != null && script != null && trandeLimit != null && buyPrice != 0
					&& quantity != 0 && sellPrice != 0 && volume != 0 && brokarage != 0 && profLoss != 0
					&& poolAmount != 0 && netBalance != 0) {
				ResultSet resultset = statement
						.executeQuery("select client_id from client_details where client_name='" + clientName + "'");
				if (resultset.next()) {
					clientId = resultset.getInt(1);
				}
				preparedStatement = connection.prepareStatement("insert into trade_details(trade_id,client_id,date,script,trade_limit,buy_price,quantity,sell_price,volume,total_pool_amount,brokarage,profit_loss,net_balance)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				preparedStatement.setInt(1, trade_id);
				preparedStatement.setInt(2, clientId);
				preparedStatement.setString(3, date);
				preparedStatement.setString(4, script);
				preparedStatement.setString(5, trandeLimit);
				preparedStatement.setDouble(6, buyPrice);
				preparedStatement.setInt(7, quantity);
				preparedStatement.setDouble(8, sellPrice);
				preparedStatement.setDouble(9, volume);
				preparedStatement.setInt(10, poolAmount);
				preparedStatement.setDouble(11, brokarage);
				preparedStatement.setDouble(12, profLoss);
				preparedStatement.setDouble(13, netBalance);
				int transaction = preparedStatement.executeUpdate();
				if (transaction > 0) {
					String message = "Trading create sucessfully";
					hs.setAttribute("message", message);
					response.sendRedirect("createTrade.jsp");
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
