<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Mirrored from www.binarytheme.com/BTlivedemos/2014/08/29/horizontal-admin/form.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 Jul 2019 14:48:27 GMT -->
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
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
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
					<h4 class="header-line">Create User</h4>

				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
					<%
						String success = (String) session.getAttribute("success-message");
							if (success != null) {
								session.removeAttribute("success-message");
					%>
					<div class='alert alert-success' id='success'>User Register
						Successfully.</div>
					<%
						}
							String fail = (String) session.getAttribute("fail-message");
							if (fail != null) {
								session.removeAttribute("fail-message");
					%>
					<div class="alert alert-danger" id='danger'>User Registration
						Fail,Please try again</div>
					<%
						}
					%>
					<div class="panel panel-info">
						<div class="panel-heading">Create User</div>
						<div class="panel-body">
							<form role="form" method="post" action="CreateUser">
								<div class="form-group">
									<label>Enter Name</label> <input class="form-control"
										type="text" name="fullname" />
								</div>

								<div class="form-group">
									<label>Phone Number</label> <input class="form-control"
										type="text" name="phone" />
								</div>
								<div class="form-group">
									<label>Enter Email</label> <input class="form-control"
										type="text" name="email" />
								</div>
								<div class="form-group">
									<label>Address</label>
									<textarea class="form-control" rows="3" name="address"></textarea>
								</div>
								<div class="form-group">
									<label>User Name</label> <input class="form-control"
										type="text" name="uname" />
								</div>
								<div class="form-group">
									<label>Password</label> <input class="form-control"
										type="password" name="password" />
								</div>
								<button type="submit" class="btn btn-info">Create User
								</button>
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

	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});
</script>
</html>
