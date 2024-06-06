<%@ page import="services.AdminService" %>
<%@ page import="models.AdminModel" %>
<%@ page import="entity.Student" %>
<%@ page import="entity.Group" %><%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 06-Jun-24
  Time: 5:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String action = request.getParameter("action");
  String entityType = request.getParameter("entityType");
  AdminService adminService = new AdminService(new AdminModel(new databases.DBConnect().getConnection()));

  if (entityType.equals("student")) {
    int id = Integer.parseInt(request.getParameter("id"));
    Student student = adminService.getStudentById(id);
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit Student</h1>
<form action="${pageContext.request.contextPath}/admin/manage-students" method="post">
  <input type="hidden" name="studentAction" value="edit">
  <input type="hidden" name="id" value="<%= student.getId() %>">

  <label for="name">Name:</label>
  <input type="text" id="name" name="name" value="<%= student.getName() %>" required>

  <label for="code">Code:</label>
  <input type="text" id="code" name="code" value="<%= student.getCode() %>" required>

  <label for="password">Password:</label>
  <input type="password" id="password" name="password" value="<%= student.getPassword() %>" required>

  <label for="gender">Gender:</label>
  <input type="text" id="gender" name="gender" value="<%= student.getGender() %>" required>

  <label for="birthofdate">Birthdate:</label>
  <input type="date" id="birthofdate" name="birthofdate" value="<%= student.getBirthOfDate() %>" required>

  <label for="email">Email:</label>
  <input type="email" id="email" name="email" value="<%= student.getEmail() %>" required>

  <label for="phone">Phone:</label>
  <input type="text" id="phone" name="phone" value="<%= student.getPhone() %>" required>

  <label for="class_id">Class ID:</label>
  <input type="text" id="class_id" name="class_id" value="<%= student.getClassId() %>" required>

  <button type="submit">Save Changes</button>
</form>
<a href="${pageContext.request.contextPath}/admin/manage-students">Back to Manage Students</a>
</body>
</html>

<%
} else if (entityType.equals("group")) {
  int id = Integer.parseInt(request.getParameter("id"));
  Group group = adminService.getGroupById(id);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Group</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h1>Edit Group</h1>
<form action="${pageContext.request.contextPath}/admin/manage-classes" method="post">
  <input type="hidden" name="classAction" value="edit">
  <input type="hidden" name="id" value="<%= group.getId() %>">

  <label for="code">Code:</label>
  <input type="text" id="code" name="code" value="<%= group.getCode() %>" required>

  <label for="name">Name:</label>
  <input type="text" id="name" name="name" value="<%= group.getName() %>" required>

  <label for="startday">Start Day:</label>
  <input type="date" id="startday" name="startday" value="<%= group.getStartDay() %>" required>

  <label for="endday">End Day:</label>
  <input type="date" id="endday" name="endday" value="<%= group.getEndDay() %>" required>

  <label for="admin_id">Admin ID:</label>
  <input type="text" id="admin_id" name="admin_id" value="<%= group.getAdminId() %>" required>

  <button type="submit">Save Changes</button>
</form>
<a href="${pageContext.request.contextPath}/admin/manage-classes">Back to Manage Classes</a>
</body>
</html>

<%
  }
%>