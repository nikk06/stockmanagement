<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/table.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:28 GMT -->
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>Stock Market</title>
<!-- BOOTSTRAP CORE STYLE  -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONT AWESOME STYLE  -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- DATATABLE STYLE  -->
<link href="assets/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<!-- CUSTOM STYLE  -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="adminSideHeader.jsp"></jsp:include>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Manage Client Logo</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<%
						String logo = (String) session.getAttribute("message");
					if (logo != null) {
						session.removeAttribute("message");
					%>
					<div class="alert alert-success" id="success">Logo edited
						successfully.</div>
					<%
						}
					%>
					<div class="panel panel-default">
						<div class="panel-heading">Manage Client Logo</div>
						<div class="panel-body">
							<div class="form-row">
								<form action="manage-logo.jsp" method="post">
									<div class="form-inline col-md-9">
										<label>Client Name</label> <select class="form-control"
											type="text" name="clientName"><option>Select</option>
											<%
												try {
												ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select client_id,client_name from client_details");
												while (resultset.next()) {
											%>
											<option><%=resultset.getString(2)%></option>
											<%
												}
											} catch (Exception e) {
												e.printStackTrace();
											}
											%>
										</select> <input type="submit" class="btn btn-danger"
											value="Search
											Logo">
									</div>
								</form>
							</div>
							<br> <br>
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Client Id</th>
											<th>Client Name</th>
											<th>Logo Name</th>
											<th>Name</th>
											<th>Logo</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<%
											String clientName = request.getParameter("clientName");
										try {
											ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from client_details natural join client_config where client_name='" + clientName + "' ");
											while (rs.next()) {
										%>
										<tr class="odd gradeX">
											<td><%=rs.getInt(1)%></td>
											<td><%=rs.getString(2)%></td>
											<td><%=rs.getString(8)%></td>
											<td><%=rs.getString(9)%></td>
											<td><image src="uploads/<%=rs.getString(8)%>" width="60"
													height="70"></image></td>
											<td class="center"><a
												href="edit-logo.jsp?cid=<%=rs.getInt(1)%>"><button
														class="btn btn-primary">
														<i class="fa fa-edit "></i> Edit
													</button></td>
										</tr>
										<%
											}
										} catch (Exception e) {
											e.printStackTrace();
										}
										%>
									</tbody>
								</table>
							</div>

						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<jsp:include page="adminFooter.jsp"></jsp:include>
	<!-- FOOTER SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- DATATABLE SCRIPTS  -->
	<script src="assets/js/dataTables/jquery.dataTables.js"></script>
	<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})
				(
						window,
						document,
						'script',
						'../../../../../../www.google-analytics.com/analytics.js',
						'ga');

		ga('create', 'UA-58127580-1', 'auto');
		ga('send', 'pageview');
	</script>
</body>
<%
	} else {
	response.sendRedirect("index.jsp");
}
%>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});
</script>
</html>
