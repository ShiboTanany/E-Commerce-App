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
            @import url(http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700);

            body {
                height:auto;

            }

            #bg {
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background: url(http://lorempixel.com/800/500/nature) no-repeat center center fixed;
                background-size: cover;
                -webkit-filter: blur(5px);    
            }

            form {
                position: relative;
                width: 490px;
                height: 500px;
                margin: 0 auto;
                background:#373D49;
                padding: 20px 22px;
                border: 1px solid #373D49;
               
            }

            form input {
                width: 312px;
                border: 1px solid;
                border-bottom-color: rgba(255,255,255,.5);
                border-right-color: rgba(60,60,60,.35);
                border-top-color: rgba(60,60,60,.35);
                border-left-color: rgba(80,80,80,.45);
                background-color: rgba(0,0,0,.2);
                background-repeat: no-repeat;
                padding: 8px 24px 8px 10px;
                font: bold .875em/1.25em "Open Sans Condensed", sans-serif;
                letter-spacing: .075em;
                color: #fff;
                text-shadow: 0 1px 0 rgba(0,0,0,.1);
                margin-bottom: 30px;
            }
            form button{ width: 312px;
                border: 1px solid;
                border-bottom-color: rgba(255,255,255,.5);
                border-right-color: rgba(60,60,60,.35);
                border-top-color: rgba(60,60,60,.35);
                border-left-color: rgba(80,80,80,.45);
                background-color: rgba(0,0,0,.2);
                background-repeat: no-repeat;
                padding: 8px 24px 8px 10px;
                font: bold .875em/1.25em "Open Sans Condensed", sans-serif;
                letter-spacing: .075em;
                color: #fff;
                text-shadow: 0 1px 0 rgba(0,0,0,.1);
                margin-bottom: 30px;}

            form input:focus { background-color: white; }

            form input.email {
                background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAMCAYAAAC9QufkAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6M0YwNDIzMTQ3QzIzMTFFMjg3Q0VFQzhDNTgxMTRCRTQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6M0YwNDIzMTU3QzIzMTFFMjg3Q0VFQzhDNTgxMTRCRTQiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDozRjA0MjMxMjdDMjMxMUUyODdDRUVDOEM1ODExNEJFNCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDozRjA0MjMxMzdDMjMxMUUyODdDRUVDOEM1ODExNEJFNCIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsOChsgAAADUSURBVHjaYvz///9JBgYGMwbSwSkGoOafQPwKiAOBmIEIHAXED0H6QJwPQGwAxE+AOJOAxnwgvgfEKiB9MM0gWg6IbwNxIw6NXUB8HogloHwUzSAsBAoDIJ4DxMxQMRA9H4gPADE/kloMzSCsBcR/gHgj1LAt0HBRR1P3gQktBA2AeBcQZwHxCyB+AsT3gTgFKq6FohrJZnssoW6AxPaDBqoZurP9oBrtCYS2ExA/h9JgzX+gAsZExrMZVP0fmGZ1IjWiBCoL0NsXgPgGGcnzLECAAQD5y8iZ2Z69IwAAAABJRU5ErkJggg==);
                background-position: 320px 10px;
            }

            form input.pass {
                background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAAQCAYAAADNo/U5AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTVFMDg1QzU3QzIzMTFFMjgwQThGODZFM0EwQUZFQ0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTVFMDg1QzY3QzIzMTFFMjgwQThGODZFM0EwQUZFQ0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1NUUwODVDMzdDMjMxMUUyODBBOEY4NkUzQTBBRkVDRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1NUUwODVDNDdDMjMxMUUyODBBOEY4NkUzQTBBRkVDRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pv2NSIIAAADYSURBVHjanJAxCsJAEEXXaBMQtvIMqTxDKjtPELC1svMoOYM2WlqIhVcQFMVgG7ATAoIggfGPjrLIrBo/vCzZ+Z+dGUNExiECI7Clhw5gAtqur8YfUQxm4AzGIAMRSIAFXbC8OyUdghwsgH173cp9Lr5XqAeOSsANcj3h/8BpbQ4Ko6uQOvtMQy6noG4+iz3XZ4iHbIEQ9L8EeUlN3t5etvSrMg6RqajAc78BQ7BTq6QrllV3tKLvpZOclyrt/TWTlTP0zVQqba/BAKyUWsmh1BPUxL70JsAABHkyyK1uocIAAAAASUVORK5CYII=);
                background-position: 323px 8px
            }

            ::-webkit-input-placeholder { color: #ccc; text-transform: uppercase; }
            ::-moz-placeholder { color: #ccc; text-transform: uppercase; }
            :-ms-input-placeholder { color: #ccc; text-transform: uppercase; }

            form .btn[type=submit] {
                width: 108px;
                margin-bottom: 0;
                margin-left: 120px;
                color: #3f898a;
                letter-spacing: .05em;
                text-shadow: 0 1px 0 #133d3e;
                text-transform: uppercase;
                background: #ff4b5a;
               
                cursor: pointer;
            }
            label{
                font: bold .675em/1.25em "Open Sans Condensed", sans-serif;

            }
        </style>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!-- Header -->
        <header id="header">

            <nav id="head-nav" class="navbar topnavbar navbar-fixed-top" role="navigation" data-spy="affix" data-offset-top="200">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a href="#header" class="navbar-brand header"><img src="img/logo.png" alt=""></a>
                    </div> <!-- /#navbar-header -->

                    <!-- Navigation -->
                    <div class="collapse navbar-collapse" id="navbar" >
                        <ul class="nav pull-right navbar-nav" id="main_navigation_menu">



                        </ul>
                    </div>
                </div>
            </nav> <!-- /#navbar -->

          
                <section id="slider">
                
                  <!--  <div class="container-full" >
                        <div id="main-slider" class="carousel slide">-->
                 <div class="slider">
                       <div class="product-big-title-area">
                          <div class="carousel-inner">
                                <div class="active item">
                                <div class="row ">
                                    <div class="col-md-12">
                                        <div class="product-bit-title text-center">
                                            <h2></h2>
                                            <center>
                                                <div id="for">
                                                    <div class="item">
                                                    <form action="AdminLogIn"  style="background:#333945;width: 540px"  method="post">
                                                        <header  >Login</header>
                                                        <label style="color: #fff" >Email<span>*</span></label>
                                                        <input type="email" name="email"/>
                                                        <div class="help"></div>
                                                        <label style="color: #fff">Password <span>*</span></label>
                                                        <input type="password" name="password"/>
                                                        <div class="help"></div>
                                                        <center>
                                                            <div class="col-md-12">
                                                                <button class="btn">Login</button><center></div>
                                                            <div style="color:#fff">${login}<div>
                                                                </form>
                                                                </div>
                                                                </div>
                                                            </center>
                                                            </div>
                                                            </div>
                                                            </div>
                                </div></div></div></section></header>
                                                            <!-- /#header -->








                                                            <!-- footer -->
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
                                                                                    <p>© Developed by  <a href="http://graygrids.com/">IDASH<i class="fa fa-arrow-right"></i></a></p>
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