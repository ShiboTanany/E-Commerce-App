<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UI Hero - Free Responsive Bootstrap Theme</title>
        <meta name="description" content="">
        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <!-- Style -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/main.css">

        <!-- Responsiv -->
        <link rel="stylesheet" href="css/responsive.css">

        <!-- Font awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Bootstrp -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Animations min -->
        <link rel="stylesheet" href="css/animations.min.css">

        <!-- Lightbox -->
        <link rel="stylesheet" href="css/lightbox.css" />

        <!-- Script -->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

        <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
        <link rel="stylesheet" href="css/style.css">
      
        <style>
           
            #shibo{
                border-width: 1px;
                border:2px solid #000;
                
            }
            
        </style>
    </head>
    <body>
        <!-- Header -->
        <header id="header" style="height: 3000px;">

            <nav id="head-nav" class="navbar topnavbar navbar-fixed-top" role="navigation" data-spy="affix" data-offset-top="200">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <i class="fa fa-bars"></i>
                        </button>

                    </div> <!-- /#navbar-header -->

                    <!-- Navigation -->
                    <div class="collapse navbar-collapse" id="navbar" >
                        <ul class="nav pull-right navbar-nav" id="main_navigation_menu">
                           <li ><a href="adminProfile.jsp">Profile</a></li>
                            <li><a href="AdminAddProduct.jsp">Add Product </a></li>
                            <li><a href="AdminShowProducts">Edit Product </a></li>
                            <li><a href="AdminShowCustomer">Show Customers</a></li>
                            <li class="active"><a href="ShowPrettyProduct">Pretty Show product</a></li>
                            <li><a href="AdminShowCart">Show History</a></li>
                            <li><a href="AdminLogout">LogOut</a></li>

                        </ul>
                    </div>
                </div>
            </nav><br><br><br><br><br><br> <!-- /#navbar -->
     

            <section id="slider" style="height:1500px;">
                <div class="container-full" >
                    <div class="slider">
                        <div id="main-slider" class="carousel slide">
                            <ol class="carousel-indicators">
                                <li data-target="Loginin" data-slide-to="0" ></li>
                                <li data-target="#main-slider" data-slide-to="1" class="active"></li>
                                <li data-target="#main-slider" data-slide-to="2"></li>
                            </ol> <!-- /#carousel-indicators -->
                            <!-- Carousel items -->
                            <div class="carousel-inner">
                                <div class="active item">
                                    <div >


                                        <c:forEach var="product" items="${requestScope.data}">
                        <div class="col-md-4 col-sm-6" id="shibo">
                            <div class="single-shop-product">
                                <div class="product-upper">
                                    <img src="GetImage?x=${product.getProductId()}" style="width:200px;  height:250px;" alt="">
                                </div>
                                <h2>${product.getDesc()}</a></h2>
                                <div class="product-carousel-price">
                                    <ins>$899.00</ins> <del>$999.00</del>
                                </div>  

                                <div class="product-carousel-price">
                                    <ins>${product.getPrice()}</ins> <del>$999.00</del>
                                </div>  
                                <div><form action="UpdateProduct?u=${product.getProductId()}" method="post"><input value="edit     " type="submit"/></form>
                                    <form action="DeleteProduct?u=${product.getProductId()}" method="post"><input value="delete" type="submit"/></form>
                                </div>
                            </div>
                       

                                <div><br></div>
                        </div>


                    </c:forEach>

                

                                    </div></div></div></div></div></div>
                        
                    
            </section> <!-- /#slider -->
        </header> <!-- /#header -->
        <script src="js/vendor/jquery-1.10.2.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/animations.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/lightbox.min.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/visible.min.js"></script>
        <script src="js/jquery.nav.js"></script>
        <script src="js/index.js"></script>
    </body>
</html>