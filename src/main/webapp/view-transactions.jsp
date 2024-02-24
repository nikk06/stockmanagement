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
					<h4 class="header-line">View Transactions</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">View Transactions</div>
						<div class="panel-body">
							<div class="form-row">
								<form action="view-transactions.jsp" method="post">
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
											Transactions">
									</div>
								</form>
							</div>
							<br> <br>
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Transaction Id</th>
											<th>Client Id</th>
											<th>Client Name</th>
											<th>Payment</th>
											<th>Bank Name</th>
											<th>Payment Mode</th>
											<th>Date</th>
										</tr>
									</thead>
									<tbody>
										<%
											String clientName = request.getParameter("clientName");
										try {
											ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from client_details natural join transaction_details where client_name='" + clientName + "' ");
											while (rs.next()) {
										%>
										<tr class="odd gradeX">
											<td><%=rs.getInt(8)%></td>
											<td><%=rs.getInt(1)%></td>
											<td><%=rs.getString(2)%></td>
											<td><%=rs.getInt(9)%></td>
											<td><%=rs.getString(10)%></td>
											<td><%=rs.getString(11)%></td>
											<td><%=rs.getString(12)%></td>
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
<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/table.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:34 GMT -->
</html>
