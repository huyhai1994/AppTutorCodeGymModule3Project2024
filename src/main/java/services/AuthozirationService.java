package services;

import entity.Admin;
import entity.Student;
import models.AdminModel;
import models.StudentModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class AuthozirationService {
    private AdminModel adminModel;
    private StudentModel studentModel;

    public AuthozirationService() {
        this.adminModel = new AdminModel();
        this.studentModel = new StudentModel();
    }


    public void renderPageLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher out = req.getRequestDispatcher("/views/authorization/login.jsp");
        out.forward(req, resp);
    }

    public void login(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Admin admin = this.adminModel.findUserAdmin(username, password);
        if (admin!= null) {
            HttpSession session = req.getSession();
            session.setAttribute("admin", admin.getName());
            resp.sendRedirect("/auth/login/admin");
        } else {
            Student student = this.studentModel.findStudent(username, password);
            if (student!= null) {
                HttpSession session = req.getSession();
                session.setAttribute("student", student);
                resp.sendRedirect("/auth/login/student");
            } else {

            }
        }
    }

    public void add(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String name = req.getParameter("name");
        String code = req.getParameter("code");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");
        String birthdate = req.getParameter("birthdate");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        int classId = Integer.parseInt(req.getParameter("classId"));
        this.adminModel.addStudent(name,code,password,gender,birthdate,email,phone,classId);
        resp.sendRedirect("/login/student");
    }

    public void forgot(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String username = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = this.studentModel.forgotPassword(username, email, phone);
        if (password != null){
            HttpSession session = req.getSession();
            session.setAttribute("password", password);
        } else {
            resp.sendRedirect("/login/student");
        }
    }

}
