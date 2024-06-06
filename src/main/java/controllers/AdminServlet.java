package controllers;

import databases.DBConnect;
import entity.Group;
import entity.Student;
import models.AdminModel;
import services.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;

@WebServlet(name = "AdminServlet", urlPatterns = "/admin/*")
public class AdminServlet extends HttpServlet {
    private AdminService adminService = new AdminService();
    public void init() {
        DBConnect dbConnect = new DBConnect();
        Connection connection = dbConnect.getConnection();
        this.adminService = new AdminService(new AdminModel(connection));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        request.setCharacterEncoding("utf-8");
        if (action.equals("/dashboard")) {
            request.getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);
        } else if (action.equals("/manage-students")) {
            request.getRequestDispatcher("/views/admin/manageStudents.jsp").forward(request, response);
        } else if (action.equals("/manage-classes")) {
            request.getRequestDispatcher("/views/admin/manageClasses.jsp").forward(request, response);
        } else if (action.equals("/edit-student")) {
            request.setAttribute("action", "edit");
            request.setAttribute("entityType", "student");
            request.getRequestDispatcher("/views/admin/edit.jsp").forward(request, response);
        } else if (action.equals("/edit-group")) {
            request.setAttribute("action", "edit");
            request.setAttribute("entityType", "group");
            request.getRequestDispatcher("/views/admin/edit.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        request.setCharacterEncoding("utf-8");
        if (action.equals("/manage-students")) {
            String studentAction = request.getParameter("studentAction");
            if (studentAction != null) {
                switch (studentAction) {
                    case "add":
                        addStudent(request, response);
                        break;
                    case "edit":
                        System.out.println("Here edit");
                        editStudent(request, response);
                        break;
                    case "delete":
                        deleteStudent(request, response);
                        break;
                }
            }
            response.sendRedirect(request.getContextPath() + "/admin/manage-students");
        } else if (action.equals("/manage-classes")) {
            String classAction = request.getParameter("classAction");
            if (classAction != null) {
                switch (classAction) {
                    case "add":
                        addGroup(request, response);
                        break;
                    case "edit":
                        editGroup(request, response);
                        break;
                    case "delete":
                        deleteClass(request, response);
                        break;
                }
            }
            response.sendRedirect(request.getContextPath() + "/admin/manage-classes");
        }
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String birthOfDate = request.getParameter("birthofdate");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int classId = Integer.parseInt(request.getParameter("class_id"));

        Student student = new Student();
        student.setName(name);
        student.setCode(code);
        student.setPassword(password);
        student.setGender(gender);
        student.setBirthOfDate(Date.valueOf(birthOfDate));
        student.setEmail(email);
        student.setPhone(phone);
        student.setClassId(classId);

        adminService.addStudent(student);
    }

    private void editStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String birthOfDate = request.getParameter("birthofdate");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int classId = Integer.parseInt(request.getParameter("class_id"));

        Student student = new Student();
        student.setId(id);
        student.setName(name);
        student.setCode(code);
        student.setPassword(password);
        student.setGender(gender);
        student.setBirthOfDate(Date.valueOf(birthOfDate));
        student.setEmail(email);
        student.setPhone(phone);
        student.setClassId(classId);

        adminService.editStudent(student);
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        adminService.deleteStudent(id);
    }

    private void addGroup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String startDay = request.getParameter("startday");
        String endDay = request.getParameter("endday");
        int adminId = Integer.parseInt(request.getParameter("admin_id"));

        Group classObj = new Group();
        classObj.setCode(code);
        classObj.setName(name);
        classObj.setStartDay(String.valueOf(startDay));
        classObj.setEndDay(String.valueOf(endDay));
        classObj.setAdminId(adminId);

        adminService.addGroup(classObj);
    }

    private void editGroup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String startDay = request.getParameter("startday");
        String endDay = request.getParameter("endday");
        int adminId = Integer.parseInt(request.getParameter("admin_id"));

        Group classObj = new Group();
        classObj.setId(id);
        classObj.setCode(code);
        classObj.setName(name);
        classObj.setStartDay(String.valueOf(startDay));
        classObj.setEndDay(String.valueOf(endDay));
        classObj.setAdminId(adminId);

        adminService.editGroup(classObj);
    }

    private void deleteClass(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        adminService.deleteGroup(id);
    }
}
