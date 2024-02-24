<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.DatabaseConnection"%>
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
	<jsp:include page="user-side-header.jsp"></jsp:include>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">View Trading</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">View Trading</div>
						<div class="panel-body">
							<div class="form-row">
								<form action="view-user-trade.jsp" method="post">
									<div class="form-inline col-md-9">
										<label>Date:</label> <input class="form-control" type="date"
											name="date1"> To <input class="form-control"
											type="date" name="date2"> </select> <input type="submit"
											class="btn btn-danger" value="View
											Trades">
									</div>
								</form>
							</div>
							<br> <br>
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
										</tr>
									</thead>
									<tbody>
										<%
											try {
											String date1 = request.getParameter("date1");
											String date2 = request.getParameter("date2");
											ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from client_details natural join trade_details where client_id='"+ session.getAttribute("client_id") + "' and date between '" + date1 + "' and '" + date2 + "' ");
											while (resultset.next()) {
										%>
										<tr class="odd gradeX">
											<td><%=resultset.getInt(8)%></td>
											<td><%=resultset.getInt(1)%></td>
											<td><%=resultset.getString(2)%></td>
											<td><%=resultset.getString(9)%></td>
											<td><%=resultset.getString(10)%></td>
											<td><%=resultset.getString(11)%></td>
											<td><%=resultset.getDouble(12)%></td>
											<td><%=resultset.getInt(13)%></td>
											<td><%=resultset.getDouble(14)%></td>
											<td><%=resultset.getDouble(15)%></td>
											<td><%=resultset.getInt(16)%></td>
											<td><%=resultset.getDouble(17)%></td>
											<td><%=resultset.getDouble(18)%></td>
											<td><%=resultset.getDouble(19)%></td>
										</tr>
										<%
											}
										} catch (Exception e) {
											e.printStackTrace();
										}
										%>
									</tbody>
								</table>
								<form action="UserTradingPDFReport">
									<%
										String date1 = request.getParameter("date1");
										session.setAttribute("date1", date1);
										String date2 = request.getParameter("date2");
										session.setAttribute("date2", date2);
									%>
									<tr>
										<td><input type="submit" value="Generate Trading Reports"
											class="btn btn-danger"></td>
									</tr>
								</form>
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
