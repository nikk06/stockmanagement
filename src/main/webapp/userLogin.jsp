<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.connection.*" %>

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
<title>Share Market Trade Watch</title>
<!-- BOOTSTRAP CORE STYLE  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	<div class="navbar navbar-inverse set-radius-zero">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"> <img
					src="admin/assets/img/client-side-logo.jpeg"
					style="width: 150px; height: 60px;" />
				</a>

			</div>
		</div>
	</div>
	<!-- LOGO HEADER END-->
	<section class="menu-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="navbar-collapse collapse ">
						<ul id="menu-top" class="nav navbar-nav navbar-right">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="userLogin.jsp">Client Login</a></li>
							<li><a href="adminLogin.jsp">Admin Login</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- MENU SECTION END-->
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">Client Login</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="admin/assets/img/Client-Login.jpg" class="img-thumbnail"
						alt="Cinque Terre" style="width:504px;height:250px;">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<%
						String credential = (String) session.getAttribute("credential");
						if (credential != null) {
							session.removeAttribute("credential");
					%>
					<div class="alert alert-danger" id="danger">You have enter
						wrong credentials.</div>
					<%
						}
					%>
					<div class="panel panel-primary">
						<div class="panel-heading">Client Login</div>
						<div class="panel-body">
							<form role="form" action="UserLogin" method="post">
								<div class="form-group">
									<label>User Name</label> <input class="form-control"
										type="text" name="uname" placeholder="User Name"/>
								</div>
								<div class="form-group">
									<label>Password</label> <input class="form-control"
										type="password" name="upass" placeholder="Password"/>
								</div>
								
								<%
									String captcha = null;
									ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcaptcha");
									if (resultset.next()) {
										captcha = resultset.getString(1);
									}
								%>
								<div class="form-group">
									<label>Enter Verification Code</label> <input type="text"
										name="vercode" class="form-control"
										placeholder="Enter Verification Code Here" />
								</div>
								<div class="form-group">
									<label>Verification Code</label> <input type="text"
										value="<%=captcha%>" class="form-control"
										style="width: 180px;" readonly />
								</div>
								<button type="submit" class="btn btn-success">Login</button>
								&nbsp;
								<button type="reset" class="btn btn-danger">Reset</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--/.ROW-->
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					&copy; 2021 TradeWatch.com |<a href="http://www.pennontraders.com/"
						target="_blank"> Designed & Developed By : Kishor Kadam.</a>
				</div>

			</div>
		</div>
	</section>
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
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});
</script>
</html>
