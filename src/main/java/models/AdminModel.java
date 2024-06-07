package models;

import databases.DBConnect;
import entity.Admin;

import java.sql.*;

public class AdminModel {
    private Connection connection;

    public AdminModel() {
        DBConnect dbConnect = new DBConnect();
        this.connection = dbConnect.getConnection();
    }

    public Admin findUserAdmin(String username, String password) throws SQLException {
        String sql = "SELECT * from admin";
        PreparedStatement ps = this.connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String usernameDB = rs.getString("code");
            String passwordDB = rs.getString("password");
            if (username.equals(usernameDB) && password.equals(passwordDB)) {
                String name = rs.getString("name");
                return new Admin(name,usernameDB,passwordDB);
            }
        }
        return null;
    }

    public void addStudent(String name,String code , String password,String gender,String birthdate,String email,String phone,int classId) throws SQLException {
        String sql = "call add_student(?,?,?,?,?,?,?,?)";
        CallableStatement callableStatement = this.connection.prepareCall(sql);
        callableStatement.setString(1, name);
        callableStatement.setString(2, code);
        callableStatement.setString(3, password);
        callableStatement.setString(4, gender);
        callableStatement.setDate(5, java.sql.Date.valueOf(birthdate));
        callableStatement.setString(6, email);
        callableStatement.setString(7, phone);
        callableStatement.setInt(8, classId);
        callableStatement.execute();
    }
}
