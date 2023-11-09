<%-- 
    Document   : checkout
    Created on : Oct 20, 2023, 9:42:23 PM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Pet Shop</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/jquery.selectBox.css" />
        <link rel="shortcut icon" href="favicon.html" />
        <style>
            
        </style>
    </head>
    <body> 

        <div class="header">
            <%@include file="header.jsp" %>
        </div>

        <div class="container">


            <!-- START of BREADCRUMBS -->
            <p id="breadcrumbs">
                <a href="home.jsp">Home</a> >
                <span class="active"> CheckOut</span>
            </p>
            <!-- END of BREADCRUMBS -->


            <!-- START of INNER-CONTAINER -->
            <div class="inner-container clearfix">

                <div id="checkout">

                    <h4> Thông tin đơn hàng</h4>
                    <div class="pane current">
                        <form method="post" action="#">
                            <div class="top clearfix">
                                <div class="left-side">
                                    <fieldset>
                                        <legend>Thông tin liên hệ</legend>
                                        <p>
                                            <label for="f-name"><span>*</span>Nhập Tên:</label>
                                            <input type="text" id="name" class="text" />
                                        </p>
                                        <p>
                                            <label for="tel"><span>*</span>SĐT:</label>
                                            <input type="text" id="tel" class="text" />
                                        </p>
                                    </fieldset>
                                </div>

                                <div class="right-side">
                                    <fieldset>
                                        <legend>Thông tin địa chỉ</legend>

                                        <p>
                                            <label for="add"><span>*</span>Địa chỉ:</label>
                                            <input type="text" id="add" class="text" />
                                        </p>
                                        <p>
                                            <label for="note">Ghi chú:</label>
                                            <input type="text" id="note" class="text" />
                                        </p>



                                    </fieldset>
                                </div>
                            </div><!-- end of .data -->
                            <div class="bottom clearfix">
                                <p>
                                    <input type="checkbox" id="address-same" class="checkbox" />
                                    <label for="address-same">My delivery and billing addresses are the same. </label>
                                </p>

                                <input type="submit" id="submit" value="Continue" />
                            </div><!-- end of .bottom -->
                        </form>
                    </div>



                </div><!-- end of #checkout -->	

            </div>
            <!-- END of INNER-CONTAINER -->


        </div><!-- end of .container -->

        <div class="footer">
            <%@include file="footer.jsp" %>
        </div>

        <!-- jQuery -->
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

    <!-- Mirrored from inspirythemes.com/templates/bonfire-html/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 03 Jun 2015 13:04:13 GMT -->
</html>
