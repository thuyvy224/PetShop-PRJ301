<%-- 
    Document   : header
    Created on : Oct 18, 2023, 8:28:51 AM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <style>
            /* Your CSS styles for the header-top class */
            .header-top {
                background-color: cornflowerblue;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 10px; /* Adjust padding as needed */
            }

            .header-left img {
                max-width: 50px; /* Adjust the maximum width of the image */
            }

            .header-right form {
                display: flex;
                align-items: center;
            }

            .header-right input[type="text"] {
                padding: 5px;
                margin-right: 5px;
            }

            .header-right button {
                padding: 5px 10px;
            }
            .header__icon svg{
                width: 30px
            }
            .header__icon {
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
            .menu {
                display: flex;
                justify-content: center;
                list-style: none;
                padding: 0;
                margin-bottom: 20px;
                background-color: #bfe7fd; /* Background color for the menu */
            }

            .menu li {
                display: inline-block;
                margin-right: 15px;
            }

            .menu li:last-child {
                margin-right: 0;
            }

            .menu li a {
                color: tomato; /* Color of the menu items */
                text-decoration: none;
                padding: 10px 20px; /* Padding for each menu item */
                display: block;
            }

            .menu li a:hover {
                color: #ff0000;
            }

            /* Other CSS styles for your page */
            /* Add your other CSS styles here */
        </style>
    </head>

    <body>


        <header>
            <div class="header-top">
                <div class="header-left"> <!--logo-->
                    <a href="#"><img src="data:image/png;base64,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"></a>
                </div>
                <div class="header-right"> <!--content search-->
                    <form action="allproduct">
                        <input name="search" type="text">
                        <button type="submit">Search</button>
                    </form>

                </div>

                <c:if test="${sessionScope['account']==null}">
                    <a href="login" class="header__icon header__icon--account link link--text" data-open-auth-sidebar="">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="icon icon-account" viewBox="0 0 1024 1024" width="100%" height="100%"><path class="path1" d="M486.4 563.2c-155.275 0-281.6-126.325-281.6-281.6s126.325-281.6 281.6-281.6 281.6 126.325 281.6 281.6-126.325 281.6-281.6 281.6zM486.4 51.2c-127.043 0-230.4 103.357-230.4 230.4s103.357 230.4 230.4 230.4c127.042 0 230.4-103.357 230.4-230.4s-103.358-230.4-230.4-230.4z"></path><path class="path2" d="M896 1024h-819.2c-42.347 0-76.8-34.451-76.8-76.8 0-3.485 0.712-86.285 62.72-168.96 36.094-48.126 85.514-86.36 146.883-113.634 74.957-33.314 168.085-50.206 276.797-50.206 108.71 0 201.838 16.893 276.797 50.206 61.37 27.275 110.789 65.507 146.883 113.634 62.008 82.675 62.72 165.475 62.72 168.96 0 42.349-34.451 76.8-76.8 76.8zM486.4 665.6c-178.52 0-310.267 48.789-381 141.093-53.011 69.174-54.195 139.904-54.2 140.61 0 14.013 11.485 25.498 25.6 25.498h819.2c14.115 0 25.6-11.485 25.6-25.6-0.006-0.603-1.189-71.333-54.198-140.507-70.734-92.304-202.483-141.093-381.002-141.093z"></path></svg>
                        <span class="customer-links" >Đăng nhập</span>
                    </a>
                </c:if>
                <c:if test="${sessionScope['account']!=null}">
                    Hello ${sessionScope.account.username}<br/>
                    <a href="logout" class="header__icon header__icon--account link link--text" data-open-auth-sidebar="">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" class="icon icon-account" viewBox="0 0 1024 1024" width="100%" height="100%"><path class="path1" d="M486.4 563.2c-155.275 0-281.6-126.325-281.6-281.6s126.325-281.6 281.6-281.6 281.6 126.325 281.6 281.6-126.325 281.6-281.6 281.6zM486.4 51.2c-127.043 0-230.4 103.357-230.4 230.4s103.357 230.4 230.4 230.4c127.042 0 230.4-103.357 230.4-230.4s-103.358-230.4-230.4-230.4z"></path><path class="path2" d="M896 1024h-819.2c-42.347 0-76.8-34.451-76.8-76.8 0-3.485 0.712-86.285 62.72-168.96 36.094-48.126 85.514-86.36 146.883-113.634 74.957-33.314 168.085-50.206 276.797-50.206 108.71 0 201.838 16.893 276.797 50.206 61.37 27.275 110.789 65.507 146.883 113.634 62.008 82.675 62.72 165.475 62.72 168.96 0 42.349-34.451 76.8-76.8 76.8zM486.4 665.6c-178.52 0-310.267 48.789-381 141.093-53.011 69.174-54.195 139.904-54.2 140.61 0 14.013 11.485 25.498 25.6 25.498h819.2c14.115 0 25.6-11.485 25.6-25.6-0.006-0.603-1.189-71.333-54.198-140.507-70.734-92.304-202.483-141.093-381.002-141.093z"></path></svg>
                        <span class="customer-links" >Đăng xuất</span>
                    </a>

                </c:if>


                <a href="shoppingcart.jsp" class="header__icon header__icon--cart link link--text focus-inset" id="cart-icon-bubble" data-cart-sidebar="">
                    <svg viewBox="0 0 1024 1024" class="icon icon-cart" xmlns="http://www.w3.org/2000/svg">
                    <path class="path1" d="M409.6 1024c-56.464 0-102.4-45.936-102.4-102.4s45.936-102.4 102.4-102.4S512 865.136 512 921.6 466.064 1024 409.6 1024zm0-153.6c-28.232 0-51.2 22.968-51.2 51.2s22.968 51.2 51.2 51.2 51.2-22.968 51.2-51.2-22.968-51.2-51.2-51.2z"></path>
                    <path class="path2" d="M768 1024c-56.464 0-102.4-45.936-102.4-102.4S711.536 819.2 768 819.2s102.4 45.936 102.4 102.4S824.464 1024 768 1024zm0-153.6c-28.232 0-51.2 22.968-51.2 51.2s22.968 51.2 51.2 51.2 51.2-22.968 51.2-51.2-22.968-51.2-51.2-51.2z"></path>
                    <path class="path3" d="M898.021 228.688C885.162 213.507 865.763 204.8 844.8 204.8H217.954l-5.085-30.506C206.149 133.979 168.871 102.4 128 102.4H76.8c-14.138 0-25.6 11.462-25.6 25.6s11.462 25.6 25.6 25.6H128c15.722 0 31.781 13.603 34.366 29.112l85.566 513.395C254.65 736.421 291.929 768 332.799 768h512c14.139 0 25.6-11.461 25.6-25.6s-11.461-25.6-25.6-25.6h-512c-15.722 0-31.781-13.603-34.366-29.11l-12.63-75.784 510.206-44.366c39.69-3.451 75.907-36.938 82.458-76.234l34.366-206.194c3.448-20.677-1.952-41.243-14.813-56.424zm-35.69 48.006l-34.366 206.194c-2.699 16.186-20.043 32.221-36.39 33.645l-514.214 44.714-50.874-305.246h618.314c5.968 0 10.995 2.054 14.155 5.782 3.157 3.73 4.357 9.024 3.376 14.912z"></path>
                    </svg>
                    <span class="cart-text">Giỏ hàng</span>

                </a>
            </div> <!--Kết thúc header-top-->
            <nav>
                <ul class="menu "style="list-style: none">
                    <li><a href="Home">Trang chủ</a></li>
                    <li><a href="allproduct">Sản phẩm</a></li>
                    <li><a href="#">About Us</a></li>
                        <c:if test="${sessionScope['account'].getIsAdmin() == true}">
                        <li><a href="AllOrder">Quản lý Đơn hàng</a></li>
                        </c:if>
                        <c:if test="${sessionScope['account'].getIsAdmin() == false}">
                        <li><a href="MyOrder">Đơn hàng</a></li>
                        </c:if>
                        <c:if test="${sessionScope['account'].getIsAdmin() == true }">
                        <li><a href="ManageProduct">Quản lý sản phẩm</a></li>
                        </c:if> 
                        <c:if test="${sessionScope['account'].getIsAdmin() == true }">
                        <li><a href="statistics">Thống kê số liệu</a></li>
                        </c:if>   

                </ul>
            </nav>


        </header>

    </body>

    <script>
        function toggleAccountMenu() {
            var accountMenu = document.getElementById("accountMenu");
            if (accountMenu.style.display === "block") {
                accountMenu.style.display = "none";
            } else {
                accountMenu.style.display = "block";
            }
        }

        function toggleSearch() {
            var searchMenu = document.getElementById("searchMenu");
            if (searchMenu.style.display === "block") {
                searchMenu.style.display = "none";
            } else {
                searchMenu.style.display = "block";
            }
        }
    </script>
</html>
