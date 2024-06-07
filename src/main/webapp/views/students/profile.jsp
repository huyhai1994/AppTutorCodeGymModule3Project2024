<%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 06-Jun-24
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Profile</title>
</head>
<body>
<h1>Student Profile</h1>
<table>
    <tr>
        <th>Name:</th>
        <td>${student.name}</td>
    </tr>
    <tr>
        <th>Email:</th>
        <td>${student.email}</td>
    </tr>
    <tr>
        <th>Code:</th>
        <td>${student.code}</td>
    </tr>
    <tr>
        <th>Birth Date:</th>
        <td>${student.birthOfDate}</td>
    </tr>
    <tr>
        <th>Gender:</th>
        <td>${student.gender}</td>
    </tr>
    <tr>
        <th>Phone:</th>
        <td>${student.phone}</td>
    </tr>
    <tr>
        <th>Class ID:</th>
        <td>${student.classId}</td>
    </tr>
</table>
<a href="${pageContext.request.contextPath}/student/change-password">Change Password</a>
</body>
</html>
