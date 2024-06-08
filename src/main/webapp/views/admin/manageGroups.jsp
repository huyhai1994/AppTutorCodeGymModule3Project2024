<%@ page import="java.sql.ResultSet" %>
<%@ page import="models.AdminModel" %>
<%@ page import="databases.DBConnect" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="services.ServiceUrl" %><%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 05-Jun-24
  Time: 10:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
</head>
<html>
<head>
    <title>Title</title>
    <title>admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../../sty/style.css">
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
            <%//TODO: Thay doi lo go o day%>
        </div>
        <div class="col-md-7">
            <h3 class="text-center">Quản Lý Danh Sách Lớp Học</h3>
        </div>
        <div class="row col-md-3">
            <div class="container-fluid">
                <div class="row">
                    <nav class="navbar navbar-expand-lg">
                        <form action="#" class="d-flex" role="search" method="post">
                            <input class="form-control me-2 w-100" type="search" placeholder="Nhập Mã Sinh Viên"
                                   aria-label="Search">
                            <button class="btn btn-outline-success mx-2 " type="submit"><i
                                    class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                        <button type="button" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Thêm mới
                        </button>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="<%=ServiceUrl.DASHBOARD_JSP%>" class="list-group-item list-group-item-action"
                   aria-current="true">
                    Quản Trị Viên
                </a>
                <a href="<%=ServiceUrl.MANAGE_STUDENTS%>>" class="list-group-item list-group-item-action">Sinh Viên</a>
                <a href="<%=ServiceUrl.MANAGE_GROUPS%>" class="list-group-item list-group-item-action active">Lớp
                    Học</a>
            </div>
        </div>
        <div class="col-md-10">
            <table class="table table-bordered table-hover text-center">
                <thead>
                <tr>
                    <th>
                        #
                    </th>
                    <th>
                        Mã Lớp
                    </th>
                    <th>
                        Tên Lớp
                    </th>
                    <th>
                        Ngày Bắt Đầu
                    </th>
                    <th>
                        Ngày Kết Thúc
                    </th>
                    <th width="150px">
                        Thao Tác
                    </th>
                </tr>
                <%
                    // Lấy danh sách lớp từ cơ sở dữ liệu và hiển thị
                    try {
                        ResultSet rs = new AdminModel().getAllClasses();
                        while (rs.next()) {
                %>
                </thead>
                <tbody>
                <tr>
                    <td><%= rs.getInt("id") %>
                    </td>
                    <td><%= rs.getString("code") %>
                    </td>
                    <td><%= rs.getString("name") %>
                    </td>
                    <td><%= rs.getString("startday") %>
                    </td>
                    <td><%= rs.getString("endday") %>
                    </td>
                    <td>
                        <% //TODO: gan link vao 2 nut, the a%>
                        <button type="button" class="btn btn-success"><i class="fa-solid fa-user-pen"></i></button>
                        <button type="button" class="btn btn-danger"><i class="fa-solid fa-trash-can"></i></button>
                    </td>
                </tr>
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
<hr>
<!--Footer-->
<div class="container-fluid footer">
    <div class="row p-3 text-white">
        <div class="col-md-3">
            <h4 class="widget-title">HÀ NỘI</h4>
            <div class="text-widget">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam nulla provident quae sequi
                    temporibus! A, ad cum dolor ex ipsum iste laudantium modi quae. Aut dolor laborum necessitatibus non
                    quasi!</p>
                <p>Điện thoại: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi, natus optio?</p>
                <p>Email: daihocbonba@edu.vn</p>
            </div>
        </div>
        <div class="col-md-3">
            <h4 class="widget-title">TP. HỒ CHÍ MINH</h4>
            <div class="text-widget">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium blanditiis commodi deleniti est
                    et facilis iste libero minima modi non, obcaecati quas qui repellat saepe soluta, ullam vero?
                    Aspernatur, quae!
                </p>
                <p>Điện thoại: 9999999999 </p>
                <p>Email: daihocbonba@edu.vn</p>
            </div>
        </div>
        <div class="col-md-3">
            <h4 class="widget-title">ĐÀ NẴNG</h4>
            <div class="text-widget">
                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi aperiam assumenda blanditiis
                    delectus doloribus est fugiat fugit illo incidunt numquam obcaecati, praesentium quam repudiandae
                    sed sit tempora ullam unde vel?</p>
                <p>Điện thoại: 999999999</p>
                <p>Email: daihocbonba@edu.vn</p>
            </div>
        </div>
        <div class="col-md-3">
            <h4 class="widget-title">CẦN THƠ</h4>
            <div class="text-widget">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi distinctio dolorem ducimus enim eos,
                    et fugiat harum ipsum nemo nostrum officia optio quam quasi quisquam sunt totam velit? Aliquid,
                    cumque.</p>
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
