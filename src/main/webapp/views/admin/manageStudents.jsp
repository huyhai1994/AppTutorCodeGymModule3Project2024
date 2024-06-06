<%@ page import="java.sql.ResultSet" %>
<%@ page import="models.AdminModel" %>
<%@ page import="databases.DBConnect" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 05-Jun-24
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Manage Students</h1>
<form action="<%=request.getContextPath()%>/admin/manage-students" method="post">
    <input type="hidden" name="studentAction" value="add">
    <input type="text" name="name" placeholder="Name">
    <input type="text" name="code" placeholder="Code">
    <input type="password" name="password" placeholder="Password">
    <input type="text" name="gender" placeholder="Gender">
    <input type="date" name="birthofdate" placeholder="Birth Date">
    <input type="email" name="email" placeholder="Email">
    <input type="text" name="phone" placeholder="Phone">
    <input type="number" name="class_id" placeholder="Class ID">
    <button type="submit">Add Student</button>
</form>
<hr>
<h2>Existing Students</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Code</th>
        <th>Actions</th>
    </tr>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Code</th>
        <th>Actions</th>
    </tr>
    <%
        // Lấy danh sách sinh viên từ cơ sở dữ liệu và hiển thị
        try {
            ResultSet rs = new AdminModel(DBConnect.getConnection()).getAllStudents();
            while(rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("code") %></td>
        <td>
            <form action="<%=request.getContextPath()%>/admin/manage-students" method="post" style="display:inline;">
                <input type="hidden" name="studentAction" value="edit">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <button type="submit">Edit</button>
            </form>
            <form action="<%=request.getContextPath()%>/admin/manage-students" method="post" style="display:inline;">
                <input type="hidden" name="studentAction" value="delete">
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
