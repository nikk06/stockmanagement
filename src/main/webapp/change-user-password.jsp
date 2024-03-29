<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
					<h4 class="header-line">Change Password</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<img src="admin/assets/img/change-password.png"
						class="img-thumbnail" alt="Cinque Terre" width="504" height="436">
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<%
						String message = (String) session.getAttribute("password-change-success");
							if (message != null) {
								session.removeAttribute("password-change-success");
					%>
					<div class='alert alert-success' id='success'>Password change
						successfully.</div>
					<%
						}
					%>
					<%
						String fail = (String) session.getAttribute("password-change-fail");
							if (fail != null) {
								session.removeAttribute("password-change-fail");
					%>
					<div class="alert alert-danger" id='danger'>Old password does
						not match..</div>
					<%
						}
					%>
					<%
						String passwordConfirm = (String) session.getAttribute("password-not-match");
							if (passwordConfirm != null) {
								session.removeAttribute("password-not-match");
					%>
					<div class="alert alert-danger" id='danger'>New password and
						confirm password does not match.</div>
					<%
						}
					%>
					<div class="panel panel-danger">
						<div class="panel-heading">Change Password</div>
						<div class="panel-body">
							<form role="form" action="ChangePassword" method="post">
								<div class="form-group">
									<label>Old Password</label> <input class="form-control"
										type="text" name="cpassword" />
								</div>
								<div class="form-group">
									<label>New Password</label> <input class="form-control"
										type="password" name="password" />
								</div>
								<div class="form-group">
									<label>Re Type Password </label> <input class="form-control"
										type="password" name="confpass" />
								</div>
								<button type="submit" class="btn btn-primary">Change
									Password</button>
								<button type="reset" class="btn btn-danger">Cancel</button>
							</form>
						</div>
					</div>
				</div>
			</div>
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
