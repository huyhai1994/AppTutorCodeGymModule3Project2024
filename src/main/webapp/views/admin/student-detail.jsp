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
<form action="students" method="POST">
    <input type="hidden" name="_method" value="PUT" />
    <input type="hidden" name="id" value="${student.id}" />
    <input type="text" name="name" value="${student.name}" />
    <!-- Các trường khác -->
    <button type="submit">Update Student</button>
</form>

<form action="students" method="POST">
    <input type="hidden" name="_method" value="DELETE" />
    <input type="hidden" name="id" value="${student.id}" />
    <button type="submit">Delete Student</button>
</form>
</body>
</html>
