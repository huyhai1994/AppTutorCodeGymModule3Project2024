package controllers;

import entity.Student;
import models.StudentModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class StudentServlet extends HttpServlet {
    private StudentModel studentModel = new StudentModel();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        try {
//////            List<Student> students = studentModel.getAllStudents();
////            req.setAttribute("students", students);
//            req.getRequestDispatcher("/student-list.jsp").forward(req, resp);
//        } catch (SQLException e) {
//            throw new ServletException("Cannot obtain students from DB", e);
//        }
   }
}
