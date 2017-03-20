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
            tbody{
                
                color: #fff;
            }
            
        </style>
    </head>
    <body>

        




            <

            <header id="header">
                <div class="container">
                    <!-- Navigation -->
                    <div class="collapse navbar-collapse" id="navbar" >
                        <ul class="nav pull-right navbar-nav" id="main_navigation_menu">
                           <li ><a href="adminProfile.jsp">Profile</a></li>
                            <li><a href="AdminAddProduct.jsp">Add Product </a></li>
                            <li><a href="AdminShowProducts">Edit Product </a></li>
                            <li><a href="AdminShowCustomer">Show Customers</a></li>
                            <li><a href="ShowPrettyProduct">Pretty Show product</a></li>
                            <li class="active"><a href="AdminShowCart">Show History</a></li>
                            <li><a href="AdminLogout">LogOut</a></li>       
                        </ul>
                    </div>
                </div><br><br>

                <center>


                    <div class="container">
                        <div class="row">





                            <div class="container">
                                <table class="table">
                                     <table class="table">
                                            <thead>
                                                <tr style="color: #fff">
                                                   
                                                    <th>prouct</th>
                                                    <th>customer</th>
                                                    <th>qunatity</th>
                                                    <th>time</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>


                                                <c:forEach var="user" items="${requestScope.data}">
                                                    <tr>
                                                       
                                                        <td><img src="GetImage?x=${user.getProduct().getProductId()}" width="100px"/></td>
                                                        <td><img src="GetImageCustomer?x=${user.getCustomer().getId()}" width="100px"/></td>
                                                        
                                                        <td><c:out value="${user.getQuantity()}" /></td>
                                                        <td><c:out value="${user.getTime()}" /></td>
                                                        
                                                    </tr>
                                                </c:forEach>

                                            </tbody>

                                        </table>
                            </div>
                        </div>

                    </div>




                </center>
            </header> <!-- /#header -->
            
                                                            <footer id="footer">
                                                                <div class="container-full">
                                                                    <div class="container">
                                                                        <div class="bm-remove animate" data-anim-type="fadeInDownLarge">
                                                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                                                <div class="socile">
                                                                                    <ul>
                                                                                        <li><a href="graygrids"><i class="fa fa-facebook"></i></a></li>
                                                                                        <li><a href="graygrids"><i class="fa fa-twitter"></i></a></li>
                                                                                        <li><a href="musharrof"><i class="fa fa-dribbble"></i></a></li>
                                                                                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                                                                    </ul>
                                                                                    <a href="#">/AYOUB ELRED</a>
                                                                                </div>

                                                                            </div>
                                                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                                                <div class="float_right">
                                                                                    <p>© Developed by  <a href="http://graygrids.com/">GrayGrids.com <i class="fa fa-arrow-right"></i></a></p>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                        <div class="span1">
                                                                            <a id="gototop" class="gototop pull-right" href="#"><i class="icon-angle-up"></i></a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </footer> <!-- /#footer -->
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