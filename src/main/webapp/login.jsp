<%@ page import="controllers.ControllersUrl" %><%--
  Created by IntelliJ IDEA.
  User: huyhai1994
  Date: 6/8/24
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
<div class="container sm-12 md-5  align-items-center">
    <div class=" row my-5"></div>
    <div class=" row  my-5 justify-content-center">
        <div class="col-5 justify-content-center">
            <div class="card shadow-lg">
                <div class="card-body mx-3">
                    <div class="container  align-items-center">
                        <div class="row ">
                            <div class="col">

                            </div>
                            <div class="col">
                                <div class="card-title">
                                    <h1 class=" "><i class="fa-regular fa-user"></i></h1>
                                </div>
                            </div>
                            <div class="col">
                            </div>
                        </div>
                    </div>


                    <div class="card-body align-items-center">
                        <div class="form-login">
                            <form action="<%=ControllersUrl.LOGIN%>" method="post">
                                <div class="mb-3">
                                    <label for="usercode" class="form-label"> Mã Sinh Viên/ Quản trị viên</label>
                                    <input type="text" name="username" class="form-control" id="usercode"
                                           aria-describedby="loginHelp" placeholder="VD: SV111111">
                                    <div id="loginHelp" class="form-text"> Bạn cần nhập mã sinh viên hoặc quản trị viên
                                        do trung tâm cung cấp.
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Mật khẩu</label>
                                    <input type="password" name="password" class="form-control"
                                           id="exampleInputPassword1">
                                </div>
                                <div class="row">
                                    <div class="col">

                                    </div>
                                    <div class="col-5">
                                        <button type="submit" class="w-100 btn btn-lg btn-primary">Đăng Nhập</button>
                                    </div>
                                    <div class="col"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>
