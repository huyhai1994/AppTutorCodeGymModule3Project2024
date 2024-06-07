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
@WebServlet(name = "StudentServlet", urlPatterns = "/student/*")
public class StudentServlet extends HttpServlet {
    private StudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo();
        req.setCharacterEncoding("utf-8");

        switch (action) {
            case "/profile":
                showProfile(req, resp);
                break;
            case "/grades":
                // showGrades(req, resp);
                break;
            case "/change-password":
                showChangePasswordPage(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo();
        req.setCharacterEncoding("utf-8");

        switch (action) {
            case "/change-password":
                changePassword(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    private void showProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int studentId = (int) req.getSession().getAttribute("studentId");
        Student student = studentService.getStudentById(studentId);
        req.setAttribute("student", student);
        req.getRequestDispatcher("/views/student/profile.jsp").forward(req, resp);
    }

    private void showChangePasswordPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/student/changePassword.jsp").forward(req, resp);
    }

    private void changePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int studentId = (int) req.getSession().getAttribute("studentId");
        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");

        boolean isPasswordChanged = studentService.changePassword(studentId, currentPassword, newPassword);
        if (isPasswordChanged) {
            req.setAttribute("message", "Password changed successfully.");
        } else {
            req.setAttribute("message", "Current password is incorrect.");
        }
        req.getRequestDispatcher("/views/student/changePassword.jsp").forward(req, resp);
    }
}
