<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	</nav>
	</br>
	<h1 class="col-lg-6 col-lg-offset-3 text-center">Shopping Cart</h1>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Product</th>
							<th>Quantity</th>
							<th class="text-center">Price</th>
							<th class="text-center">Total</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="col-sm-8 col-md-6">
								<div class="media">
									<a class="thumbnail pull-left" href="#"> <img
										class="media-object" src="" style="width: 72px; height: 72px;">
									</a>
									<div class="media-body">
										<h4 class="media-heading">
											<a href="#">Product name</a>
										</h4>
										<h5 class="media-heading">
											by <a href="#">Brand name</a>
										</h5>
										<span>Status: </span><span class="text-success"><strong>In
												Stock</strong></span>
									</div>
								</div>
							</td>
							<td class="col-sm-1 col-md-1" style="text-align: center"><input
								type="email" class="form-control" id="exampleInputEmail1"
								value="3"></td>
							<td class="col-sm-1 col-md-1 text-center"><strong>$4.87</strong></td>
							<td class="col-sm-1 col-md-1 text-center"><strong>$14.61</strong></td>
							<td class="col-sm-1 col-md-1">
								<button type="button" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span> Remove
								</button>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><h5>Subtotal</h5></td>
							<td class="text-right"><h5>
									<strong>$24.59</strong>
								</h5></td>
						</tr>
						<tr>
							<td><h5>Address</h5></td>
							<td><button class="btn btn-default" type="button">
									Existing Address</button></td>
							<td><button class="btn btn-default" type="button">
									New Address</button></td>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><h5>Estimated shipping</h5></td>
							<td class="text-right"><h5>
									<strong>$6.94</strong>
								</h5></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td><h3>Total</h3></td>
							<td class="text-right"><h3>
									<strong>$31.53</strong>
								</h3></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<button type="button" class="btn btn-default">
									<span class="glyphicon glyphicon-shopping-cart"></span>
									<a href="ProductServlet/AllProducts"> Continue Shopping</a>
								</button>
							</td>
							<td>
								<button type="button" class="btn btn-success"><a href="Checkout.jsp"> Checkout</a>
									 <span class="glyphicon glyphicon-play"></span>
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
