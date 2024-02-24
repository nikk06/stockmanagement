<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	String fullname = request.getParameter("fullname");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	try {
		int updateUser = DatabaseConnection.insertUpdateFromSqlQuery("update client_details set client_name='" + fullname
				+ "',client_address='" + address + "',client_phone_number='" + phone + "',client_email='"
				+ email + "' where client_id='" + cid + "'");
		if (updateUser > 0) {
			String success = "User info update succesfully.";
			session.setAttribute("success", success);
			response.sendRedirect("manageUser.jsp");
		}

	} catch (Exception e) {
		e.printStackTrace();
	} 
%>