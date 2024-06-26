package controllers;

import entity.Group;
import entity.Student;
import services.AdminService;
import services.ServiceUrl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "AdminServlet", urlPatterns = "/admin/*")
public class AdminServlet extends HttpServlet {
    public static final String DASHBOARD = "/dashboard";
    public static final String MANAGE_STUDENTS = "/manage-students";
    public static final String MANAGE_GROUPS = "/manage-groups";
    public static final String UTF_8 = "utf-8";
    private AdminService adminService;

    public void init() {
        this.adminService = new AdminService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        request.setCharacterEncoding(UTF_8);

        switch (action) {
            case DASHBOARD:
                request.getRequestDispatcher(ServiceUrl.DASHBOARD_JSP).forward(request, response);
                break;
            case MANAGE_STUDENTS:
                try {
                    this.adminService.renderPageManageStudents(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case MANAGE_GROUPS:
                this.adminService.renderPageManageGroups(request, response);
                break;
            case "/edit-student":
                //TODO: Vao Trang Sua  Hoc Sinh (no ok)
                int studentId = Integer.parseInt(request.getParameter("id"));
                Student student = adminService.getStudentById(studentId);
                request.setAttribute("student", student);
                request.setAttribute("action", "edit");
                request.setAttribute("entityType", "student");
                request.getRequestDispatcher("/views/admin/edit.jsp").forward(request, response);
                break;
            case "/edit-group":
                //TODO: Vao Trang sua Lop Hoc (no ok)
                int groupId = Integer.parseInt(request.getParameter("id"));
                Group group = adminService.getGroupById(groupId);
                request.setAttribute("group", group);
                request.setAttribute("action", "edit");
                request.setAttribute("entityType", "group");
                request.getRequestDispatcher("/views/admin/edit.jsp").forward(request, response);
                break;
            case "/add-student":
                //TODO: Vao Trang Them Hoc Sinh (no ok)
                request.setAttribute("action", "add");
                request.setAttribute("entityType", "student");
                request.getRequestDispatcher("/views/admin/edit.jsp").forward(request, response);
                break;
            case "/add-group":
                //TODO: Vao Trang Them Lop Hoc (no ok)
                request.setAttribute("action", "add");
                request.setAttribute("entityType", "group");
                request.getRequestDispatcher("/views/admin/edit.jsp").forward(request, response);
                break;
            default:
                //TODO: Vao Trang bao loi neu ko co truong hop (ok)
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        request.setCharacterEncoding(UTF_8);

        if (action.equals("/manage-students")) {
            String studentAction = request.getParameter("studentAction");
            if (studentAction != null) {
                switch (studentAction) {
                    case "add":
                        addStudent(request, response);
                        break;
                    case "edit":
                        System.out.println("1. ban vua an vao edit cua quan ly sinh vien trong post");
                        editStudent(request, response);
                        break;
                    case "delete":
                        deleteStudent(request, response);
                        break;
                }
            }
            response.sendRedirect(request.getContextPath() + "/admin/manage-students");
        } else if (action.equals("/manage-groups")) {
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
            response.sendRedirect(request.getContextPath() + "/admin/manage-groups");
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
        student.setBirthOfDate(birthOfDate);
        student.setEmail(email);
        student.setPhone(phone);
        student.setClassId(classId);

        adminService.addStudent(request, response, student);
    }

    private void editStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("2. method edit Student cua AdminServlet");
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
        student.setBirthOfDate(birthOfDate);
        student.setEmail(email);
        student.setPhone(phone);
        student.setClassId(classId);


        adminService.editStudent(request, response, student);
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        adminService.deleteStudent(id, code);
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
        classObj.setStartDay(Date.valueOf(startDay).toString());
        classObj.setEndDay(Date.valueOf(endDay).toString());
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
        classObj.setStartDay(Date.valueOf(startDay).toString());
        classObj.setEndDay(Date.valueOf(endDay).toString());
        classObj.setAdminId(adminId);

        adminService.editGroup(classObj);
    }

    private void deleteClass(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        adminService.deleteGroup(id);
    }
}
