<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 5/30/2024
  Time: 8:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body >
<div class="container center-pill col-md-3">
    <div class="card shadow">
        <div class="card-body">
            <div class="mb-3">
                <h1 class="py-3 text-center">Đăng nhập</h1>
            </div>
            <div>
                <form action="/auth/login" method="post">
                    <div class="mb-3 ">
                        <input autofocus type="text" name="username" placeholder="username" class="form-control">
                    </div>
                    <div class="mb-3">
                        <input type="text" name="password" placeholder="password" class="form-control" >
                    </div>
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>