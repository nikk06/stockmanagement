<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	String[] tradeId = request.getParameterValues("tid");
	int deleteTrade = 0;
	try {
		for (String tid : tradeId) {
			deleteTrade = DatabaseConnection.insertUpdateFromSqlQuery("delete from trade_details where trade_id='" + tid + "'");
		}
		if (deleteTrade > 0) {
			String message = "Trading deleted sucessfully";
			session.setAttribute("message", message);
			response.sendRedirect("delete_trading.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} 
%>