<%@ page import="controllers.ControllersUrl" %>
<%@ page import="models.AdminModel" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="services.ServiceUrl" %><%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 05-Jun-24
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <marquee behavior="" direction="">
                Hệ thống sẽ được bảo trì từ <strong>[thời gian bắt đầu]</strong> đến <strong>[thời gian kết
                thúc]</strong> vào ngày <strong>[ngày]</strong>.
                Dịch vụ có thể tạm thời không khả dụng trong thời gian này. Chúng tôi xin lỗi về sự bất tiện này.
                </p>
            </marquee>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row d-flex align-items-center border-bottom mb-2">
        <div class="col-md-2">
            <img src="https://upload.wikimedia.org/wikipedia/commons/6/68/Logo_FPT_Education.png" alt="logo"
                 width="100%" height="auto">
        </div>
        <div class="col-md-7">
            <h3 class="text-center">Quản Trị Viên</h3>
        </div>
        <div class="col-md-3">
            <nav class="navbar navbar-expand-lg">
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success " type="submit">Search</button>
                </form>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="<%=ServiceUrl.DASHBOARD_JSP%>" class="list-group-item list-group-item-action active"
                   aria-current="true">
                    Quản Trị Viên
                </a>
                <a href="<%=ServiceUrl.MANAGE_STUDENTS%>" class="list-group-item list-group-item-action">Sinh Viên</a>
                <a href="<%=ServiceUrl.MANAGE_GROUPS%>" class="list-group-item list-group-item-action">Lớp Học</a>
            </div>
        </div>
        <div class="col-md-10">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th width="100px">
                        #
                    </th>
                    <th width="200px">
                        Mã Lớp
                    </th>
                    <th width="200px">
                        Tên Lớp
                    </th>
                    <th width="200px">
                        Số Lượng Sinh Viên
                    </th>
                </tr>
                <c:set var="i" value="1"/>
                <%
                    try {
                        ResultSet rs = new AdminModel().getDashBoard();
                        while (rs.next()) {
                %>
                </thead>
                <tbody>
                <td><%=rs.getInt("id")%>
                </td>
                <td>
                    <%=rs.getString("code")%>
                </td>
                <td>
                    <%=rs.getString("name")%>
                </td>
                <td>
                    <%=rs.getInt("number")%>
                </td>
                <c:set var="i" value="${i+1}"/>
                </tbody>
                <%
                        }
                    } catch (SQLException e) {
                        System.out.println("Loi o class manageStudents.jsp loi = " + e.getErrorCode());
                    }
                %>
            </table>
        </div>
    </div>
</div>
<!--Footer-->
<div class="container-fluid footer">
    <div class="row p-3 text-white">
        <div class="col-md-3">
            <h4 class="widget-title">HÀ NỘI</h4>
            <div class="text-widget">
                <p>Khu Giáo dục và Đào tạo – Khu Công nghệ cao Hòa Lạc – Km29 Đại lộ Thăng Long, H. Thạch Thất,
                    TP. Hà Nội</p>
                <p>Điện thoại: 024 7300 1866</p>
                <p>Email: daihocbonba@edu.vn</p>
            </div>
        </div>
        <div class="col-md-3">
            <h4 class="widget-title">TP. HỒ CHÍ MINH</h4>
            <div class="text-widget">
                <p>Lô E2a-7, Đường D1 Khu Công nghệ cao, P. Long Thạnh Mỹ, TP. Thủ Đức, TP. Hồ Chí Minh
                </p>
                <p>Điện thoại: 024 7300 1866</p>
                <p>Email: daihocbonba@edu.vn</p>
            </div>
        </div>
        <div class="col-md-3">
            <h4 class="widget-title">ĐÀ NẴNG</h4>
            <div class="text-widget">
                <p>Đà Nẵng, P. Hoà Hải, Q. Ngũ Hành Sơn, TP. Đà Nẵng</p>
                <p>Điện thoại: 024 7300 1866</p>
                <p>Email: daihocbonba@edu.vn</p>
            </div>
        </div>
        <div class="col-md-3">
            <h4 class="widget-title">CẦN THƠ</h4>
            <div class="text-widget">
                <p>Số 600 Đường Nguyễn Văn Cừ (nối dài), P. An Bình, Q. Ninh Kiều, TP. Cần Thơ</p>
                <p>Điện thoại: 024 7300 1866</p>
                <p>Email: daihocbonba@edu.vn</p>
            </div>
        </div>
    </div>
    <div>
        <div class="text-center p-1 text-white">
            <p>© 2024 Bản quyền thuộc về Trường Đại học FPT.</p>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>
</body>
</html>

