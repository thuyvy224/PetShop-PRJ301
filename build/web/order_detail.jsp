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
        
    </head>
    <body class="homepage">   
        <div class="header">
            <%@include file="header.jsp" %>
        </div>
        <div class="container">



            <!-- START of INNER-CONTAINER -->
            <div class="inner-container">
                <div class="cart">
                    <h3>
                        <span>Đơn hàng chi tiết</span>
                    </h3>
                    <table>
                        <tr>
                            <th>Order ID</th>
                            <th>Product Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                        <c:forEach var="o" items="${odl}">
                            <tr class="table_row">
                                <td class="column-1">${o.getOrderID()}</td>    
                                <td class="column-2"><a href="ProductDetail?pid=${o.getProduct().getProductID()}">${o.getProduct().getName()}</a></td>
                                <td class="column-3"><img src="${o.getProduct().getImages()}" style="width: 5rem; height: rem;"/></td>
                                <td class="column-4">$ ${o.getPrice()}</td>
                                <td class="column-5">
                                    ${o.getQuantity()}
                                </td>
                            </tr>
                        </c:forEach>

                    </table>


                </div><!-- end of #product-list -->

            </div>
            <!-- END of INNER-CONTAINER -->


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
