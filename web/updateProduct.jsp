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
 <style>/* Định dạng ô nhập để làm cho chúng to hơn */
input[type="text"],
input[type="number"],
input[type="url"],
select {
    width: 200%; /* Đặt chiều rộng của các ô nhập và select thành 100% */
    padding: 5px; /* Tăng khoảng cách bên trong ô nhập */
    box-sizing: border-box; /* Đảm bảo rằng padding không làm tăng kích thước ngoài cùng của ô nhập */
}
</style>
    </head>
    <body>
        <div class="header">
            <%@include file="header.jsp" %>
        </div>
        <div style="margin-bottom: 50px" class="container">
            <center>
                <h1>Welcome, Admin!</h1>
                <h2>Thêm mới sản phẩm</h2>
            </center>
            <h4 style="margin: 20px;"><a href="Home">Quay lại trang chủ</a></h4>

            <center>
                <form action="UpdateProduct" method="POST">

                    <table border="0"   >
                        <tbody>
                            <tr>
                                <td> <h3 style="margin: 5px 0px;">Product Name  </h3></td>
                                <td><input type="text" name="name" value="${p.getName()}" required=""></td>
                            </tr>
                            <tr>
                                <td ><h3 style="margin: 5px 0px;">Category</h3></td>
                                <td>
                                    <input value="${p.getProductID()}" hidden="" name="id">
                                    <select name="category">
                                        <c:forEach var="o" items="${listC}">
                                            <option value="${o.getCategoryId()}">${o.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><h3 style="margin: 5px 0px;">Image  </h3></td>
                                <td><input type="url" name="image" value="${p.getImages()}" required=""></td>
                            </tr>
                            <tr>
                                <td><h3 style="margin: 5px 0px;">Price   </h3></td>
                                <td>     <input type="number" name="price" value="${p.getPrice()}" required=""> </td>
                            </tr>
                            <tr>
                                <td><h3 style="margin: 5px 0px;">Description  </h3></td>
                                <td><input type="text" name="description" value="${p.getDescription()}"required=""></td>
                            </tr>
                        </tbody>
                    </table>
                    <input style="margin: 5px 0px;" type="submit" value="Lưu">

                </form>
            </center>
        </div>
        <div class="footer">
            <%@include file="footer.jsp" %>
        </div>
        <!-- Đoạn mã Java hoặc JSTL để lấy dữ liệu và hiển thị thống kê hoặc danh sách sản phẩm và đơn hàng ở đây -->

    </body>
    
</html>

