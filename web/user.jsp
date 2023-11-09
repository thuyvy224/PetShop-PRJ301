<%-- 
    Document   : user
    Created on : Oct 20, 2023, 11:54:54 PM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Pet Shop</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/jquery.selectBox.css" />
        <link rel="shortcut icon" href="favicon.html" />

    </head>

    <body>

        <div class="header">
            <%@include file="header.jsp" %>
        </div>
        <!-- START of HEADER WRAPPER -->

        <div class="container">

            <!-- START of FEATURED PRODUCTS -->
            <div class="product-listing">
                <h3><span>SẢN PHẨM PHỔ BIẾN</span></h3>

                <ul class="clearfix">
                    <c:forEach var="o" items="${top4P}">
                        <li class="product">
                            <a href="ProductDetail?pid=${o.getProductID()}" class="thumb"><img src="${o.images}" alt=""/></a>
                            <a href="ProductDetail?pid=${o.getProductID()}" class="title" style="font-size: 10px;">${o.getName()}</a>
                            <div class="clearfix info" style="margin-top: 1rem;">
                                <a href="AddToCart?pid=${o.getProductID()}&quantity=1" class="add-to-cart">ADD TO CART</a>
                                <span class="price-text">$<span>${o.getPrice()}</span></span>
                            </div>
                        </li>
                    </c:forEach>



                </ul>
            </div>
            <!-- END of FEATURED PRODUCTS -->


            <!-- START of LATEST PRODUCTS -->
            <div class="product-listing">
                <h3><span>SẢN PHẨM MỚI NHẤT</span></h3>

                <ul class="clearfix">
                    <c:forEach var="o" items="${p4ListN}">
                        <li class="product">
                            <a href="ProductDetail?pid=${o.getProductID()}" class="thumb"><img src="${o.images}" alt=""/></a>
                            <a href="ProductDetail?pid=${o.getProductID()}" class="title" style="font-size: 10px;">${o.getName()}</a>
                            <div class="clearfix info" style="margin-top: 1rem;">
                                <a href="AddToCart?pid=${o.getProductID()}&quantity=1" class="add-to-cart">ADD TO CART</a>
                                <span class="price-text">$<span>${o.getPrice()}</span></span>
                            </div>
                        </li>
                    </c:forEach>

                </ul>
            </div>
            <!-- END of LATEST PRODUCTS -->

            <!-- START of FEATURED PRODUCTS -->




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

