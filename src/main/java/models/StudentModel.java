package models;

import databases.DBConnect;
import entity.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentModel {
    public void addStudent(Student student) {
        DBConnect dbConnect = new DBConnect();
        Connection connection = dbConnect.getConnection();
        String sql = "INSERT INTO student (name, code, password, gender, birthofdate, email, phone, class_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getCode());
            preparedStatement.setString(3, student.getPassword());
            preparedStatement.setString(4, student.getGender());
            preparedStatement.setString(5, student.getBirthOfDate());
            preparedStatement.setString(6, student.getEmail());
            preparedStatement.setString(7, student.getPhone());
            preparedStatement.setInt(8, student.getClassId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        DBConnect dbConnect = new DBConnect();
        Connection connection = dbConnect.getConnection();
        String sql = "SELECT * FROM student";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Student student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setCode(resultSet.getString("code"));
                student.setPassword(resultSet.getString("password"));
                student.setGender(resultSet.getString("gender"));
                student.setBirthOfDate(resultSet.getString("birthofdate"));
                student.setEmail(resultSet.getString("email"));
                student.setPhone(resultSet.getString("phone"));
                student.setClassId(resultSet.getInt("class_id"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    public Student getStudentById(int id) {
        Student student = null;
        DBConnect dbConnect = new DBConnect();
        Connection connection = dbConnect.getConnection();
        String sql = "SELECT * FROM student WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setCode(resultSet.getString("code"));
                student.setPassword(resultSet.getString("password"));
                student.setGender(resultSet.getString("gender"));
                student.setBirthOfDate(resultSet.getString("birthofdate"));
                student.setEmail(resultSet.getString("email"));
                student.setPhone(resultSet.getString("phone"));
                student.setClassId(resultSet.getInt("class_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }

    public void updateStudent(Student student) {
        DBConnect dbConnect = new DBConnect();
        Connection connection = dbConnect.getConnection();
        String sql = "UPDATE student SET name = ?, code = ?, password = ?, gender = ?, birthofdate = ?, email = ?, phone = ?, class_id = ? WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getCode());
            preparedStatement.setString(3, student.getPassword());
            preparedStatement.setString(4, student.getGender());
            preparedStatement.setString(5, student.getBirthOfDate());
            preparedStatement.setString(6, student.getEmail());
            preparedStatement.setString(7, student.getPhone());
            preparedStatement.setInt(8, student.getClassId());
            preparedStatement.setInt(9, student.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteStudent(int id) {
        DBConnect dbConnect = new DBConnect();
        Connection connection = dbConnect.getConnection();
        String sql = "DELETE FROM student WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
