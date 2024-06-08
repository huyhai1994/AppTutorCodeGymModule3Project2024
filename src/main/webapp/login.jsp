<%@ page import="controllers.ControllersUrl" %><%--
  Created by IntelliJ IDEA.
  User: huyhai1994
  Date: 6/8/24
  Time: 8:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<marquee behavior="" direction="">
    <p>Chào mừng bạn đến với trang quản lý của chúng tôi!</p>
</marquee>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="form-login">
                <form action="<%=ControllersUrl.LOGIN%>">
                    <h1 class="h3 mb-3 fw-normal text-center">Please sign in</h1>
                    <div class="form-floating">
                        <input type="text" name="username" class="form-control" id="floatingInput"
                               placeholder="UserName">
                        <label for="floatingInput">User Name</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" name="password" class=form-control" id="floatingPassword" placeholder="Password">
                        <label for="floatingPassword">Password</label>
                    </div>
                    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
                    <p class="mt-5 mb-3 text-muted text-center">&copy; 2017–2021</p>
                </form>
            </div>
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
