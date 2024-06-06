package controllers;

import entity.Student;
import models.StudentModel;
import services.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
@WebServlet(name = "StudentServlet", urlPatterns = "/Student/*")
public class StudentServlet extends HttpServlet {
    private StudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "detail":
                showStudentDetail(req, resp);
                break;
            case "delete":
                deleteStudent(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            default:
                listStudents(req, resp);
                break;
        }
    }

    private void listStudents(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Student> students = studentService.getAllStudents();
        req.setAttribute("students", students);
        req.getRequestDispatcher("/views/admin/student-list.jsp").forward(req, resp);
    }

    private void showStudentDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int studentId = Integer.parseInt(req.getParameter("studentId"));
        Student student = studentService.getStudentById(studentId);
        req.setAttribute("student", student);
        req.getRequestDispatcher("/views/admin/student-detail.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int studentId = Integer.parseInt(req.getParameter("studentId"));
        Student student = studentService.getStudentById(studentId);
        req.setAttribute("student", student);
        req.getRequestDispatcher("/views/admin/student-form.jsp").forward(req, resp); // Form for edit
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "insert";
        }

        switch (action) {
            case "update":
                updateStudent(req, resp);
                break;
            case "insert":
                insertStudent(req, resp);
                break;
            default:
                listStudents(req, resp);
                break;
        }
    }

    private void insertStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String code = req.getParameter("code");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String birthOfDate = req.getParameter("birthOfDate");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        int classId = Integer.parseInt(req.getParameter("classId"));

        Student student = new Student();
        student.setName(name);
        student.setCode(code);
        student.setPassword(password);
        student.setGender(gender);
        student.setBirthOfDate(birthOfDate);
        student.setEmail(email);
        student.setPhone(phone);
        student.setClassId(classId);

        studentService.addStudent(student);
        resp.sendRedirect("admin");
    }

    private void updateStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String code = req.getParameter("code");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String birthOfDate = req.getParameter("birthOfDate");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        int classId = Integer.parseInt(req.getParameter("classId"));

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

        studentService.updateStudent(student);
        resp.sendRedirect("admin");
    }

    private void deleteStudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("studentId"));
        studentService.deleteStudent(id);
        resp.sendRedirect("admin");
    }
}
