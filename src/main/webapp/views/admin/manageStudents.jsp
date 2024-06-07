<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="controllers.ControllersUrl" %>
<%@ page import="models.AdminModel" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 07-Jun-24
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html lang="en">

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
    <div class="row d-flex align-items-center border-bottom mb-2" id="menu-admin">
        <div class="col-md-2">
            <img src="https://upload.wikimedia.org/wikipedia/commons/6/68/Logo_FPT_Education.png" alt="logo"
                 width="100%" height="auto">
        </div>
        <div class="col-md-7">
            <h3 class="text-center">Quản Lý Danh Sách Sinh Viên</h3>
        </div>
        <div class="col-md-3">
            <div class="row">
                <nav class="navbar navbar-expand-lg">
                    <form action="#" class="d-flex" role="search" method="post">
                        <input class="form-control me-2 w-100" type="search" placeholder="Nhập Mã Lớp"
                               aria-label="Search">
                        <button class="btn btn-outline-success mx-2 " type="submit"><i
                                class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                    <!--Button Add-->
                    <div>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal">
                            <i class="fa-solid fa-user-plus"></i> Thêm mới
                        </button>
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Nhập Thông Tin Sinh Viên
                                            Mới</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="fullName" class="form-label">Họ Và Tên</label>
                                            <input class="form-control" id="fullName" placeholder="Ví dụ: Nguyen Van A">
                                        </div>
                                        <div class="mb-3">
                                            <label for="codeStudent" class="form-label">Mã Sinh Viên</label>
                                            <input class="form-control" id="codeStudent" placeholder="Ví dụ: SV868686">
                                        </div>
                                        <div class="mb-3">
                                            <fieldset data-role="controlgroup">
                                                <div class="row col-md-12">
                                                    <div class="col-md-3"><p>Giới Tính: </p></div>
                                                    <div class="col-md-3">
                                                        <label for="male">Nam</label>
                                                        <input type="radio" name="gender" id="male" value="male"
                                                               checked></div>
                                                    <div class="col-md-3">
                                                        <label for="female">Nữ</label>
                                                        <input type="radio" name="gender" id="female" value="female">
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                        <div class="mb-3">
                                            <div class="row col-md-12">
                                                <div class="col-md-6">
                                                    <label for="dateOfBirth" class="form-label">Ngày Tháng Năm
                                                        Sinh </label>
                                                </div>
                                                <div class="col-md-6">
                                                    <input class="form-control" type="date" name="bdaytime"
                                                           id="dateOfBirth" placeholder="Chọn Ngày Tháng Năm Sinh">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label>Email</label>
                                            <input type="email" class="form-control"
                                                   placeholder="Ví dụ: nguyenvana@gmail.com">
                                        </div>
                                        <div class="mb-3">
                                            <label>Số Điện Thoại</label>
                                            <input class="form-control" placeholder="Ví dụ: 0988-xxx-yyy">
                                        </div>
                                        <div class="mb-3">
                                            <div class="row col-md-12">
                                                <div class="col-md-6">
                                                    <label for="classRoom">Mã Lớp</label>
                                                    <input class="form-control" type="text" id="classRoom"
                                                           placeholder="Ví dụ: MT-1111">
                                                </div>
                                                <div class="col-md-6">
                                                    <label for="nameClass">Tên Lớp</label>
                                                    <input class="form-control" type="text" id="nameClass"
                                                           placeholder="Ví dụ: A-2024">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ
                                        </button>
                                        <button type="button" class="btn btn-primary">Lưu</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Button Add-->
                </nav>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="<%=ControllersUrl.ADMIN_DASHBOARD%>" class="list-group-item list-group-item-action"
                   aria-current="true">
                    Quản Trị Viên
                </a>
                <a href="<%=ControllersUrl.MANAGE_STUDENTS%>" class="list-group-item list-group-item-action active">Sinh
                    Viên</a>
                <a href="<%=ControllersUrl.MANAGE_GROUPS%>" class="list-group-item list-group-item-action">Lớp Học</a>
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
                        Họ Và Tên
                    </th>
                    <th>
                        Mã SV
                    </th>
                    <th>
                        Giới Tính
                    </th>
                    <th>
                        Ngày Tháng Năm Sinh
                    </th>
                    <th>
                        Email
                    </th>
                    <th>
                        SĐT
                    </th>
                    <th>
                        Mã Lớp
                    </th>
                    <th>
                        Tên Lớp
                    </th>
                    <th width="150px">
                        Thao Tác
                    </th>
                </tr>
                <c:set var="i" value="1"/>
                <%
                    // Lấy danh sách sinh viên từ cơ sở dữ liệu và hiển thị
                    try {
                        ResultSet rs = null;
                        try {
                            rs = new AdminModel().getAllStudents();
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        while (rs.next()) {
                %>
                </thead>
                <tbody>
                <tr>
                    <td><c:out value="${i}"/>
                    </td>
                    <td><%= rs.getString("namestudent")%>
                    </td>
                    <td><%=rs.getString("codestudent")%>
                    </td>
                    <td><%=rs.getString("gender")%>
                    </td>
                    <td>
                        <%=rs.getString("birthofdate")%>
                    </td>
                    <td><%=rs.getString("email")%>
                    </td>
                    <td><%=rs.getString("phone")%>
                    </td>
                    <td><%=rs.getString("codeclass")%>
                    </td>
                    <td><%=rs.getString("nameclass")%>
                    </td>
                    <td>
                        <button type="button" class="btn btn-success"><i class="fa-solid fa-user-pen"></i></button>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop">
                            <i class="fa-solid fa-trash-can"></i>
                        </button>
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                             tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5 text-danger" id="staticBackdropLabel">CẢNH BÁO: Xoá
                                            Dữ Liệu Sinh Viên!!!</h1>
                                        <butrningn type="button" class="btn-close" data-bs-dismiss="modal"
                                                   aria-label="Close"></butrningn>
                                    </div>
                                    <div class="modal-body text-warning">
                                        <p>Bạn có chắc chắn muốn xóa dữ liệu sinh viên này không? Hành động này không
                                            thể hoàn tác và tất cả thông tin liên quan sẽ bị mất vĩnh viễn.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ Bỏ
                                        </button>
                                        <button type="button" class="btn btn-danger">Xác Nhận</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
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
