<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<%@ page import="java.util.Random"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="edu.ben.model.Product"%>
</head>
<body>
	<!-- index -->
	<nav class="navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="ProductServlet/AllProducts"> <img
				id="logo" alt="Brand" src="/CMSC374Lab3/Images/logo.png">
			</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="ProductServlet/AllProducts">Home</a></li>
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
	</br>
	<%
		ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("ProductByCategory");
		Random randomNumber = new Random();
		int number1 = randomNumber.nextInt(list.size() - 0) + 0;
		int number2 = randomNumber.nextInt(list.size() - 0) + 0;
		int number3 = randomNumber.nextInt(list.size() - 0) + 0;
		int number4 = randomNumber.nextInt(list.size() - 0) + 0;
		int number5 = randomNumber.nextInt(list.size() - 0) + 0;
		int number6 = randomNumber.nextInt(list.size() - 0) + 0;
		Product one = list.get(number1);
		Product two = list.get(number2);
		Product three = list.get(number3);
		Product four = list.get(number4);
		Product five = list.get(number5);
		Product six = list.get(number6);
	%>
	<div class="container">
		<div id="main_area">
			<!-- Slider -->
			<div class="row">
				<div class="col-xs-12" id="slider">
					<!-- Top part of the slider -->
					<div class="row">
						<div class="col-sm-8" id="carousel-bounding-box">
							<div class="carousel slide" id="myCarousel">
								<!-- Carousel items -->
								<div class="carousel-inner">
									<div class="active item" data-slide-number="0">
										<img src="<%=one.getImg()%>">
									</div>

									<div class="item" data-slide-number="1">
										<img src="<%=two.getImg()%>">
									</div>

									<div class="item" data-slide-number="2">
										<img src="<%=three.getImg()%>">
									</div>
								</div>
								<!-- Carousel nav -->
								<a class="left carousel-control" href="#myCarousel"
									role="button" data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left"></span>
								</a> <a class="right carousel-control" href="#myCarousel"
									role="button" data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right"></span>
								</a>
							</div>
						</div>

						<div class="col-sm-4" id="carousel-text"></div>

						<div id="slide-content" style="display: none;">
							<div id="slide-content-0">
								<h2><%=one.getName()%></h2>
							</div>

							<div id="slide-content-1">
								<h2><%=two.getName()%></h2>
							</div>

							<div id="slide-content-2">
								<h2><%=three.getName()%></h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/Slider-->

		<div class="row hidden-xs" id="slider-thumbs">
			<!-- Bottom switcher of slider -->
			<ul class="hide-bullets">
				<li class="col-sm-2"><a class="thumbnail"
					id="carousel-selector-0"><img src="<%=one.getImg()%>"></a></li>

				<li class="col-sm-2"><a class="thumbnail"
					id="carousel-selector-1"><img src="<%=two.getImg()%>"></a></li>

				<li class="col-sm-2"><a class="thumbnail"
					id="carousel-selector-2"><img src="<%=three.getImg()%>"></a></li>
			</ul>
		</div>
	</div>

	<div class="container">

		<div id="productlist" class="row">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<h4 class="text-center">
						<span class="label label-info"><%=four.getCategory()%></span>
					</h4>
					<img src="<%=four.getImg()%>" class="img-responsive">
					<div class="caption">
						<div class="row">
							<div class="col-md-6 col-xs-6">
								<h3><%=four.getName()%></h3>
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
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<h4 class="text-center">
						<span class="label label-info"><%=five.getCategory()%></span>
					</h4>
					<img src="<%=four.getImg()%>" class="img-responsive">
					<div class="caption">
						<div class="row">
							<div class="col-md-6 col-xs-6">
								<h3><%=four.getName()%></h3>
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
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<h4 class="text-center">
						<span class="label label-info"><%=five.getCategory()%></span>
					</h4>
					<img src="<%=five.getImg()%>" class="img-responsive">
					<div class="caption">
						<div class="row">
							<div class="col-md-6 col-xs-6">
								<h3><%=five.getName()%></h3>
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
		</div>
	</div>
</body>
</html>
