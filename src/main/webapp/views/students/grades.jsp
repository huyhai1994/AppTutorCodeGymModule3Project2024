<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 06-Jun-24
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Grades</h2>
<table border="1">
    <tr>
        <th>Course</th>
        <th>Grade</th>
    </tr>
    <c:forEach var="grade" items="${grades}">
    <tr>
        <td>${grade.course}</td>
        <td>${grade.grade}</td>
    </tr>
    </c:forEach>
</body>
</html>
