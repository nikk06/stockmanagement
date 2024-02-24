<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	int tid = Integer.parseInt(request.getParameter("tid"));
	String payment = request.getParameter("payment");
	String bankname = request.getParameter("bankname");
	String payMode = request.getParameter("payMode");
	String date = request.getParameter("date");
	
	try {
		
		int updateTransaction = DatabaseConnection.insertUpdateFromSqlQuery("update transaction_details set payment='" + payment + "',bank='" + bankname+ "',mode='" + payMode + "',date='" + date + "' where transaction_id='" + tid + "'");
		if (updateTransaction > 0) {
			String message = "Transaction updated sucessfully";
			session.setAttribute("message", message);
			response.sendRedirect("manage-transactions.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} 
%>