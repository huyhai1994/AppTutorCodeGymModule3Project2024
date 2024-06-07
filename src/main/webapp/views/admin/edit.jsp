<%@ page import="entity.Student" %>
<%@ page import="entity.Group" %><%--
  Created by IntelliJ IDEA.
  User: Ha Duy Nam
  Date: 06-Jun-24
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
</head>
<body>
<%
    String action = (String) request.getAttribute("action");
    String entityType = (String) request.getAttribute("entityType");
%>

<% if ("student".equals(entityType)) {
    Student student = (Student) request.getAttribute("student");
%>
<h2><%= "Add".equals(action) ? "Add" : "Edit" %> Student</h2>
<form action="<%= request.getContextPath() %>/admin/manage-students" method="post">
    <input type="hidden" name="studentAction" value="<%= action %>"/>
    <% if (!"add".equals(action)) { %>
    <input type="hidden" name="id" value="<%= student.getId() %>"/>
    <% } %>
    Name: <input type="text" name="name" value="<%= student != null ? student.getName() : "" %>"/><br/>
    Code: <input type="text" name="code" value="<%= student != null ? student.getCode() : "" %>"/><br/>
    Password: <input type="password" name="password" value="<%= student != null ? student.getPassword() : "" %>"/><br/>
    Gender: <input type="text" name="gender" value="<%= student != null ? student.getGender() : "" %>"/><br/>
    Birth Date: <input type="date" name="birthofdate"
                       value="<%= student != null ? student.getBirthOfDate() : "" %>"/><br/>
    Email: <input type="email" name="email" value="<%= student != null ? student.getEmail() : "" %>"/><br/>
    Phone: <input type="text" name="phone" value="<%= student != null ? student.getPhone() : "" %>"/><br/>
    Class ID: <input type="number" name="class_id" value="<%= student != null ? student.getClassId() : "" %>"/><br/>
    <input type="submit" value="Save"/>
</form>
<% } else if ("group".equals(entityType)) {
    Group group = (Group) request.getAttribute("group");
%>
<h2><%= "Add".equals(action) ? "Add" : "Edit" %> Group</h2>
<form action="<%= request.getContextPath() %>/admin/manage-groups" method="post">
    <input type="hidden" name="classAction" value="<%= action %>"/>
    <% if (!"add".equals(action)) { %>
    <input type="hidden" name="id" value="<%= group.getId() %>"/>
    <% } %>
    Code: <input type="text" name="code" value="<%= group != null ? group.getCode() : "" %>"/><br/>
    Name: <input type="text" name="name" value="<%= group != null ? group.getName() : "" %>"/><br/>
    Start Day: <input type="date" name="startday" value="<%= group != null ? group.getStartDay() : "" %>"/><br/>
    End Day: <input type="date" name="endday" value="<%= group != null ? group.getEndDay() : "" %>"/><br/>
    Admin ID: <input type="number" name="admin_id" value="<%= group != null ? group.getAdminId() : "" %>"/><br/>
    <input type="submit" value="Save"/>
</form>
<% } %>
</body>
</html>
