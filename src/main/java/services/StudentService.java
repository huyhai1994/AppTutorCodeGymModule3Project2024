package services;

import entity.Student;
import models.StudentModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class StudentService {
    private StudentModel studentModel;

    public StudentService() {
        this.studentModel = new StudentModel();
    }

    public Student getStudentById(int id) {
        return studentModel.getStudentById(id);
    }

    public boolean changePassword(int studentId, String currentPassword, String newPassword) {
        return studentModel.changePassword(studentId, currentPassword, newPassword);
    }

    public void editPass(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String code = request.getParameter("code");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        this.studentModel.editPassword(code,email,phone,oldPass,newPass);
        response.sendRedirect("/login/student");
    }
}
