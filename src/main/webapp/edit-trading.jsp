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
					<h4 class="header-line">Modify Trade</h4>
				</div>
			</div>

			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
					<div class="panel panel-info">
						<div class="panel-heading">Modify Trade</div>
						<div class="panel-body">
							<%
								try {
								int tid = Integer.parseInt(request.getParameter("tid"));
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from trade_details where trade_id='" + tid + "'");
								while (resultset.next()) {
							%>
							<form role="form" method="post" action="edit-trading-process.jsp">
								<div class="form-group">
									<label>Trade Id</label> <input class="form-control" type="text"
										name="tid" value="<%=resultset.getInt(1)%>" readonly />
								</div>
								<div class="form-group">
									<label>Date</label> <input class="form-control" type="date"
										name="date" value="<%=resultset.getString(3)%>" />
								</div>
								<div class="form-group">
									<label>Script</label> <input class="form-control" type="text"
										name="script" value="<%=resultset.getString(4)%>" />
								</div>

								<div class="form-group">
									<label>Trade Limit</label> <input class="form-control"
										type="text" name="tlimit" value="<%=resultset.getString(5)%>" />
								</div>
								<div class="form-group">
									<label>Buy Price</label> <input class="form-control"
										type="text" name="buyPrice"
										value="<%=resultset.getDouble(6)%>" />
								</div>
								<div class="form-group">
									<label>Quantity</label> <input class="form-control" type="text"
										name="quantity" value="<%=resultset.getInt(7)%>" />
								</div>
								<div class="form-group">
									<label>Sell Price</label> <input class="form-control"
										type="text" name="sellPrice"
										value="<%=resultset.getDouble(8)%>" />
								</div>
								<div class="form-group">
									<label>Volume</label> <input class="form-control" type="text"
										name="volume" value="<%=resultset.getDouble(9)%>" />
								</div>
								<div class="form-group">
									<label>Total Pool Amount</label> <input class="form-control"
										type="text" name="poolAmount"
										value="<%=resultset.getInt(10)%>" />
								</div>
								<div class="form-group">
									<label>Brokerage</label> <input class="form-control"
										type="text" name="brokerage"
										value="<%=resultset.getDouble(11)%>" />
								</div>
								<div class="form-group">
									<label>Profit Loss</label> <input class="form-control"
										type="text" name="profitLoss"
										value="<%=resultset.getDouble(12)%>" />
								</div>
								<div class="form-group">
									<label>Net Balance</label> <input class="form-control"
										type="text" name="netBalance"
										value="<%=resultset.getDouble(13)%>" />
								</div>
								<button type="submit" class="btn btn-info">
									<i class=" fa fa-refresh "></i> &nbsp;Update
								</button>
							</form>
							<%
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
							%>
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
<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/form.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:27 GMT -->
</html>
