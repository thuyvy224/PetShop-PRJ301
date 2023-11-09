<%-- 
    Document   : statistics
    Created on : Nov 4, 2023, 12:11:24 AM
    Author     : ThuyVy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/jquery.selectBox.css" />
        <title>JSP Page</title>
        <style>
    .product-list {
        background-color: #fff;
        padding: 20px;
    }

    .product-list::after {
        content: "";
        display: table;
        clear: both;
    }

    canvas {
        max-width: 500px; /* Set the maximum width for the chart */
        max-height: 400px; /* Set the maximum height for the chart */
    }
</style>

    </head>
    <body>
        <div class="header">
            <%@include file="header.jsp" %>
        </div>
        <div class="product-list clearfix">			
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <aside class="styled_header  use_icon ">
                        <h3>SỐ LƯỢNG ĐƠN HÀNG BÁN ĐƯỢC THEO THÁNG NĂM 2023</h3>
                        <span class="icon" id="chartToggle"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoIWOPW5jv5Xj2vPzqaE3XzyAoPnUYYszH3B2z5fgm&s" alt=""></span>
                    </aside>
                </div>
                
            </div>
            <div>
                <canvas id="myChart" style="display: none;"></canvas>
            </div>
            <c:set var="c" value="${data}"/>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                const ctx = document.getElementById('myChart');
                new Chart(ctx,
                        {
                            type: 'bar',
                            data: {
                                labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
                                datasets: [{
                                        label: 'Số lượng',
                                        data: [${c[0]},${c[1]},${c[2]},${c[3]},${c[4]},${c[5]},${c[6]},${c[7]},${c[8]},${c[9]},${c[10]},${c[11]}],
                                        borderWidth: 1
                                    }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });
            </script>
            <script>
                const canvas = document.getElementById('myChart');
                const chartToggle = document.getElementById('chartToggle');
                let chartVisible = false;
                chartToggle.addEventListener('click', function () {
                    if (chartVisible) {
                        // Nếu biểu đồ đang hiển thị, ẩn nó
                        canvas.style.display = 'none';
                        chartVisible = false;
                    } else {
                        // Nếu biểu đồ đang ẩn, hiện nó
                        canvas.style.display = 'block';
                        chartVisible = true;
                    }
                });
            </script>
            <div style="padding: 81px 0 ">
                    <h3> DANH SÁCH THÔNG TIN NGƯỜI DÙNG </h3>
                    <button><a href="excel">Xuất excel</a></button>
                    ${mess}
                </div>
        </div>
    </div>
    <div class="footer">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>
