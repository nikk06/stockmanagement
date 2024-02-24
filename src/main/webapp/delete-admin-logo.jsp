<%@page import="com.connection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%
	
	int aid = Integer.parseInt(request.getParameter("aid"));
	try {
		int deleteLogo = DatabaseConnection.insertUpdateFromSqlQuery("delete from admin_config where admin_id='" + aid + "'");
		if (deleteLogo > 0) {
			String message = "Logo deleted sucessfully";
			session.setAttribute("message", message);
			response.sendRedirect("admin-delete-logo.jsp");
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
%>