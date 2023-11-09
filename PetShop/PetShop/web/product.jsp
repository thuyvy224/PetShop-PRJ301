<%-- 
    Document   : product
    Created on : Oct 18, 2023, 11:17:58 AM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Pet Shop
        </title>
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/jquery.selectBox.css" />
        <link rel="shortcut icon" href="favicon.html" />

    </head>
    <body>
       <div class="header">
            <%@include file="header.jsp" %>
        </div>
        <div class="container">



            <!-- START of INNER-CONTAINER -->
            <div class="inner-container clearfix">

                <div id="product" class="clearfix">
                    <div class="product-gallery">
                        <div  style="height:400px"class="large-image">
                            <a class="cloud-zoom" id='zoom1' href="images/product-gallery/very-large-image.jpg" rel="adjustX: 10, adjustY:-4, softFocus:true">
                                <img style="width: 350px;height: 350px;margin: 30px" src="${p.getImages()}" alt="" />
                            </a>
                        </div>
                        
                    </div><!-- end of .product-gallery -->

                    <div class="product-detail">
                        <h2 style="width: 400px"><a href="#">${p.getName()}</a></h2>
                        <p>Availability:<span>In Stock</span></p>
                        <p class="price">Price: $ ${p.getPrice()}</p>
                        <form class="options-form" method="Post" action="AddToCart">
                            <input value="${p.getProductID()}" hidden name="pid"/>
                            <fieldset>
                                <p class="qty">
                                    <label>Quantity:</label>
                                    <input type="number" value="1" name="quantity" />
                                </p>
                                <input type="submit" class="submit-btn" value="ADD TO CART" />
                            </fieldset>
                        </form><!-- end of .available-options -->
                    </div><!-- end of .product-detail -->
                </div><!-- end of #contents -->



            </div>
            <!-- END of INNER-CONTAINER -->


            <!-- START TABS EXAMPLE -->
            <div class="product-tabs">
                <ul class="tabs">
                    <li><a>DESCRIPTION</a></li>
                </ul>									
                <div class="panes">
                    <div class="tab-pane">
                        <p>${p.getDescription()}</p>
                    </div>
                </div>
            </div>
            <!-- END TABS EXAMPLE -->

        </div><!-- end of .container -->
        <div class="footer">
            <%@include file="footer.jsp" %>
        </div>
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
        <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.selectBox.js"></script>
        <script type="text/javascript" src="js/jquery.cycle.all.js"></script>
        <script type="text/javascript" src="js/tabs-accordian.js"></script>
        <script type="text/JavaScript" src="js/cloud-zoom.1.0.2.js"></script>
        <script type="text/javascript" src="js/jquery.animate-colors-min.js"></script>           
        <script type="text/javascript" src="js/jquery.form.js"></script>
        <script type="text/javascript" src="js/jquery.validate.js"></script>    	
        <script type="text/javascript" src="js/script.js"></script>
    </body>

</html>
