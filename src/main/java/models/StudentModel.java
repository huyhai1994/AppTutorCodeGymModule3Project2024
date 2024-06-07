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
                        student.setBirthOfDate(resultSet.getDate("birth_of_date"));
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


}
