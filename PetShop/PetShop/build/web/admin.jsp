<%-- 
    Document   : admin
    Created on : Oct 20, 2023, 11:11:42 PM
    Author     : ThuyVy
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>Pet Shop</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/jquery.selectBox.css" />
        <style>
            .edit-button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 5px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 2px;
                cursor: pointer;
            }

            /* CSS để tạo kiểu cho nút Xóa */
            .delete-button {
                background-color: #f44336;
                color: white;
                border: none;
                padding: 5px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 2px;
                cursor: pointer;
            }
            table {
    border: 1px solid black;
    width: 100%;
    border-collapse: collapse;
}

/* Định dạng dòng đầu tiên (tiêu đề) của bảng */
table th {
    border: 1px solid black;
    background-color: #f2f2f2; /* Màu nền xám nhạt */
    padding: 8px;
    text-align: left;
}

/* Định dạng các dòng dữ liệu */
table tr {
    border: 1px solid black;
}

/* Định dạng các ô dữ liệu */
table td {
    border: 1px solid black;
    padding: 8px;
}

/* Định dạng ảnh trong ô */
table td img {
    width: 5rem;
    height: auto;
}
        </style>
    </head>
    <body>
        <div class="header">
            <%@include file="header.jsp" %>
        </div>


        <div class="container" style=" width: 90vw; margin: 0px auto; padding: 20px 10px;">
            <center>
                <h1>Welcome, Admin!</h1>
                <h2>Quản lý sản phẩm</h2>
            </center>
            <h3 style="margin-bottom: 20px;">
                <a style="position: relative; color: royalblue; "  href="AddProduct">Thêm mới sản phẩm</a>
            </h3>
            <table style=" border: 1px solid black;">
                <tr style=" border: 1px solid black;">
                    <th style=" border: 1px solid black;">Product ID</th>
                    <th style=" border: 1px solid black;">Product Name</th>
                    <th style=" border: 1px solid black;">Image</th>
                    <th style=" border: 1px solid black;">Category</th>
                    <th style=" border: 1px solid black;">Price</th>
                    <th style=" border: 1px solid black;">Description</th>
                    <th style=" border: 1px solid black;">Action</th>
                </tr>
                <c:forEach var="o" items="${list}">
                    <tr style=" border: 1px solid black;" class="table_row">
                        <td style=" border: 1px solid black;" class="column-1">${o.getProductID()}</td>    
                        <td style=" border: 1px solid black;" class="column-2">${o.getName()}</td>
                        <td style=" border: 1px solid black;" class="column-3"><img src="${o.getImages()}" style="width: 5rem; height: rem;"/></td>
                        <td style=" border: 1px solid black;" class="column-4">${o.getCategories().getName()}</td>
                        <td style=" border: 1px solid black;" class="column-5">$ ${o.getPrice()}</td>
                        <td style=" border: 1px solid black;" class="column-6">
                            ${o.getDescription()}
                        </td>
                        <td>
                            <a href="UpdateProduct?pid=${o.getProductID()}" class="edit-button">Sửa</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="DeleteProduct?pid=${o.getProductID()}" class="delete-button" onclick="doDelete('${o.getProductID()}')">Xóa</a>
                        </td>

                    </tr>
                </c:forEach>

            </table>  
        </div>
        <div class="footer">
            <%@include file="footer.jsp" %>
        </div>
        <!-- Đoạn mã Java hoặc JSTL để lấy dữ liệu và hiển thị thống kê hoặc danh sách sản phẩm và đơn hàng ở đây -->

    </body>
    <script type="text/javascript">
        function doDelete(id) {
            if (confirm("Are you sure to delete productID = " + id)) {
                window.location = "delete?id=" + id;
            }
        }
    </script>
</html>

