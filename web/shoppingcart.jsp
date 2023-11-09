<%-- 
    Document   : shoppingcart
    Created on : Oct 20, 2023, 4:53:30 PM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <!-- Mirrored from inspirythemes.com/templates/bonfire-html/shopping-cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 03 Jun 2015 13:04:12 GMT -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Pet Shop</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/jquery.selectBox.css" />
        <link rel="shortcut icon" href="favicon.html" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body class="homepage">   
        <div class="header">
            <%@include file="header.jsp" %>
        </div>
        <form action="Checkout" method="POST" >

            <div class="container">
                <!-- START of INNER-CONTAINER -->
                <div class="inner-container">
                    <div class="cart">
                        <h3>
                            <span>Giỏ hàng</span>
                        </h3>
                        <table>
                            <tr>
                                <th>Remove</th>
                                <th>Image</th>
                                <th class="name-header">Name</th>
                                <th>Quantity</th>
                                <th>Unit Price</th>
                                <th>Total</th>
                            </tr>
                            <c:set var="totalPrice" value="0" />
                            <c:forEach var="cart" items="${sessionScope['cart'].getItems()}">
                                <tr>
                                    <td>
                                        <div class="action">
                                            <a href="./DeleteCartItem?pid=${cart.getProduct().getProductID()}"style="color: red;" class="remove">Delete</a>
                                        </div>
                                    </td>
                                    <td class="thumb"><img src="${cart.getProduct().getImages()}" style="width: 5rem; height: 5rem;" alt="" /></td>
                                    <td class="name"><a href="ProductDetail?pid=${cart.getProduct().getProductID()}">${cart.getProduct().getName()}</a></td>
                                    <td class="qty">
                                        <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                            <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-minus"></i>
                                            </div>
                                            <!--<input class="mtext-104 cl3 txt-center num-product"  type="number" name="num-product1" value="${cart.getQuantity()}"/>-->
                                            <input class="mtext-104 cl3 txt-center num-product"  type="tel" name="num-product1" value="${cart.getQuantity()}" readonly/>
                                            <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-plus"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <c:set var="itemPrice" value="${cart.getProduct().getPrice() * cart.getQuantity()}" />
                                    <c:set var="totalPrice" value="${totalPrice + itemPrice}" />
                                    <td>$ ${cart.getProduct().getPrice()}</td>
                                    <td class="red">$ ${cart.getProduct().getPrice()*cart.getQuantity()}</td>
                                </tr>

                            </c:forEach>

                        </table>

                        <div class="clearfix">


                            <div class="right-column">
                                <p class="total">Total: $ ${totalPrice}</p>
                                Address: <input type="text" name="address"/>

                                <p>
                                    <button type="submit" style="background-color: gray" class="checkout">
                                        Checkout
                                    </button>
                                </p>

                                <p><a href="Home">Continue Shopping &rarr;</a></p>
                            </div>

                        </div>

                    </div><!-- end of #product-list -->

                </div>
                <!-- END of INNER-CONTAINER -->


            </div><!-- end of .container -->
        </form>

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
