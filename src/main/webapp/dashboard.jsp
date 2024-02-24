<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:46:41 GMT -->
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
	<!-- LOGO HEADER END-->
	<jsp:include page="adminSideHeader.jsp"></jsp:include>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">ADMIN DASHBOARD</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-info back-widget-set text-center">
						<i class="fa fa-users fa-5x"></i>

						<%
						try {
							int count = 0;
							ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select count(*) from client_details");
							resultset.next();
							count = resultset.getInt(1);
							System.out.print("Count "+count);
						%>
						<h3><%=count%>&nbsp;
						</h3>
						Total Clients
						<%
							} catch (Exception e) {
								System.out.println("First Try");
								e.printStackTrace();
						}
						%>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-success back-widget-set text-center">
						<i class="fa fa-bars fa-5x"></i>
						<%
							int transactionCount = 0;
						try {
							ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select count(*) from transaction_details");
							rs.next();
							transactionCount = rs.getInt(1);
						%>
						<h3><%=transactionCount%>&nbsp;
						</h3>
						Total Transaction
						<%
							} catch (Exception e) {
								System.out.println("Second Try");
								e.printStackTrace();
						}
						%>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-warning back-widget-set text-center">
						<i class="fa fa-recycle fa-5x"></i>
						<%
							int tradeCount = 0;
						try {
							ResultSet tradingResultset = DatabaseConnection.getResultFromSqlQuery("select count(*) from trade_details");
							tradingResultset.next();
							tradeCount = tradingResultset.getInt(1);
						%>
						<h3><%=tradeCount%>&nbsp;
						</h3>
						Total Trades
						<%
							} catch (Exception e) {
								System.out.println("Third Try");
								e.printStackTrace();
						}
						%>
					</div>
				</div>
				<div class="col-md-3 col-sm-3 col-xs-6">
					<div class="alert alert-danger back-widget-set text-center">
						<i class="fa fa-photo fa-5x"></i>
						<%
							int logoCount = 0;
						try {
							ResultSet logoResultset = DatabaseConnection.getResultFromSqlQuery("select count(*) from client_config");
							logoResultset.next();
							logoCount = logoResultset.getInt(1);
						%>
						<h3><%=logoCount%>&nbsp;
						</h3>
						Total Image Mapping
						<%
							} catch (Exception e) {
								System.out.println("Fourth Try");
								e.printStackTrace();
						}
						%>
					</div>
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
response.sendRedirect("adminLogin.jsp");
}
%>
<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:47:41 GMT -->
</html>
