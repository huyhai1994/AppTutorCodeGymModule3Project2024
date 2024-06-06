<%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 05-Jun-24
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Manage Students</h1>
<form action="${pageContext.request.contextPath}/admin/manage-students" method="post">
    <input type="hidden" name="studentAction" value="add">
    <label for="studentName">Student Name:</label>
    <input type="text" id="studentName" name="studentName" required>
    <button type="submit">Add Student</button>
</form>
<!-- Similar forms for edit and delete actions can be added here -->
<a href="${pageContext.request.contextPath}/admin/dashboard">Back to Dashboard</a>
</form>
</body>
</html>
