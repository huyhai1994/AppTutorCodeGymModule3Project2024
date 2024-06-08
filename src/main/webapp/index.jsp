<%@ page import="controllers.ControllersUrl" %><%--
  Created by IntelliJ IDEA.
  User: huyhai1994
  Date: 6/8/24
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style/style.css">
</head>
<body>
<!--Header-->
<!--Logo-->
<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <img src="https://upload.wikimedia.org/wikipedia/commons/6/68/Logo_FPT_Education.png" alt="logo" width="300"
                 height="auto">
        </div>
    </div>
</div>
<!--Thanh Menu-->
<div class="container-fluid sticky-top">
    <div class="row">
        <div class="main-menu col-md-12 sticky-top" id="main-menu">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav fw-bold ">
                            <li class="nav-item ">
                                <a class="nav-link text-white" href="#">Trang Chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="/About.html">Giới Thiệu</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="#">Chuyên Ngành</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="#">Hợp Tác</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="#">Liên Hệ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="#">Tin Tức</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="<%=ControllersUrl.LOGIN%>">Đăng Nhập</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!--Body-->
<div class="">
    <div id="carouselExample" class="carousel slide">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100"
                     src="https://daihoc.fpt.edu.vn/wp-content/uploads/2024/01/Bannerweb-schoolrank-bannerweb.png"
                     alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100"
                     src="https://daihoc.fpt.edu.vn/wp-content/uploads/2024/05/minigame-FPTU-bannerweb.png"
                     alt="Second slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100"
                     src="https://daihoc.fpt.edu.vn/wp-content/uploads/2024/05/minigame-FPTU-bannerweb.png"
                     alt="Third slide">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div class="row">
        <div class="col-md-12">
            <section class="bg-light py-3">
                <div class="container mt-3">
                    <p>Chính thức thành lập ngày 8/9/2006 theo Quyết định của Thủ tướng Chính phủ, Trường Đại học FPT
                        trở thành trường đại học đầu tiên của Việt Nam do một doanh nghiệp đứng ra thành lập với 100%
                        vốn đầu tư từ Tập đoàn FPT.

                        Sự khác biệt của Trường Đại học FPT so với các trường đại học khác là đào tạo theo hình thức
                        liên kết chặt chẽ với các doanh nghiệp, gắn đào tạo với thực tiễn, với nghiên cứu – triển khai
                        và các công nghệ hiện đại nhất. Triết lý và phương pháp giáo dục hiện đại; Đào tạo con người
                        toàn diện, hài hòa; Chương trình luôn được cập nhật và tuân thủ các chuẩn công nghệ quốc tế; Đặc
                        biệt chú trọng kỹ năng ngoại ngữ; Tăng cường đào tạo quy trình tổ chức sản xuất, kỹ năng làm
                        việc theo nhóm và các kỹ năng cá nhân khác là những điểm sẽ đảm bảo cho sinh viên tốt nghiệp có
                        những cơ hội việc làm tốt nhất sau khi ra trường.

                        Trường hiện đang đào tạo các nhóm ngành CNTT, Kinh tế, Ngôn ngữ, Mỹ thuật ứng dụng.

                        Tất cả sinh viên Đại học FPT đều phải trải qua 1 năm hoàn thiện tiếng Anh, để có thể theo học
                        chương trình chính khoá được đào tạo bằng tiếng Anh. Trong một năm đầu tiên học tiếng Anh, sinh
                        viên được gửi sang các trường đại học ở các nước nói tiếng Anh (trong vòng 2 tháng) để thật sự
                        lưu loát ngôn ngữ bắt buộc cho học tập và làm việc sau này.

                        Sau 5 học kỳ đầu tiên, với tiếng Anh và các kỹ năng cơ bản của ngành học, sinh viên được gửi vào
                        làm thực tập sinh trong các công ty thành viên của tập đoàn FPT trong vòng 4 đến 8 tháng. Tại
                        đây sinh viên được huấn luyện thực tế về nghề nghiệp tương lai, tham gia vào các dự án thật
                        (real project) và có thể được trả lương. Đó là giai đoạn On-the-Job-Training (OJT) đặc thù của
                        trường đại học FPT. Một số ngành như tiếng Nhật, Quản trị Khách sạn, sinh viên đi OJT tại Nhật
                        Bản, tại Malaysia,…
                        Tỉ lệ việc làm của trường cũng đạt được con số ấn tượng. 96% sinh viên Đại học FPT có việc làm
                        sau khi tốt nghiệp với mức lương bình quân khoảng 8,3 triệu đồng/người/tháng, 100% sinh viên có
                        cơ hội làm việc ở FPT sau khi tốt nghiệp; 19% cựu sinh viên làm việc tại nước ngoài (số liệu năm
                        2017).

                        Hãy cùng tìm hiểu điều gì góp phần tạo nên thành công và danh tiếng của chúng tôi.
                    <p>Chính thức thành lập ngày 8/9/2006 theo Quyết định của Thủ tướng Chính phủ, Trường Đại học FPT
                        trở thành trường đại học đầu tiên của Việt Nam do một doanh nghiệp đứng ra thành lập với 100%
                        vốn đầu tư từ Tập đoàn FPT.

                        Sự khác biệt của Trường Đại học FPT so với các trường đại học khác là đào tạo theo hình thức
                        liên kết chặt chẽ với các doanh nghiệp, gắn đào tạo với thực tiễn, với nghiên cứu – triển khai
                        và các công nghệ hiện đại nhất. Triết lý và phương pháp giáo dục hiện đại; Đào tạo con người
                        toàn diện, hài hòa; Chương trình luôn được cập nhật và tuân thủ các chuẩn công nghệ quốc tế; Đặc
                        biệt chú trọng kỹ năng ngoại ngữ; Tăng cường đào tạo quy trình tổ chức sản xuất, kỹ năng làm
                        việc theo nhóm và các kỹ năng cá nhân khác là những điểm sẽ đảm bảo cho sinh viên tốt nghiệp có
                        những cơ hội việc làm tốt nhất sau khi ra trường.

                        Trường hiện đang đào tạo các nhóm ngành CNTT, Kinh tế, Ngôn ngữ, Mỹ thuật ứng dụng.

                        Tất cả sinh viên Đại học FPT đều phải trải qua 1 năm hoàn thiện tiếng Anh, để có thể theo học
                        chương trình chính khoá được đào tạo bằng tiếng Anh. Trong một năm đầu tiên học tiếng Anh, sinh
                        viên được gửi sang các trường đại học ở các nước nói tiếng Anh (trong vòng 2 tháng) để thật sự
                        lưu loát ngôn ngữ bắt buộc cho học tập và làm việc sau này.

                        Sau 5 học kỳ đầu tiên, với tiếng Anh và các kỹ năng cơ bản của ngành học, sinh viên được gửi vào
                        làm thực tập sinh trong các công ty thành viên của tập đoàn FPT trong vòng 4 đến 8 tháng. Tại
                        đây sinh viên được huấn luyện thực tế về nghề nghiệp tương lai, tham gia vào các dự án thật
                        (real project) và có thể được trả lương. Đó là giai đoạn On-the-Job-Training (OJT) đặc thù của
                        trường đại học FPT. Một số ngành như tiếng Nhật, Quản trị Khách sạn, sinh viên đi OJT tại Nhật
                        Bản, tại Malaysia,…
                        Tỉ lệ việc làm của trường cũng đạt được con số ấn tượng. 96% sinh viên Đại học FPT có việc làm
                        sau khi tốt nghiệp với mức lương bình quân khoảng 8,3 triệu đồng/người/tháng, 100% sinh viên có
                        cơ hội làm việc ở FPT sau khi tốt nghiệp; 19% cựu sinh viên làm việc tại nước ngoài (số liệu năm
                        2017).

                        Hãy cùng tìm hiểu điều gì góp phần tạo nên thành công và danh tiếng của chúng tôi.</p>
                </div>
            </section>
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
