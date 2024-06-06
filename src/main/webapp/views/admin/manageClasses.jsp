<%@ page import="java.sql.ResultSet" %>
<%@ page import="models.AdminModel" %>
<%@ page import="databases.DBConnect" %>
<%@ page import="java.sql.SQLException" %><%--
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
<form action="<%=request.getContextPath()%>/admin/manage-classes" method="post">
    <input type="hidden" name="classAction" value="add">
    <input type="text" name="code" placeholder="Class Code">
    <input type="text" name="name" placeholder="Class Name">
    <input type="date" name="startday" placeholder="Start Day">
    <input type="date" name="endday" placeholder="End Day">
    <input type="number" name="admin_id" placeholder="Admin ID">
    <button type="submit">Add Class</button>
</form>
<hr>
<h2>Existing Classes</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Code</th>
        <th>Name</th>
        <th>Actions</th>
    </tr>
    <%
        // Lấy danh sách lớp từ cơ sở dữ liệu và hiển thị
        try {
            ResultSet rs = new AdminModel(DBConnect.getConnection()).getAllClasses();
            while(rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("code") %></td>
        <td><%= rs.getString("name") %></td>
        <td>
            <form action="<%=request.getContextPath()%>/admin/manage-classes" method="post" style="display:inline;">
                <input type="hidden" name="classAction" value="edit">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <button type="submit">Edit</button>
            </form>
            <form action="<%=request.getContextPath()%>/admin/manage-classes" method="post" style="display:inline;">
                <input type="hidden" name="classAction" value="delete">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <button type="submit">Delete</button>
            </form>
        </td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</table>
<a href="${pageContext.request.contextPath}/admin/dashboard">Back to Dashboard</a>
</body>
</html>