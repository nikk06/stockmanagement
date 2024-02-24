<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.DatabaseConnection"%>
<%@ page import="java.sql.*"%>
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
			<a class="navbar-brand" href="index.jsp"> <img
				src="assets/img/logo.jpeg" style="width: 150px; height: 50px;" />
			</a>
		</div>
	</div>
</div>
<section class="menu-section">
	<div class="container">
		<div class="row ">
			<div class="col-md-12">
				<div class="navbar-collapse collapse">
					<ul id="menu-top" class="nav navbar-nav navbar-right">
						<li><a href="dashboard.jsp">DASHBOARD</a></li>
						<li><a href="" class="dropdown-toggle" id="ddlmenuItem"
							data-toggle="dropdown">Client Management <i
								class="fa fa-angle-down"></i></a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="ddlmenuItem">
								<li><a href="createUser.jsp">Create Client</a></li>
								<li><a href="manageUser.jsp">Manage Client</a></li>
							</ul></li>
						<li><a href="" class="dropdown-toggle" id="ddlmenuItem"
							data-toggle="dropdown">Transaction Details <i
								class="fa fa-angle-down"></i></a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="ddlmenuItem">
								<li><a href="createTransaction.jsp">Create Transaction
										Details</a></li>
								<li><a href="manage-transactions.jsp">Modify
										Transaction Details</a></li>
								<li><a href="delete-transactions.jsp">Delete
										Transaction Details</a></li>
								<li><a href="view-transactions.jsp">View Transaction
										Details</a></li>
							</ul></li>
						<li><a href="" class="dropdown-toggle" id="ddlmenuItem"
							data-toggle="dropdown">Trade Details <i
								class="fa fa-angle-down"></i></a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="ddlmenuItem">
								<li><a href="createTrade.jsp">Create Trading</a></li>
								<li><a href="manage-trading.jsp">Modify Trading</a></li>
								<li><a href="delete_trading.jsp">Delete Trading</a></li>
								<li><a href="view-trading.jsp">View Trading</a></li>
							</ul></li>
						<li><a href="" class="dropdown-toggle" id="ddlmenuItem"
							data-toggle="dropdown">User Logo <i class="fa fa-angle-down"></i></a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="ddlmenuItem">
								<li><a href="logo-mapping.jsp">Map logo to client</a></li>
								<li><a href="manage-logo.jsp">Modify Logo</a></li>
								<li><a href="delete-logo.jsp">Delete Logo</a></li>
								<li><a href="view-logo.jsp">View Logo</a></li>
							</ul></li>
						<li><a href="" class="dropdown-toggle" id="ddlmenuItem"
							data-toggle="dropdown">Admin Logo <i class="fa fa-angle-down"></i></a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="ddlmenuItem">
								<li><a href="admin-logo-mapping.jsp">Map logo to Admin</a></li>
								<li><a href="admin-manage-logo.jsp">Modify Logo</a></li>
								<li><a href="admin-delete-logo.jsp">Delete Logo</a></li>
								<li><a href="admin-view-logo.jsp">View Logo</a></li>
							</ul></li>
						<li><a href="" class="dropdown-toggle" id="ddlmenuItem"
							data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<%=session.getAttribute("uname")%>&nbsp;<i
								class="fa fa-angle-down"></i></a>
							<ul class="dropdown-menu" role="menu"
								aria-labelledby="ddlmenuItem">
								<li><a href="view-admin-profile.jsp">View Profile</a></li>
								<li><a href="change-admin-password.jsp">Change Password</a></li>
								<li><a href="logout.jsp">Log Me Out</a></li>
							</ul></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
</section>