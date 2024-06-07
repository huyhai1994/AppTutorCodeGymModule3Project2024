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
            System.out.println(e.getErrorCode());
        }
    }

    public void editStudent(HttpServletRequest request, HttpServletResponse response, Student student) {
        try {
            adminModel.editStudent(student);
            request.setAttribute("student", student);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/admin/edit.jsp");
            requestDispatcher.forward(request, response);

        } catch (SQLException e) {
            System.out.println(e.getErrorCode());
        } catch (ServletException | IOException e) {
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


    public void renderPageManageStudents(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        RequestDispatcher out = request.getRequestDispatcher(ServiceUrl.MANAGE_STUDENTS);
        try {
            out.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void renderPageManageGroups(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher out = request.getRequestDispatcher(ServiceUrl.MANAGE_GROUPS);
        try {
            out.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}


