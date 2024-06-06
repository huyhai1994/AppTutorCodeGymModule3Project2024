package services;

import entity.Group;
import entity.Student;
import models.AdminModel;

import java.sql.SQLException;

public class AdminService {

    private AdminModel adminModel;

    public AdminService(AdminModel adminModel) {
        this.adminModel = adminModel;
    }

    public AdminService() {

    }

    public void addStudent(Student student) {
        try {
            adminModel.addStudent(student);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editStudent(Student student) {
        try {
            adminModel.editStudent(student);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteStudent(int id) {
        try {
            adminModel.deleteStudent(id);
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

    public void deleteClass(int id) {
        try {
            adminModel.deleteClass(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


