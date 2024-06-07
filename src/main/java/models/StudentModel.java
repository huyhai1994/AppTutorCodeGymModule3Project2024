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
