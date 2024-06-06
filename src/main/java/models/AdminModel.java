package models;

import entity.Group;
import entity.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminModel {
    private Connection connection;

    public AdminModel(Connection connection) {
        this.connection = connection;
    }

    public ResultSet getAllStudents() throws SQLException {
        String query = "SELECT * FROM student";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        return preparedStatement.executeQuery();
    }

    public ResultSet getAllClasses() throws SQLException {
        String query = "SELECT * FROM class";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        return preparedStatement.executeQuery();
    }

    public boolean addStudent(Student student) throws SQLException {
        String query = "INSERT INTO student (name, code, password, gender, birthofdate, email, phone, class_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, student.getName());
        preparedStatement.setString(2, student.getCode());
        preparedStatement.setString(3, student.getPassword());
        preparedStatement.setString(4, student.getGender());
        preparedStatement.setString(5, student.getBirthOfDate());
        preparedStatement.setString(6, student.getEmail());
        preparedStatement.setString(7, student.getPhone());
        preparedStatement.setInt(8, student.getClassId());
        return preparedStatement.executeUpdate() > 0;
    }

    public boolean editStudent(Student student) throws SQLException {
        String query = "UPDATE student SET name=?, code=?, password=?, gender=?, birthofdate=?, email=?, phone=?, class_id=? WHERE id=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, student.getName());
        preparedStatement.setString(2, student.getCode());
        preparedStatement.setString(3, student.getPassword());
        preparedStatement.setString(4, student.getGender());
        preparedStatement.setString(5, student.getBirthOfDate());
        preparedStatement.setString(6, student.getEmail());
        preparedStatement.setString(7, student.getPhone());
        preparedStatement.setInt(8, student.getClassId());
        preparedStatement.setInt(9, student.getId());
        return preparedStatement.executeUpdate() > 0;
    }

    public boolean deleteStudent(int studentId) throws SQLException {
        String query = "DELETE FROM student WHERE id=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, studentId);
        return preparedStatement.executeUpdate() > 0;
    }

    public boolean addGroup(Group groupObj) throws SQLException {
        String query = "INSERT INTO class (code, name, startday, endday, admin_id) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, groupObj.getCode());
        preparedStatement.setString(2, groupObj.getName());
        preparedStatement.setString(3, groupObj.getStartDay());
        preparedStatement.setString(4, groupObj.getEndDay());
        preparedStatement.setInt(5, groupObj.getAdminId());
        return preparedStatement.executeUpdate() > 0;
    }

    public boolean editClass(Group groupObj) throws SQLException {
        String query = "UPDATE class SET code=?, name=?, startday=?, endday=?, admin_id=? WHERE id=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, groupObj.getCode());
        preparedStatement.setString(2, groupObj.getName());
        preparedStatement.setString(3, groupObj.getStartDay());
        preparedStatement.setString(4, groupObj.getEndDay());
        preparedStatement.setInt(5, groupObj.getAdminId());
        preparedStatement.setInt(6, groupObj.getId());
        return preparedStatement.executeUpdate() > 0;
    }

    public boolean deleteClass(int classId) throws SQLException {
        String query = "DELETE FROM class WHERE id=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, classId);
        return preparedStatement.executeUpdate() > 0;
    }
}
