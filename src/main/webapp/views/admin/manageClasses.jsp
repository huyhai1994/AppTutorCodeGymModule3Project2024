<%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 05-Jun-24
  Time: 10:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Manage Classes</h1>
<form action="${pageContext.request.contextPath}/admin/manage-classes" method="post">
    <input type="hidden" name="classAction" value="add">
    <label for="className">Class Name:</label>
    <input type="text" id="className" name="className" required>
    <button type="submit">Add Class</button>
</form>
<!-- Similar forms for edit and delete actions can be added here -->
<a href="${pageContext.request.contextPath}/admin/dashboard">Back to Dashboard</a>
</body>
</html>
