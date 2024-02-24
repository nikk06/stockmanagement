<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
	<jsp:include page="user-side-header.jsp"></jsp:include>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">My Profile</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="admin/assets/img/user-profile.jpg" class="img-thumbnail"
						alt="Cinque Terre" width="504" height="436">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="panel panel-danger">
						<div class="panel-heading">My Profile</div>
						<div class="panel-body">
							<%
								try {
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from client_details where username='" + session.getAttribute("uname") + "'");
								while (resultset.next()) {
							%>
							<div class="form-group">
								<label>User Id</label> <input class="form-control" type="text"
									value="<%=resultset.getInt(1)%>" readonly />
							</div>
							<div class="form-group">
								<label>Full Name</label> <input class="form-control" type="text"
									value="<%=resultset.getString(2)%>" />
							</div>
							<div class="form-group">
								<label>Address</label> <input class="form-control" type="text"
									value="<%=resultset.getString(3)%>" />
							</div>
							<div class="form-group">
								<label>Phone Number</label> <input class="form-control"
									type="text" value="<%=resultset.getString(4)%>" />
							</div>
							<div class="form-group">
								<label>Email Id</label> <input class="form-control" type="text"
									value="<%=resultset.getString(5)%>" />
							</div>
							<div class="form-group">
								<label>User Name</label> <input class="form-control" type="text"
									value="<%=resultset.getString(6)%>" />
							</div>
							<div class="form-group">
								<label>Password</label> <input class="form-control" type="text"
									value="<%=resultset.getString(7)%>" />
							</div>

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
			<!--/.ROW-->
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<jsp:include page="user-footer.jsp"></jsp:include>
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
