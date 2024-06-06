package services;

import entity.Student;
import models.StudentModel;

import java.util.List;

public class StudentService {
    private StudentModel studentModel = new StudentModel();

    public void addStudent(Student student) {
        studentModel.addStudent(student);
    }

    public List<Student> getAllStudents() {
        return studentModel.getAllStudents();
    }

    public Student getStudentById(int id) {
        return studentModel.getStudentById(id);
    }

    public void updateStudent(Student student) {
        studentModel.updateStudent(student);
    }

    public void deleteStudent(int id) {
        studentModel.deleteStudent(id);
    }
}
