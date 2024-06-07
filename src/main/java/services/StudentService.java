package services;

import entity.Student;
import models.StudentModel;

import java.util.List;

public class StudentService {
    private StudentModel studentModel = new StudentModel();

    public Student getStudentById(int id) {
        return studentModel.getStudentById(id);
    }

    public boolean changePassword(int studentId, String currentPassword, String newPassword) {
        return studentModel.changePassword(studentId, currentPassword, newPassword);
    }

}
