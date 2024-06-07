package services;

import entity.Group;
import entity.Student;
import models.AdminModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AdminService {

    private AdminModel adminModel;

    public AdminService() {
        this.adminModel = new AdminModel();
    }

    public void addStudent(HttpServletRequest request, HttpServletResponse response, Student student) {
        try {
            adminModel.addStudent(student);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editStudent(HttpServletRequest request, HttpServletResponse response, Student student) {
        try {
            System.out.println("3. ban da vao admin service de edit student");
            adminModel.editStudent(student);
            request.setAttribute("student", student);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/admin/edit.jsp");
            requestDispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteStudent(int id, String code) {
        try {
            adminModel.deleteStudent(id, code);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addGroup(Group classObj) {
        try {
            adminModel.addGroup(classObj);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editGroup(Group classObj) {
        try {
            adminModel.addGroup(classObj);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteGroup(int id) {
        try {
            adminModel.deleteClass(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Student getStudentById(int id) {
        try {
            return adminModel.getStudentById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Group getClassById(int id) {
        try {
            return adminModel.getClassById(id);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }


    public Group getGroupById(int id) {
        return null;
    }

    public Object getAllStudents() {
        return null;
    }

    public Object getAllGroups() {
        return null;
    }
}


