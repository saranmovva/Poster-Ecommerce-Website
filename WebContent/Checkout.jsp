<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<%@ page import="java.util.ArrayList" %>
<%@ page import="edu.ben.model.CreditCard" %>
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
			<li class="active"><a href="ShoppingCart.jsp"><span
					class="glyphicon glyphicon-shopping-cart"></span></a></li>
			<li><a href="Account.jsp"><span
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
	</div>
	</nav>
	</br>
	<h1 class="col-lg-6 col-lg-offset-3 text-center">Check Out</h1>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-4"></div>
			<div class="col-xs-12 col-md-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Payment Details</h3>
						<div class="checkbox pull-right">
							<label> <input type="checkbox" /> Remember
							</label>
						</div>
					</div>
					<div class="panel-body">
						<form role="form" action="CreditCardServlet" method="post">
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
											<input type="text" class="form-control" id="expirationMonth"
												placeholder="MM" required />
										</div>
										<div class="col-xs-6 col-lg-6 pl-ziro">
											<input type="text" class="form-control" id="expirationYear"
												placeholder="YY" required />
										</div>
									</div>
								</div>
								<div class="col-xs-5 col-md-5 pull-right">
									<div class="form-group">
										<label for="cvCode"> CV CODE</label> <input type="password"
											class="form-control" id="cvCode" placeholder="CV" required />
									</div>
								</div>
							</div>
						</form>
						<h4>
							Existing Payments
							<h4>
								<div class="col-xs-5 col-md-5 ">
									<div class="panel-success">
										<div class="btn-group col-md-5">
											<button type="button" class="btn btn-default dropdown-toggle"
												data-toggle="dropdown">
												Payment <span class="caret"></span>
											</button>
											<ul class="dropdown-menu" role="menu">
											<%
												ArrayList<CreditCard> card = (ArrayList<CreditCard>)session.getAttribute("cards");
												for(int i=0; i < card.size();i++){
													
													String temp = card.get(i).getCardNumber();
													String substr = temp.substring(temp.length() - 4);
											%>
												<li><a href="#"><%=substr%></a></li>
											<%
												}
											%>
											</ul>
										</div>
									</div>
								</div>
					</div>
				</div>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#"><span
							class="badge pull-right"><span
								class="glyphicon glyphicon-usd"></span>32.00</span> Final Payment</a></li>
				</ul>
				<br /> <a href="CreditCardServlet"
					class="btn btn-success btn-lg btn-block" role="button">Pay</a>
			</div>
		</div>
		</br>
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="panel panel-default">
				<!-- PayPal Logo -->
				<table border="0" cellpadding="10" cellspacing="0" align="center">
					<tr>
						<td align="center"></td>
					</tr>
					<tr>
						<td align="center"><img
							src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-large.png"
							alt="Check out with PayPal" /></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
