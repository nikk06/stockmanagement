<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	try {
		
		int deleteLogo = DatabaseConnection.insertUpdateFromSqlQuery("delete from client_config where client_id='" + cid + "'");
		if (deleteLogo > 0) {
			String message = "Logo deleted sucessfully";
			session.setAttribute("message", message);
			response.sendRedirect("delete-logo.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} 
%>