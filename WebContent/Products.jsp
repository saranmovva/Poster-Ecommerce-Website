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
<%@ page import="edu.ben.model.Product" %>
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
	<div class="container">
		<div class="jumbotron">
			<h1>Products</h1>
		</div>
		</br>
		<%
			ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("ProductByCategory");
			for(int i=0; i < list.size(); i++){		
				Product temp = list.get(i);
				String name = temp.getName();
				String path = temp.getImg();
				String category = temp.getCategory();
		%>
					<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<h4 class="text-center">
						<span class="label label-info"><%=category%></span>
					</h4>
					<img src="<%=path %>"
						class="img-responsive">
					<div class="caption">
						<div class="row">
							<div class="col-md-6 col-xs-6">
								<h3><%=name%></h3>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-5 col-md-5 pull-left">
								<input> Quantity</input>
							</div>
							<div class="col-xs-5 col-md-5 pull-right">
								<ul class="dropdown">
									<a href="" class="btn dropdown-toggle pull-right"
										class="btn btn-default" data-toggle="dropdown" role="button"
										aria-haspopup="true" aria-expanded="false">Size <span
										class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">Size 1</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Size 2</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Size 3</a></li>
									</ul>
								</ul>
							</div>
							<div class="col-md-8">
								<a href="#" class="btn btn-success btn-product"><span
									class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		<%
			}
		%>
	</div>
</body>
</html>
