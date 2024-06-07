package models;

import databases.DBConnect;
import entity.Student;

import java.sql.*;

public class StudentModel {
    private Connection connection;

    public StudentModel() {
        DBConnect dbConnect = new DBConnect();
        this.connection = dbConnect.getConnection();
    }

    public Student getStudentById(int id) {
        try (Connection connection = new DBConnect().getConnection()) {
            String query = "SELECT * FROM students WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, id);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        Student student = new Student();
                        student.setId(resultSet.getInt("id"));
                        student.setName(resultSet.getString("name"));
                        student.setCode(resultSet.getString("code"));
                        student.setPassword(resultSet.getString("password"));
                        student.setGender(resultSet.getString("gender"));
                        student.setBirthOfDate(resultSet.getString("birth_of_date"));
                        student.setEmail(resultSet.getString("email"));
                        student.setPhone(resultSet.getString("phone"));
                        student.setClassId(resultSet.getInt("class_id"));
                        return student;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean changePassword(int studentId, String currentPassword, String newPassword) {
        try (Connection connection = new DBConnect().getConnection()) {
            String query = "SELECT password FROM students WHERE id = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setInt(1, studentId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String existingPassword = resultSet.getString("password");
                        if (existingPassword.equals(currentPassword)) {
                            query = "UPDATE students SET password = ? WHERE id = ?";
                            try (PreparedStatement updateStatement = connection.prepareStatement(query)) {
                                updateStatement.setString(1, newPassword);
                                updateStatement.setInt(2, studentId);
                                int rowsAffected = updateStatement.executeUpdate();
                                return rowsAffected > 0;
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Student findStudent(String username,String password) throws SQLException {
        String sql = "call login(?,?)";
        CallableStatement ps = this.connection.prepareCall(sql);
        ps.setString(1, username);
        ps.setString(2,password);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String usernameDB = rs.getString("code");
            String passwordDB = rs.getString("password");
            String name = rs.getString("name");
            String genderDB = rs.getString("gender");
            String phoneDB = rs.getString("phone");
            String emailDB = rs.getString("email");
            String birthOfDateDB = rs.getString("birthofdate");
            int classDB = rs.getInt("class_id");
            return new Student(name,usernameDB,passwordDB,genderDB,phoneDB,emailDB,birthOfDateDB,classDB);
        }
        return null;
    }

    public String forgotPassword(String username,String email,String phone) throws SQLException {
        String sql = "call forgot_pass(?,?,?)";
        PreparedStatement ps = this.connection.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, email);
        ps.setString(3, phone);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String password = rs.getString("password");
            return password;
        }
        return null;
    }

    public void editPassword(String code , String email , String phone , String oldPass , String newPass) throws SQLException {
        String sql = "call edit_by_student(?,?,?,?,?)";
        CallableStatement ps = this.connection.prepareCall(sql);
        ps.setString(1, code);
        ps.setString(2, email);
        ps.setString(3, phone);
        ps.setString(4, oldPass);
        ps.setString(5, newPass);
        ps.executeUpdate();
    }
}
