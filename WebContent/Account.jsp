<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
	<nav class="navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="ProductServlet/AllProducts"> <img id="logo"
				alt="Brand" src="/CMSC374Lab3/Images/logo.png">
			</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="ProductServlet/AllProducts">Home</a></li>
			<li class="dropdown"><a href="" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">Categories <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="ProductServlet/Nature">Nature</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="ProductServlet/CityScape">CityScape</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="ProductServlet/CyberPunk">CyberPunk</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="ProductServlet/Fantasy">Fantasy</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="ProductServlet/Space">Space</a></li>
				</ul></li>
			<li><a href="Create.jsp">Create</a></li>
			<li><a href="ContactUs.jsp">Contact Us</a></li>
			<li><a href="AboutUs.jsp">About Us</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control span8" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</form>
			<%
				if (session.getAttribute("user") != null) {
			%>
			<li><a href="ShoppingCart.jsp"><span
					class="glyphicon glyphicon-shopping-cart"></span></a></li>
			<li class="active"><a href="Account.jsp"><span
					class="glyphicon glyphicon-user"></span>Your Account</a></li>

			<li><a href="SignOutServlet"><span
					class="glyphicon glyphicon-log-in"></span> SignOut</a></li>
			<%
				} else {
			%>
			<li><a href="Login.jsp"><span
					class="glyphicon glyphicon-shopping-cart"></span></a></li>
			<li><a href="Registration.jsp"><span
					class="glyphicon glyphicon-user"></span> Register</a></li>
			<li><a href="Login.jsp"><span
					class="glyphicon glyphicon-log-in"></span> Login</a></li>
			<%
				}
			%>
		</ul>
	</nav>
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<%
					String menu = (String) session.getAttribute("AccountMenu");
					if (menu.equals("ShippingInformation")) {
				%>
				<li><a href="AccountServlet/ShippingInformation">Shipping
						Information</a></li>
				<li><a href="AccountServlet/PaymentInformation">Payment
						Information</a></li>
				<li><a href="AccountServlet/AccountSettings">Account
						Settings</a></li>
				<%
					} else if (menu.equals("PaymentInformation")) {
				%>
				
				<li><a href="AccountServlet/ShippingInformation">Shipping
						Information</a></li>
				<li class="active"><a href="AccountServlet/PaymentInformation">Payment
						Information</a></li>
				<li><a href="AccountServlet/AccountSettings">Account
						Settings</a></li>
				<%
					} else if (menu.equals("ShippingInformation")) {
				%>

				<li><a href="AccountServlet/ShippingInformation">Shipping
						Information</a></li>
				<li><a href="AccountServlet/PaymentInformation">Payment
						Information</a></li>
				<li><a href="AccountServlet/AccountSettings">Account
						Settings</a></li>
				<%
					}
				%>
			</ul>
		</div>
		<%
			if (menu.equals("ShippingInformation")) {
		%>
		<div class="container">
			<!-- Form Name -->
			<div class="jumbotron">
				<h1>Address Details</h1>
			</div>
			<div class="panel panel-default">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<form class="form-horizontal" role="form">

							<!-- Text input-->
							<div class="form-group">
								<div class="col-sm-10">
									<input type="text" placeholder="Address Line 1"
										class="form-control">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<div class="col-sm-10">
									<input type="text" placeholder="Address Line 2"
										class="form-control">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<div class="col-sm-10">
									<input type="text" placeholder="City" class="form-control">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<div class="col-sm-4">
									<input type="text" placeholder="State" class="form-control">
								</div>
								<div class="col-sm-4">
									<input type="text" placeholder="Post Code" class="form-control">
								</div>
							</div>

							<!-- Text input-->
							<div class="form-group">
								<div class="col-sm-10">
									<input type="text" placeholder="Country" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="pull-left">
										<button type="submit" class="btn btn-default">Cancel</button>
										<button type="submit" class="btn btn-primary">Save</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
			<!-- /.row -->
		</div>
		<%
			} else if (menu.equals("PaymentInformation")){
		%>
		<div class="container">
			<div class="jumbotron">
				<h1>Add Payment Information</h1>
			</div>
			<div class="row">
				<div class="col-xs-12 col-md-4"></div>
				<div class="col-xs-12 col-md-4">
					<div class="panel panel-default">

						<div class="panel-body">
							<form role="form">
								<div class="form-group">
									<label for="cardNumber"> CARD NUMBER</label>
									<div class="input-group">
										<input type="text" class="form-control" id="cardNumber"
											placeholder="Valid Card Number" required autofocus /> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-lock"></span></span>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-7 col-md-7">
										<div class="form-group">
											<label for="expityMonth"> EXPIRATION DATE</label>
											<div class="col-xs-6 col-lg-6 pl-ziro">
												<input type="text" class="form-control" id="expityMonth"
													placeholder="MM" required />
											</div>
											<div class="col-xs-6 col-lg-6 pl-ziro">
												<input type="text" class="form-control" id="expityYear"
													placeholder="YY" required />
											</div>
										</div>
									</div>
								</div>
							</form>
							<a href="" class="btn btn-success btn-lg btn-block" role="button">Save</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%
			} else if(menu.equals("AccountSettings")){
		%>
		<div class="jumbotron">
				<h1>Change Account Password</h1>
		</div>
		<form>
		    <div class='form-group col-md-2 col-md-offset-5'>
		      <input type='password' class='form-control' placeholder='Current Password' name='currentPassword' required>
		    </div>
		    <div class='form-group col-md-2 col-md-offset-5'>
		      <input type='text' class='form-control' placeholder='New Password' name='newPassword' required>
		    </div>
		     <div class='form-group col-md-2 col-md-offset-5'>
		      <input type='text' class='form-control' placeholder='Confirm New Password' name='newPasswordConfirm' required>
		    </div>
		    <label name="errorLabel"> </label>
		    <button type='submit' class='btn btn-success col-md-2 col-md-offset-5'>Change Password</button>
		</form>
		<%
			}
		%>
		
	</div>
</body>
</html>
