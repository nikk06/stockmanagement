<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/form.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:27 GMT -->
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
					<h4 class="header-line">Create Trade</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
					<%
						String trading = (String) session.getAttribute("message");
							if (trading != null) {
								session.removeAttribute("message");
					%>
					<div class="alert alert-success" id="success">Trading created
						successfully.</div>
					<%
						}
					%>
					<div class="panel panel-info">
						<div class="panel-heading">Create Trade</div>
						<div class="panel-body">
							<form role="form" method="post" action="CreateTrade">
								<div class="form-group">
									<label>Client Name</label> <select class="form-control"
										type="text" name="clientName"><option>Select</option>
										<%
												
												try {
													ResultSet resultset= DatabaseConnection.getResultFromSqlQuery("select client_name from client_details");
													while (resultset.next()) {
										%>
										<option><%=resultset.getString(1)%></option>
										<%
											}
												}catch(Exception e){
													e.printStackTrace();
												}
										%>
									</select>
								</div>

								<div class="form-group">
									<label>Date</label> <input class="form-control" type="date"
										name="date" />
								</div>
								<div class="form-group">
									<label>Script</label> <input class="form-control" type="text"
										name="script" />
								</div>
								<div class="form-group">
									<label>Trade Limit</label> <input type="text"
										class="form-control" name="trandeLimit">
								</div>
								<div class="form-group">
									<label>Buy Price</label> <input class="form-control"
										type="text" name="buyPrice" />
								</div>
								<div class="form-group">
									<label>Quantity</label> <input type="text" class="form-control"
										name="quantity">
								</div>
								<div class="form-group">
									<label>Sell Price</label> <input type="text"
										class="form-control" name="sellPrice">
								</div>
								<div class="form-group">
									<label>Volume</label> <input type="text" class="form-control"
										name="volume">
								</div>
								<div class="form-group">
									<label>Total Pool Amount</label> <input type="text"
										class="form-control" name="poolAmount">
								</div>
								<div class="form-group">
									<label>Brokarage</label> <input type="text"
										class="form-control" name="brokarage">
								</div>
								<div class="form-group">
									<label>Profit/Loss</label> <input type="text"
										class="form-control" name="profLoss">
								</div>
								<div class="form-group">
									<label>Net Balance</label> <input type="text"
										class="form-control" name="netBalance">
								</div>
								<button type="submit" class="btn btn-info">Create Trade</button>
								<button type="reset" class="btn btn-danger">Reset</button>
							</form>
						</div>
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
