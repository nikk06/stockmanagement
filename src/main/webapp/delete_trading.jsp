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
	<%!Connection connection = null;%>
	<%
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>

	<jsp:include page="adminSideHeader.jsp"></jsp:include>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Delete Trading</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<%
						String trading = (String) session.getAttribute("message");
					if (trading != null) {
						session.removeAttribute("message");
					%>
					<div class="alert alert-success" id="success">Trading deleted
						successfully.</div>
					<%
						}
					%>
					<div class="panel panel-default">
						<div class="panel-heading">Delete Trading</div>
						<div class="panel-body">
							<div class="form-row">
								<form action="delete_trading.jsp" method="post">
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
											Trading">
									</div>
								</form>
							</div>
							<br> <br>
							<form action="delete-trading-process.jsp" method="post">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Trade Id</th>
												<th>Client Id</th>
												<th>Client Name</th>
												<th>Date</th>
												<th>Script</th>
												<th>Trade Limit</th>
												<th>Buy Price</th>
												<th>Quantity</th>
												<th>Sell Price</th>
												<th>Volume</th>
												<th>Total Pool Amount</th>
												<th>Brokrage</th>
												<th>Profit Loss</th>
												<th>Net Balance</th>
												<th>#</th>

											</tr>
										</thead>
										<tbody>
											<%
												String clientName = request.getParameter("clientName");
											try {
												ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from client_details natural join trade_details where client_name='" + clientName + "' ");
												while (rs.next()) {
											%>
											<tr class="odd gradeX">
												<td><%=rs.getInt(8)%></td>
												<td><%=rs.getInt(1)%></td>
												<td><%=rs.getString(2)%></td>
												<td><%=rs.getString(9)%></td>
												<td><%=rs.getString(10)%></td>
												<td><%=rs.getString(11)%></td>
												<td><%=rs.getDouble(12)%></td>
												<td><%=rs.getInt(13)%></td>
												<td><%=rs.getDouble(14)%></td>
												<td><%=rs.getDouble(15)%></td>
												<td><%=rs.getInt(16)%></td>
												<td><%=rs.getDouble(17)%></td>
												<td><%=rs.getDouble(18)%></td>
												<td><%=rs.getDouble(19)%></td>
												<td><input type="checkbox" name=tid
													value="<%=rs.getInt(8)%>"></td>
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
								<button
									onclick="return confirm('Are you sure you want to delete?');"
									class="btn btn-danger">
									<i class="fa fa-pencil"></i> Delete Trading
								</button>
							</form>
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
