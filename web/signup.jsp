<!--Added by Hatem Alamir-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.mobiland.controller.StatusHandler" %>
<!--End addition by Hatem Alamir-->

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
        <title>Sign up</title>

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
		<!--
        <div class="header-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="user-menu">

                            <!--edited by Hatem Al-Amir
                                    adding th login form to the top shortcut bar
                            ->

                            <ul>
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
                                    </c:choose>

                                <li><a href="signup.jsp"><i class="fa fa-user"></i> Sign up</a></li>

                                <li>
                                    <a  data-toggle="collapse" href="#login-form-wrap-top" aria-expanded="false" aria-controls="login-form-wrap-top"><i class="fa fa-user"></i> Login</a>
                                </li>

                                <form id="login-form-wrap-top" class="login collapse" method="post" action="login-serv?page=signup.jsp">
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

                                    <div class="clear"></div>
                                </form>

                                <div id="loginFirstModal" class="modal fade" role="dialog">
                                    <div class="modal-dialog">
                                        <!-- Modal content->
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
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End header area ->

		-->
        <c:if test="${not empty param.status}">
            <c:choose>
                <c:when test="${param.status eq StatusHandler.SUCCESS}"> 
                    <div class="alert alert-success">
                        <strong>Success!</strong> You should <a data-toggle="collapse" href="#login-form-wrap-top" aria-expanded="false" aria-controls="login-form-wrap-top">login now!</a>.
                    </div>
                </c:when>

                <c:when test="${param.status eq StatusHandler.ERR_DB_CONN}">
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

                <c:when test="${param.status eq StatusHandler.ERR_SIGNUP_EMAIL}">
                    <div class="alert alert-danger">
                        <strong>Error!</strong> Email already exists.
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
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="shop.jsp">Shop</a></li>
                        </ul>
                    </div>  
                </div>
            </div>
        </div> <!-- End mainmenu area -->

        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <h2>Sign up!</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-sidebar">
                            <h2 class="sidebar-title">Search Products</h2>
                            <form action="">
                                <input type="text" placeholder="Search products...">
                                <input type="submit" value="Search">
                            </form>
                        </div>

                        <div class="single-sidebar">
                            <h2 class="sidebar-title">Products</h2>
                            <div class="thubmnail-recent" name="sample-product">
                                <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="" id="prod-sample-img-0">
                                <h2><a href="single-product.jsp" id="prod-sample-name-0">Sony Smart TV - 2015</a></h2>
                                <div class="product-sidebar-price">
                                    <ins id="prod-sample-price-0">$700.00</ins> <del>$100.00</del>
                                </div>                             
                            </div>
                            <div class="thubmnail-recent" name="sample-product">
                                <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="" id="prod-sample-img-1">
                                <h2><a href="single-product.jsp" id="prod-sample-name-1">Sony Smart TV - 2015</a></h2>
                                <div class="product-sidebar-price">
                                    <ins id="prod-sample-price-1">$700.00</ins> <del>$100.00</del>
                                </div>                             
                            </div>
                            <div class="thubmnail-recent" name="sample-product">
                                <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="" id="prod-sample-img-2">
                                <h2><a href="single-product.jsp" id="prod-sample-name-2">Sony Smart TV - 2015</a></h2>
                                <div class="product-sidebar-price">
                                    <ins id="prod-sample-price-2">$700.00</ins> <del>$100.00</del>
                                </div>                             
                            </div>
                            <div class="thubmnail-recent" name="sample-product">
                                <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="" id="prod-sample-img-3">
                                <h2><a href="single-product.jsp" id="prod-sample-name-3">Sony Smart TV - 2015</a></h2>
                                <div class="product-sidebar-price">
                                    <ins id="prod-sample-price-3">$700.00</ins> <del>$100.00</del>
                                </div>                             
                            </div>
                        </div>

                        <div class="single-sidebar">
                            <h2 class="sidebar-title">Recent Posts</h2>
                            <ul>
                                <li><a href="single-product.jsp">Sony Smart TV - 2015</a></li>
                                <li><a href="single-product.jsp">Sony Smart TV - 2015</a></li>
                                <li><a href="single-product.jsp">Sony Smart TV - 2015</a></li>
                                <li><a href="single-product.jsp">Sony Smart TV - 2015</a></li>
                                <li><a href="single-product.jsp">Sony Smart TV - 2015</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-8">
                        <div class="product-content-right">
                            <div class="woocommerce">
                                <!--Edited by Ashour-->

                                <form enctype="multipart/form-data" action="SignupServlet" class="checkout" method="post" name="checkout">

                                    <div id="customer_details" class="col2-set">
                                        <div class="col-1">
                                            <div class="woocommerce-billing-fields">
                                                <h3>Customer information</h3>
                                                <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                    <label class="" for="billing_country">Address <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <select class="country_to_state country_select" id="billing_country" name="billing_country">
                                                        <option value="">Select a country?</option>
                                                        <option value="AX">\C5land Islands</option>
                                                        <option value="AF">Afghanistan</option>
                                                        <option value="AL">Albania</option>
                                                        <option value="DZ">Algeria</option>
                                                        <option value="AD">Andorra</option>
                                                        <option value="AO">Angola</option>
                                                        <option value="AI">Anguilla</option>
                                                        <option value="AQ">Antarctica</option>
                                                        <option value="AG">Antigua and Barbuda</option>
                                                        <option value="AR">Argentina</option>
                                                        <option value="AM">Armenia</option>
                                                        <option value="AW">Aruba</option>
                                                        <option value="AU">Australia</option>
                                                        <option value="AT">Austria</option>
                                                        <option value="AZ">Azerbaijan</option>
                                                        <option value="BS">Bahamas</option>
                                                        <option value="BH">Bahrain</option>
                                                        <option value="BD">Bangladesh</option>
                                                        <option value="BB">Barbados</option>
                                                        <option value="BY">Belarus</option>
                                                        <option value="PW">Belau</option>
                                                        <option value="BE">Belgium</option>
                                                        <option value="BZ">Belize</option>
                                                        <option value="BJ">Benin</option>
                                                        <option value="BM">Bermuda</option>
                                                        <option value="BT">Bhutan</option>
                                                        <option value="BO">Bolivia</option>
                                                        <option value="BQ">Bonaire, Saint Eustatius and Saba</option>
                                                        <option value="BA">Bosnia and Herzegovina</option>
                                                        <option value="BW">Botswana</option>
                                                        <option value="BV">Bouvet Island</option>
                                                        <option value="BR">Brazil</option>
                                                        <option value="IO">British Indian Ocean Territory</option>
                                                        <option value="VG">British Virgin Islands</option>
                                                        <option value="BN">Brunei</option>
                                                        <option value="BG">Bulgaria</option>
                                                        <option value="BF">Burkina Faso</option>
                                                        <option value="BI">Burundi</option>
                                                        <option value="KH">Cambodia</option>
                                                        <option value="CM">Cameroon</option>
                                                        <option value="CA">Canada</option>
                                                        <option value="CV">Cape Verde</option>
                                                        <option value="KY">Cayman Islands</option>
                                                        <option value="CF">Central African Republic</option>
                                                        <option value="TD">Chad</option>
                                                        <option value="CL">Chile</option>
                                                        <option value="CN">China</option>
                                                        <option value="CX">Christmas Island</option>
                                                        <option value="CC">Cocos (Keeling) Islands</option>
                                                        <option value="CO">Colombia</option>
                                                        <option value="KM">Comoros</option>
                                                        <option value="CG">Congo (Brazzaville)</option>
                                                        <option value="CD">Congo (Kinshasa)</option>
                                                        <option value="CK">Cook Islands</option>
                                                        <option value="CR">Costa Rica</option>
                                                        <option value="HR">Croatia</option>
                                                        <option value="CU">Cuba</option>
                                                        <option value="CW">Cura\C7ao</option>
                                                        <option value="CY">Cyprus</option>
                                                        <option value="CZ">Czech Republic</option>
                                                        <option value="DK">Denmark</option>
                                                        <option value="DJ">Djibouti</option>
                                                        <option value="DM">Dominica</option>
                                                        <option value="DO">Dominican Republic</option>
                                                        <option value="EC">Ecuador</option>
                                                        <option value="EG">Egypt</option>
                                                        <option value="SV">El Salvador</option>
                                                        <option value="GQ">Equatorial Guinea</option>
                                                        <option value="ER">Eritrea</option>
                                                        <option value="EE">Estonia</option>
                                                        <option value="ET">Ethiopia</option>
                                                        <option value="FK">Falkland Islands</option>
                                                        <option value="FO">Faroe Islands</option>
                                                        <option value="FJ">Fiji</option>
                                                        <option value="FI">Finland</option>
                                                        <option value="FR">France</option>
                                                        <option value="GF">French Guiana</option>
                                                        <option value="PF">French Polynesia</option>
                                                        <option value="TF">French Southern Territories</option>
                                                        <option value="GA">Gabon</option>
                                                        <option value="GM">Gambia</option>
                                                        <option value="GE">Georgia</option>
                                                        <option value="DE">Germany</option>
                                                        <option value="GH">Ghana</option>
                                                        <option value="GI">Gibraltar</option>
                                                        <option value="GR">Greece</option>
                                                        <option value="GL">Greenland</option>
                                                        <option value="GD">Grenada</option>
                                                        <option value="GP">Guadeloupe</option>
                                                        <option value="GT">Guatemala</option>
                                                        <option value="GG">Guernsey</option>
                                                        <option value="GN">Guinea</option>
                                                        <option value="GW">Guinea-Bissau</option>
                                                        <option value="GY">Guyana</option>
                                                        <option value="HT">Haiti</option>
                                                        <option value="HM">Heard Island and McDonald Islands</option>
                                                        <option value="HN">Honduras</option>
                                                        <option value="HK">Hong Kong</option>
                                                        <option value="HU">Hungary</option>
                                                        <option value="IS">Iceland</option>
                                                        <option value="IN">India</option>
                                                        <option value="ID">Indonesia</option>
                                                        <option value="IR">Iran</option>
                                                        <option value="IQ">Iraq</option>
                                                        <option value="IM">Isle of Man</option>
                                                        <option value="IL">Israel</option>
                                                        <option value="IT">Italy</option>
                                                        <option value="CI">Ivory Coast</option>
                                                        <option value="JM">Jamaica</option>
                                                        <option value="JP">Japan</option>
                                                        <option value="JE">Jersey</option>
                                                        <option value="JO">Jordan</option>
                                                        <option value="KZ">Kazakhstan</option>
                                                        <option value="KE">Kenya</option>
                                                        <option value="KI">Kiribati</option>
                                                        <option value="KW">Kuwait</option>
                                                        <option value="KG">Kyrgyzstan</option>
                                                        <option value="LA">Laos</option>
                                                        <option value="LV">Latvia</option>
                                                        <option value="LB">Lebanon</option>
                                                        <option value="LS">Lesotho</option>
                                                        <option value="LR">Liberia</option>
                                                        <option value="LY">Libya</option>
                                                        <option value="LI">Liechtenstein</option>
                                                        <option value="LT">Lithuania</option>
                                                        <option value="LU">Luxembourg</option>
                                                        <option value="MO">Macao S.A.R., China</option>
                                                        <option value="MK">Macedonia</option>
                                                        <option value="MG">Madagascar</option>
                                                        <option value="MW">Malawi</option>
                                                        <option value="MY">Malaysia</option>
                                                        <option value="MV">Maldives</option>
                                                        <option value="ML">Mali</option>
                                                        <option value="MT">Malta</option>
                                                        <option value="MH">Marshall Islands</option>
                                                        <option value="MQ">Martinique</option>
                                                        <option value="MR">Mauritania</option>
                                                        <option value="MU">Mauritius</option>
                                                        <option value="YT">Mayotte</option>
                                                        <option value="MX">Mexico</option>
                                                        <option value="FM">Micronesia</option>
                                                        <option value="MD">Moldova</option>
                                                        <option value="MC">Monaco</option>
                                                        <option value="MN">Mongolia</option>
                                                        <option value="ME">Montenegro</option>
                                                        <option value="MS">Montserrat</option>
                                                        <option value="MA">Morocco</option>
                                                        <option value="MZ">Mozambique</option>
                                                        <option value="MM">Myanmar</option>
                                                        <option value="NA">Namibia</option>
                                                        <option value="NR">Nauru</option>
                                                        <option value="NP">Nepal</option>
                                                        <option value="NL">Netherlands</option>
                                                        <option value="AN">Netherlands Antilles</option>
                                                        <option value="NC">New Caledonia</option>
                                                        <option value="NZ">New Zealand</option>
                                                        <option value="NI">Nicaragua</option>
                                                        <option value="NE">Niger</option>
                                                        <option value="NG">Nigeria</option>
                                                        <option value="NU">Niue</option>
                                                        <option value="NF">Norfolk Island</option>
                                                        <option value="KP">North Korea</option>
                                                        <option value="NO">Norway</option>
                                                        <option value="OM">Oman</option>
                                                        <option value="PK">Pakistan</option>
                                                        <option value="PS">Palestinian Territory</option>
                                                        <option value="PA">Panama</option>
                                                        <option value="PG">Papua New Guinea</option>
                                                        <option value="PY">Paraguay</option>
                                                        <option value="PE">Peru</option>
                                                        <option value="PH">Philippines</option>
                                                        <option value="PN">Pitcairn</option>
                                                        <option value="PL">Poland</option>
                                                        <option value="PT">Portugal</option>
                                                        <option value="QA">Qatar</option>
                                                        <option value="IE">Republic of Ireland</option>
                                                        <option value="RE">Reunion</option>
                                                        <option value="RO">Romania</option>
                                                        <option value="RU">Russia</option>
                                                        <option value="RW">Rwanda</option>
                                                        <option value="ST">S\E3o Tom\E9 and Pr\EDncipe</option>
                                                        <option value="BL">Saint Barth\E9lemy</option>
                                                        <option value="SH">Saint Helena</option>
                                                        <option value="KN">Saint Kitts and Nevis</option>
                                                        <option value="LC">Saint Lucia</option>
                                                        <option value="SX">Saint Martin (Dutch part)</option>
                                                        <option value="MF">Saint Martin (French part)</option>
                                                        <option value="PM">Saint Pierre and Miquelon</option>
                                                        <option value="VC">Saint Vincent and the Grenadines</option>
                                                        <option value="SM">San Marino</option>
                                                        <option value="SA">Saudi Arabia</option>
                                                        <option value="SN">Senegal</option>
                                                        <option value="RS">Serbia</option>
                                                        <option value="SC">Seychelles</option>
                                                        <option value="SL">Sierra Leone</option>
                                                        <option value="SG">Singapore</option>
                                                        <option value="SK">Slovakia</option>
                                                        <option value="SI">Slovenia</option>
                                                        <option value="SB">Solomon Islands</option>
                                                        <option value="SO">Somalia</option>
                                                        <option value="ZA">South Africa</option>
                                                        <option value="GS">South Georgia/Sandwich Islands</option>
                                                        <option value="KR">South Korea</option>
                                                        <option value="SS">South Sudan</option>
                                                        <option value="ES">Spain</option>
                                                        <option value="LK">Sri Lanka</option>
                                                        <option value="SD">Sudan</option>
                                                        <option value="SR">Suriname</option>
                                                        <option value="SJ">Svalbard and Jan Mayen</option>
                                                        <option value="SZ">Swaziland</option>
                                                        <option value="SE">Sweden</option>
                                                        <option value="CH">Switzerland</option>
                                                        <option value="SY">Syria</option>
                                                        <option value="TW">Taiwan</option>
                                                        <option value="TJ">Tajikistan</option>
                                                        <option value="TZ">Tanzania</option>
                                                        <option value="TH">Thailand</option>
                                                        <option value="TL">Timor-Leste</option>
                                                        <option value="TG">Togo</option>
                                                        <option value="TK">Tokelau</option>
                                                        <option value="TO">Tonga</option>
                                                        <option value="TT">Trinidad and Tobago</option>
                                                        <option value="TN">Tunisia</option>
                                                        <option value="TR">Turkey</option>
                                                        <option value="TM">Turkmenistan</option>
                                                        <option value="TC">Turks and Caicos Islands</option>
                                                        <option value="TV">Tuvalu</option>
                                                        <option value="UG">Uganda</option>
                                                        <option value="UA">Ukraine</option>
                                                        <option value="AE">United Arab Emirates</option>
                                                        <option selected="selected" value="GB">United Kingdom (UK)</option>
                                                        <option value="US">United States (US)</option>
                                                        <option value="UY">Uruguay</option>
                                                        <option value="UZ">Uzbekistan</option>
                                                        <option value="VU">Vanuatu</option>
                                                        <option value="VA">Vatican</option>
                                                        <option value="VE">Venezuela</option>
                                                        <option value="VN">Vietnam</option>
                                                        <option value="WF">Wallis and Futuna</option>
                                                        <option value="EH">Western Sahara</option>
                                                        <option value="WS">Western Samoa</option>
                                                        <option value="YE">Yemen</option>
                                                        <option value="ZM">Zambia</option>
                                                        <option value="ZW">Zimbabwe</option>
                                                    </select>
                                                </p>

                                                <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                    <label class="" for="billing_first_name">First Name <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text " required="">
                                                </p>

                                                <p id="billing_last_name_field" class="form-row form-row-last validate-required">
                                                    <label class="" for="billing_last_name">Last Name <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="" id="billing_last_name" name="billing_last_name" class="input-text " required="">
                                                </p>
                                                <div class="clear"></div>

                                                <p id="billing_company_field" class="form-row form-row-wide">
                                                    <label class="" for="billing_company">Job</label>
                                                    <input type="text" value="" placeholder="" id="billing_company" name="billing_company" class="input-text " required="">
                                                </p>


                                                <p id="billing_city_field" class="form-row form-row-wide address-field validate-required" data-o_class="form-row form-row-wide address-field validate-required">
                                                    <label class="" for="billing_city">Birth Date<abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="date" value="" placeholder="" id="billing_city" name="billing_date" class="input-text " required="">
                                                </p>

                                                <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                    <label class="" for="billing_state">Interests</label>
                                                    <input type="text" id="billing_state" name="billing_state" value="" class="input-text " required="">
                                                </p>


                                                <div class="clear"></div>

                                                <p id="billing_email_field" class="form-row form-row-first validate-required validate-email">
                                                    <label class="" for="billing_email">Email Address <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="email" value="" placeholder="" id="billing_email" name="billing_email" class="input-text " required="" >
                                                    <label id="checkmail"></label>
                                                </p>

                                                <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                    <label class="" for="billing_phone">Phone <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="text" value="" placeholder="" id="billing_phone" name="billing_phone" class="input-text" >
                                                    <label id="checkph"></label>
                                                </p>

                                                <p id="account_password_field" class="form-row validate-required">
                                                    <label class="" for="account_password">Account password <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="password" value="" placeholder="Password" id="account_password" name="account_password" class="input-text" required="" onblur="checkEmail()">
                                                </p>

                                                <p id="repeat-account_password_field" class="form-row validate-required">
                                                    <label class="" for="account_password">Repeat account password <abbr title="required" class="required" >*</abbr>
                                                    </label>
                                                    <input type="password" value="" placeholder="Password" id="repeat_account_password" name="repeat_account_password" class="input-text" required="">
                                                </p>

                                                <p>
                                                    <label class="" for="account_password">Choose Your Image<abbr title="required" class="required" >*</abbr>
                                                    </label>
                                                    <input type="file" value="Browse"  id="photo" name="image" required="">
                                                </p>

                                                <input type="submit" value="signup" />					
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!--Edited by Ashour-->
                            </div>                       
                        </div>                    
                    </div>
                </div>
            </div>
        </div>


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
                                <li><a href="profile.jsp">My account</a></li>
                                <li><a href="">Order history</a></li>
                                <li><a href="">Wishlist</a></li>
                                <li><a href="">Vendor contact</a></li>
                                <li><a href="index.jsp">Front page</a></li>
                            </ul>                        
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">Categories</h2>
                            <ul>
                                <li><a href="">Mobile Phone</a></li>
                                <li><a href="">Home accesseries</a></li>
                                <li><a href="">LED TV</a></li>
                                <li><a href="">Computer</a></li>
                                <li><a href="">Gadets</a></li>
                            </ul>                        
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-newsletter">
                            <h2 class="footer-wid-title">Newsletter</h2>
                            <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                            <div class="newsletter-form">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright">
                            <p>&copy; 2017 uStora. All Rights Reserved.</p>
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
        </div>

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
        <script src="js/main.js"></script>

        <!--Added by Ashour for  validation -->
        <script src="js/signup.js"></script>
        <!--Added by Ashour for  validation -->
		
		<script type="text/javascript" src="js/sample_products.js"></script>
		<script>
		  init_sample_prods();
		</script>
    </body>
</html>