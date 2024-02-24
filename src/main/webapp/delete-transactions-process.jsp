<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%

	int transId = Integer.parseInt(request.getParameter("del"));
	try {
		int deleteUser = DatabaseConnection.insertUpdateFromSqlQuery("delete from transaction_details where transaction_id='" + transId + "'");
		if (deleteUser > 0) {
			String message = "Transaction deleted sucessfully";
			session.setAttribute("message", message);
			response.sendRedirect("delete-transactions.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} 
%>