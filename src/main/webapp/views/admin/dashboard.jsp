<%@ page import="controllers.ControllersUrl" %><%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 05-Jun-24
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Admin Dashboard</h1>
<nav>
    <ul>
        <li><a href= <%= ControllersUrl.MANAGE_STUDENTS%>> Manage Students</a></li>
        <li><a href= <%= ControllersUrl.MANAGE_GROUPS%>> Manage Classes</a></li>
    </ul>
</nav>
<p>Welcome to the admin dashboard!</p>
</body>
</html>
