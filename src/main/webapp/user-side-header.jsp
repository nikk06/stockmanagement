<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="navbar navbar-inverse set-radius-zero">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="right-div">
			<a class="navbar-brand" href="index.jsp"><img
				src="admin/assets/img/client-side-logo.jpeg"
				style="width: 150px; height: 50px;" /> </a>
		</div>
	</div>
</div>
<section class="menu-section">
	<div class="container">
		<div class="row ">
			<div class="col-md-12">
				<div class="navbar-collapse collapse">
					<ul id="menu-top" class="nav navbar-nav navbar-right">
						<li><a href="user-dashboard.jsp">DASHBOARD</a></li>
						<li><a href="view-user-trade.jsp">View Trades</a></li>
						<li><a href="view-user-transaction.jsp">View Transaction</a></li>
						<li><a href="change-user-password.jsp">Change Password</a></li>
						<li><a href="user-profile.jsp">My Profile</a></li>
						<li><a href=""><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<%=session.getAttribute("uname")%></a></li>
						<li><a href="logout.jsp">LOG OUT</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>