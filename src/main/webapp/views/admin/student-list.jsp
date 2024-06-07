
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 06-Jun-24
  Time: 12:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/students" method="POST">
    <input type="text" name="name" placeholder="Name" />
    <!-- Các trường khác -->
    <button type="submit">Add Student</button>
</form>
</body>
</html>
