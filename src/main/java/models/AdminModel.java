package models;

import databases.DBConnect;
import entity.Group;
import entity.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class AdminModel {
    private Connection connection;

    public AdminModel() {
        DBConnect dbConnect = new DBConnect();
        this.connection = DBConnect.getConnection();
    }

    public ResultSet getAllStudents() throws SQLException {
        String query = "call get_all_students()";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        return preparedStatement.executeQuery();
    }


    public ResultSet getAllClasses() throws SQLException {
        String query = "SELECT * FROM class";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        return preparedStatement.executeQuery();
    }

    public void addStudent(Student student) throws SQLException {
        String query = "CALL add_student(?,?,?,?,?,?,?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, student.getName());
        preparedStatement.setString(2, student.getCode());
        preparedStatement.setString(3, student.getPassword());
        preparedStatement.setString(4, student.getGender());
        preparedStatement.setString(5, student.getBirthOfDate());
        preparedStatement.setString(6, student.getEmail());
        preparedStatement.setString(7, student.getPhone());
        preparedStatement.setInt(8, student.getClassId());
        preparedStatement.executeUpdate();
    }

    public void editStudent(Student student) throws SQLException {
        String query = "call edit_student(?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, student.getClassId());
        preparedStatement.setString(2, student.getName());
        preparedStatement.executeUpdate();
    }

    public boolean deleteStudent(int classId, String code) throws SQLException {
        String query = "call edit_student(?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, classId);
        preparedStatement.setString(2, code);
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

    public Student getStudentById(int id) throws SQLException {
        String query = "SELECT * FROM student WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            Student student = new Student();
            student.setId(resultSet.getInt("id"));
            student.setName(resultSet.getString("name"));
            student.setCode(resultSet.getString("code"));
            student.setPassword(resultSet.getString("password"));
            student.setGender(resultSet.getString("gender"));
            student.setBirthOfDate(resultSet.getDate("birthofdate"));
            student.setEmail(resultSet.getString("email"));
            student.setPhone(resultSet.getString("phone"));
            student.setClassId(resultSet.getInt("class_id"));
            return student;
        }
        return null;
    }

    public Group getClassById(int id) throws SQLException {
        String query = "SELECT * FROM class WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            Group group = new Group();
            group.setId(resultSet.getInt("id"));
            group.setCode(resultSet.getString("code"));
            group.setName(resultSet.getString("name"));
            group.setStartDay(resultSet.getDate("startday").toString());
            group.setEndDay(resultSet.getDate("endday").toString());
            group.setAdminId(resultSet.getInt("admin_id"));
            return group;
        }
        return null;
    }
}
