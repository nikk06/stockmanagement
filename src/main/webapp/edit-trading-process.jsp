<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	int tid = Integer.parseInt(request.getParameter("tid"));
	String date = request.getParameter("date");
	String script = request.getParameter("script");
	String tlimit = request.getParameter("tlimit");
	Double buyPrice = Double.parseDouble(request.getParameter("buyPrice"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	Double sellPrice = Double.parseDouble(request.getParameter("sellPrice"));
	Double volume = Double.parseDouble(request.getParameter("volume"));
	int poolAmount = Integer.parseInt(request.getParameter("poolAmount"));
	Double brokerage = Double.parseDouble(request.getParameter("brokerage"));
	Double profitLoss = Double.parseDouble(request.getParameter("profitLoss"));
	Double netBalance = Double.parseDouble(request.getParameter("netBalance"));
	
	try {
		int updateTrade = DatabaseConnection.insertUpdateFromSqlQuery("update trade_details set date='" + date + "',script='"
				+ script + "',trade_limit='" + tlimit + "',buy_price='" + buyPrice + "',quantity='" + quantity
				+ "',sell_price='" + sellPrice + "',volume='" + volume + "',total_pool_amount='" + poolAmount
				+ "',brokarage='" + brokerage + "',profit_loss='" + profitLoss + "',net_balance='" + netBalance
				+ "' where trade_id='" + tid + "'");
		if (updateTrade > 0) {
			String message = "Trading updated sucessfully";
			session.setAttribute("message", message);
			response.sendRedirect("manage-trading.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} 
%>