<%-- 
    Document   : allproduct
    Created on : Oct 20, 2023, 10:07:01 PM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            .pagination a:hover {
                background-position: bottom;
                color: red;
            }
            .pagination a.active {
                background-position: bottom;
                color: red;
            }
            .pagination {
                display: flex;
                list-style: none;
            }

            .pagination li {
                margin-right: 2px;
                transition: all 0.3s; /* Add a transition for smooth effect */
            }

            .pagination li:hover {
                font-weight: bold;
                color: red; /* Change the text color to black when hovered */
            }
        </style>


    </head>
    <body> 

        <form action="allproduct" method="get">

            <div class="header">
                <%@include file="header.jsp" %>
            </div>
            <div class="container">

                <!-- START of INNER-CONTAINER -->
                <div class="inner-container clearfix">

                    <div id="all-product">

                        <h3>
                            <span>Tất cả sản phẩm</span>
                            <a class="list">List<span>&nbsp;</span></a>
                            <a class="grid">Grid<span>&nbsp;</span></a>
                        </h3>

                        <ul class="clearfix grid-view">
                            <c:forEach var="o" items="${plist}">
                                <li class="product">
                                    <a href="ProductDetail?pid=${o.getProductID()}" class="thumb"><img src="${o.images}" alt="" /></a>
                                    <div class="data">
                                        <a href="ProductDetail?pid=${o.getProductID()}" class="title" style="font-size: 10px;">${o.getName()}</a>
                                        <p>${o.getDescription()}</p>
                                        <div class="clearfix info">
                                            <a href="AddToCart?pid=${o.getProductID()}&quantity=1" class="add-to-cart">ADD TO CART</a>
                                            <span class="price-text">$<span>${o.getPrice()}</span></span>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>

                        </ul>

                    </div><!-- end of #product-list -->

                    <div id="sidebar">
                        <h3><span>CATEGORIES</span></h3>

                        <div class="row" >
                            <div class="col-md-6">
                                <!-- Left section content -->
                                <div id="top-functions-area" class="top-functions-area">
                                    <form action="allproduct" method="get">
                                        <div class="flt-item to-left" >
                                            <div>
                                                <select name="categoryId" onchange="this.form.submit()">
                                                    <option value="">All Category</option>
                                                    <c:forEach var="c" items="${clist}">
                                                        <option value="${c.getCategoryId()}" ${param['categoryId']==c.getCategoryId()?"selected":""}>${c.getName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Right section content -->
                                <div class="flt-item to-right">
                                    <form action="allproduct" method="get">
                                        <div>
                                            <select name="sort" class="form-select" onchange="this.form.submit()">
                                                <option value="0" ${param['sort']==0?"selected":""}>Sort Default</option>
                                                <option value="1" ${param['sort']==1?"selected":""}>Newest</option>
                                                <option value="2" ${param['sort']==2?"selected":""}>Price ascending</option>
                                                <option value="3" ${param['sort']==3?"selected":""}>Price descending</option>
                                            </select>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>



                    </div><!-- end of #sidebar -->

                </div>
                <!-- END of INNER-CONTAINER -->
                <div class="flex-c-m flex-w w-full p-t-45">
                    <div style="display: flex; justify-content: center;">
                        <ul class="pagination" >
                            <li  class="page-item next">
                                <a href="allproduct?index=1&categoryId=${param['categoryId']}&sort=${param['sort']}">
                                    <i class="fa fa-angle-left" class="page-link" aria-hidden="true"></i>
                                </a>
                            </li>
                            <c:forEach var = "i" begin = "1" end = "${numberPage}">
                                <li class="${param['index']==i?'page-item active':'page-item'}"><a href="allproduct?index=${i}&categoryId=${param['categoryId']}&sort=${param['sort']}"   class="page-link">${i}</a></li>
                                </c:forEach>
                            <li  class="page-item next"><a href="allproduct?index=${numberPage}&categoryId=${param['categoryId']}&sort=${param['sort']}"><i class="fa fa-angle-right" class="page-link" aria-hidden="true"></i></a></li>
                        </ul>
                    </div>
                </div>



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
</form>
</html>
