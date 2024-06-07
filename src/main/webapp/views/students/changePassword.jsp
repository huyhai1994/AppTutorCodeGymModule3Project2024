<%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 06-Jun-24
  Time: 10:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
</head>
<body>
<h1>Change Password</h1>
<c:if test="${not empty message}">
    <p>${message}</p>
</c:if>
<form action="${pageContext.request.contextPath}/student/change-password" method="post">
    <label for="currentPassword">Current Password:</label>
    <input type="password" id="currentPassword" name="currentPassword" required><br>

    <label for="newPassword">New Password:</label>
    <input type="password" id="newPassword" name="newPassword" required><br>

    <button type="submit">Change Password</button>
</form>
</body>
</html>
