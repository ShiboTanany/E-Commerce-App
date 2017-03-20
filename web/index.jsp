<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mobiland.controller.StatusHandler" %>
<!DOCTYPE html>
<!--
	ustora by freshdesignweb.com
	Twitter: https://twitter.com/freshdesignweb
	URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ustora Home Page</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
						
<!--edited by Hatem Al-Amir
	adding th login form to the top shortcut bar
-->

                        <ul>
							<c:choose>
								<c:when test="${not empty sessionScope && not empty sessionScope.customer}">
									<li><a href="profile.jsp"><i class="fa fa-user"></i> My Account</a></li>
									<li><a href="/ShowCartProducts"><i class="fa fa-user"></i> My Cart</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a href="signup.jsp"><i class="fa fa-user"></i> Sign up</a></li>

									<li>
										<a  data-toggle="collapse" href="#login-form-wrap-top" aria-expanded="false" aria-controls="login-form-wrap-top"><i class="fa fa-user"></i> Login</a>
									</li>

									<form id="login-form-wrap-top" class="login collapse" method="post" action="login-serv?page=index.jsp">
										<p class="form-row form-row-first">
											<label for="username">Username or email <span class="required">*</span>
											</label>
											<input type="text" id="username-top" name="userName" class="input-text"  required="true" pattern= "[\w\.-]*[a-zA-Z0-9_]@[\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]"/>
										</p>
										<p class="form-row form-row-last">
											<label for="password">Password <span class="required">*</span>
											</label>
											<input type="password" id="password-top" name="password" class="input-text" required="true" />
										</p>
										<div class="clear"></div>

										<p class="form-row">
											<input type="submit" value="Login" name="login" class="button">
										</p>

										<div class="clear"></div>
									</form>

									<div id="loginFirstModal" class="modal fade" role="dialog">
										<div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
											  <div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
												<h4 class="modal-title">Be our guest!</h4>
											  </div>
											  <div class="modal-body">
												<p>Please login first</p>
											  </div>
											  <div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											  </div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
							<!-- 
							<c:choose>
								<c:when test="${not empty sessionScope && not empty sessionScope.customer}">
									<li><a href="profile.jsp"><i class="fa fa-user"></i> My Account</a></li>
								</c:when>
								<c:otherwise>
									<li><a data-toggle="modal" data-target="#loginFirstModal"><i class="fa fa-user"></i> My Account</a></li>
								</c:otherwise>
                            </c:choose>
							
							<c:choose>
								<c:when test="${not empty sessionScope && not empty sessionScope.customer}">
									<li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
								</c:when>
								<c:otherwise>
									<li><a data-toggle="modal" data-target="#loginFirstModal"><i class="fa fa-user"></i> Wishlist</a></li>
								</c:otherwise>
                            </c:choose>
							
							<c:choose>
								<c:when test="${not empty sessionScope && not empty sessionScope.customer}">
									<li><a href="cart.jsp"><i class="fa fa-user"></i> My Cart</a></li>
								</c:when>
								<c:otherwise>
									<li><a data-toggle="modal" data-target="#loginFirstModal"><i class="fa fa-user"></i> My Cart</a></li>
								</c:otherwise>
                            </c:choose> -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
	<c:if test="${not empty param.status}">
		<c:choose>
			<c:when test="${param.status eq StatusHandler.ERR_DB_CONN}">
				<div class="alert alert-danger">
					<strong>Error!</strong> Internal database error.
				</div>
			</c:when>
			
                        <c:when test="${param.status eq StatusHandler.ERR_DB_PROC}">
				<div class="alert alert-danger">
					<strong>Error!</strong> Internal database error.
				</div>
			</c:when>
                        
			<c:when test="${param.status eq StatusHandler.ERR_LOGIN_EMAIL}">
				<div class="alert alert-danger">
					<strong>Error!</strong> Email does not exist.
				</div>
			</c:when>
			
			<c:when test="${param.status eq StatusHandler.ERR_LOGIN_PASSWD}">
				<div class="alert alert-danger">
					<strong>Error!</strong> Password is wrong.
				</div>
			</c:when>
			
			<c:when test="${param.status eq StatusHandler.ERR_NOT_FOUND}">
				<div class="alert alert-danger">
					<strong>Error!</strong> Requested resources not found.
				</div>
			</c:when>
		</c:choose>
    </c:if>
	
<!--end of edited part by Hatem Al-Amir-->

    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img src="img/logo.png"></a></h1>
                    </div>
                </div>
                
				<c:if test="${not empty sessionScope && not empty sessionScope.customer}">
					<div class="col-sm-6">
						<div class="shopping-item">
							<a href="cart.jsp">Cart<i class="fa fa-shopping-cart"></i></a>
						</div>
					</div>
				</c:if>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="shop.jsp">Shop</a></li>
						<c:choose>
							<c:when test="${not empty sessionScope && not empty sessionScope.customer}">
								<li><a href="cart.jsp">Cart</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="signup.jsp">Sign up</a></li>
							</c:otherwise>
                        </c:choose>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    
    <div class="slider-area">
        	<!-- Slider -->
			<div class="block-slider block-slider4">
				<ul class="" id="bxslider-home4">
					<li>
						<img src="img/h4-slide.png" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								iPhone <span class="primary">6 <strong>Plus</strong></span>
							</h2>
							<h4 class="caption subtitle">Dual SIM</h4>
							<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
						</div>
					</li>
					<li><img src="img/h4-slide2.png" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								by one, get one <span class="primary">50% <strong>off</strong></span>
							</h2>
							<h4 class="caption subtitle">school supplies & backpacks.*</h4>
							<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
						</div>
					</li>
					<li><img src="img/h4-slide3.png" alt="Slide">
						<div class="caption-group">
							<h2 class="caption title">
								Apple <span class="primary">Store <strong>Ipod</strong></span>
							</h2>
							<h4 class="caption subtitle">Select Item</h4>
							<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
						</div>
					</li>
					<li><img src="img/h4-slide4.png" alt="Slide">
						<div class="caption-group">
						  <h2 class="caption title">
								Apple <span class="primary">Store <strong>Ipod</strong></span>
							</h2>
							<h4 class="caption subtitle">& Phone</h4>
							<a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
						</div>
					</li>
				</ul>
			</div>
			<!-- ./Slider -->
    </div> <!-- End slider area -->
    
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-refresh"></i>
                        <p>30 Days return</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p>Free shipping</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-lock"></i>
                        <p>Secure payments</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-gift"></i>
                        <p>New products</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Latest Products</h2>
                        <div class="product-carousel" id="prod_latest_area">
                            <div class="single-product" name="prod-latest-div">
                                <div class="product-f-image">
                                    <img src="img/product-1.jpg" alt="" name="prod-latest-img-0">
                                    <div class="product-hover">
										<c:if test="${not empty sessionScope && not empty sessionScope.customer}">
											<a href="#" class="add-to-cart-link" name="prod-latest-add-0"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        </c:if>
										<a href="single-product.html" class="view-details-link" name="prod-latest-detail-0"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html" name="prod-latest-single-0">Samsung Galaxy s5- 2015</a></h2>
                                
                                <div class="product-carousel-price">
                                    <ins name="prod-latest-price-0">$700.00</ins> <del>$100.00</del>
                                </div> 
                            </div>
                            <div class="single-product" name="prod-latest-div">
                                <div class="product-f-image">
                                    <img src="img/product-2.jpg" alt="" name="prod-latest-img-1">
                                    <div class="product-hover">
                                        <c:if test="${not empty sessionScope && not empty sessionScope.customer}">
											<a href="#" class="add-to-cart-link" name="prod-latest-add-1"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        </c:if>
                                        <a href="single-product.html" class="view-details-link" name="prod-latest-detail-1"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html" name="prod-latest-single-1">Nokia Lumia 1320</a></h2>
                                <div class="product-carousel-price">
                                    <ins name="prod-latest-price-1">$899.00</ins> <del>$999.00</del>
                                </div> 
                            </div>
                            <div class="single-product" name="prod-latest-div">
                                <div class="product-f-image">
                                    <img src="img/product-3.jpg" alt=""  name="prod-latest-img-2">
                                    <div class="product-hover">
                                        <c:if test="${not empty sessionScope && not empty sessionScope.customer}">
											<a href="#" class="add-to-cart-link" name="prod-latest-add-2"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        </c:if>
                                        <a href="single-product.html" class="view-details-link" name="prod-latest-detail-2"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html" name="prod-latest-single-2">LG Leon 2015</a></h2>

                                <div class="product-carousel-price">
                                    <ins name="prod-latest-price-2">$400.00</ins> <del>$425.00</del>
                                </div>                                 
                            </div>
                            <div class="single-product" name="prod-latest-div">
                                <div class="product-f-image">
                                    <img src="img/product-4.jpg" alt="" name="prod-latest-img-3">
                                    <div class="product-hover">
                                        <c:if test="${not empty sessionScope && not empty sessionScope.customer}">
											<a href="#" class="add-to-cart-link" name="prod-latest-add-3"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        </c:if>
                                        <a href="single-product.html" class="view-details-link" name="prod-latest-detail-3"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html" name="prod-latest-single-3">Sony microsoft</a></h2>

                                <div class="product-carousel-price">
                                    <ins name="prod-latest-price-3">$200.00</ins> <del>$225.00</del>
                                </div>                            
                            </div>
                            <div class="single-product" name="prod-latest-div">
                                <div class="product-f-image">
                                    <img src="img/product-5.jpg" alt="" name="prod-latest-img-4">
                                    <div class="product-hover">
                                        <c:if test="${not empty sessionScope && not empty sessionScope.customer}">
											<a href="#" class="add-to-cart-link" name="prod-latest-add-4"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        </c:if>
                                        <a href="single-product.html" class="view-details-link" name="prod-latest-detail-4"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html" name="prod-latest-single-4">iPhone 6</a></h2>

                                <div class="product-carousel-price">
                                    <ins name="prod-latest-price-4">$1200.00</ins> <del>$1355.00</del>
                                </div>                                 
                            </div>
                            <div class="single-product" name="prod-latest-div">
                                <div class="product-f-image">
                                    <img src="img/product-6.jpg" alt="" name="prod-latest-img-5">
                                    <div class="product-hover">
                                        <c:if test="${not empty sessionScope && not empty sessionScope.customer}">
											<a href="#" class="add-to-cart-link" name="prod-latest-add-5"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        </c:if>
                                        <a href="single-product.html" class="view-details-link" name="prod-latest-detail-5"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html" name="prod-latest-single-5">Samsung gallaxy note 4</a></h2>

                                <div class="product-carousel-price">
                                    <ins name="prod-latest-price-5">$400.00</ins>
                                </div>                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
    
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <div class="brand-list">
                            <img src="img/brand1.png" alt="">
                            <img src="img/brand2.png" alt="">
                            <img src="img/brand3.png" alt="">
                            <img src="img/brand4.png" alt="">
                            <img src="img/brand5.png" alt="">
                            <img src="img/brand6.png" alt="">
                            <img src="img/brand1.png" alt="">
                            <img src="img/brand2.png" alt="">                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End brands area -->
    
    <div class="product-widget-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">Top Sellers</h2>
                        <a href="" class="wid-view-more">View All</a>
                        <div class="single-wid-product" name="sample-product">
                            <a href="single-product.jsp"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb" id="prod-sample-img-0"></a>
                            <h2><a href="single-product.jsp" id="prod-sample-name-0">Sony Smart TV - 2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins id="prod-sample-price-0">$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product" name="sample-product">
                            <a href="single-product.jsp"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb" id="prod-sample-img-1"></a>
                            <h2><a href="single-product.jsp" id="prod-sample-name-1">Sony Smart TV - 2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins id="prod-sample-price-1">$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product" name="sample-product">
                            <a href="single-product.jsp"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb" id="prod-sample-img-2"></a>
                            <h2><a href="single-product.jsp" id="prod-sample-name-2">Sony Smart TV - 2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins id="prod-sample-price-2">$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">Recently Viewed</h2>
                        <a href="#" class="wid-view-more">View All</a>
                        <div class="single-wid-product" name="sample-product">
                            <a href="single-product.jsp"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb" id="prod-sample-img-3"></a>
                            <h2><a href="single-product.jsp" id="prod-sample-name-3">Sony Smart TV - 2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins id="prod-sample-price-3">$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product" name="sample-product">
                            <a href="single-product.jsp"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb" id="prod-sample-img-4"></a>
                            <h2><a href="single-product.jsp" id="prod-sample-name-4">Sony Smart TV - 2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins id="prod-sample-price-4">$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product" name="sample-product">
                            <a href="single-product.jsp"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb" id="prod-sample-img-5"></a>
                            <h2><a href="single-product.jsp" id="prod-sample-name-5">Sony Smart TV - 2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins id="prod-sample-price-5">$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-product-widget">
                        <h2 class="product-wid-title">Top New</h2>
                        <a href="#" class="wid-view-more">View All</a>
                        <div class="single-wid-product" name="sample-product">
                            <a href="single-product.jsp"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb" id="prod-sample-img-6"></a>
                            <h2><a href="single-product.jsp" id="prod-sample-name-6">Sony Smart TV - 2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins id="prod-sample-price-6">$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product" name="sample-product">
                            <a href="single-product.jsp"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb" id="prod-sample-img-7"></a>
                            <h2><a href="single-product.jsp" id="prod-sample-name-7">Sony Smart TV - 2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins id="prod-sample-price-7">$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                        <div class="single-wid-product" name="sample-product">
                            <a href="single-product.jsp"><img src="img/product-thumb-1.jpg" alt="" class="product-thumb" id="prod-sample-img-8"></a>
                            <h2><a href="single-product.jsp" id="prod-sample-name-8">Sony Smart TV - 2015</a></h2>
                            <div class="product-wid-rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <div class="product-wid-price">
                                <ins id="prod-sample-price-8">$400.00</ins> <del>$425.00</del>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End product widget area -->
    
    <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2>u<span>Stora</span></h2>
                        <p>uStora is one of the most prominent web sites in Egypt. We provide a wide variety of products that meet all needs and tastes.</p>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">User Navigation </h2>
                        <ul>
                            <li><a href="#">My account</a></li>
                            <li><a href="#">Order history</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Vendor contact</a></li>
                            <li><a href="#">Front page</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categories</h2>
                        <ul>
                            <li><a href="#">Mobile Phone</a></li>
                            <li><a href="#">Home accesseries</a></li>
                            <li><a href="#">LED TV</a></li>
                            <li><a href="#">Computer</a></li>
                            <li><a href="#">Gadets</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer top area -->
    
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End footer bottom area -->
   
		<!-- Latest jQuery form server -->
		<script src="https://code.jquery.com/jquery.min.js"></script>

		<!-- Bootstrap JS form CDN -->
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

		<!-- jQuery sticky menu -->
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/jquery.sticky.js"></script>

		<!-- jQuery easing -->
		<script src="js/jquery.easing.1.3.min.js"></script>

		<!-- Main Script -->
		<script src="js/main1.js"></script>

		<!-- Slider -->
		<script type="text/javascript" src="js/bxslider.min.js"></script>
		<script type="text/javascript" src="js/script.slider.js"></script>
		<script type="text/javascript" src="js/latest_products.js"></script>
		<script type="text/javascript" src="js/sample_products.js"></script>
	  <script>
		  init_latest_prods();
		  init_sample_prods();
	  </script>
  </body>
</html>