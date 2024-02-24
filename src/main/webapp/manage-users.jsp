<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	
	int userid = Integer.parseInt(request.getParameter("del"));
	try {
		
		int deleteUser = DatabaseConnection.insertUpdateFromSqlQuery("delete from client_details where client_id='" + userid + "'");
		if (deleteUser > 0) {
			String delete = "User deleted succesfully.";
			session.setAttribute("delete", delete);
			response.sendRedirect("manageUser.jsp");
		}

	} catch (Exception e) {
		e.printStackTrace();
	} 
%>