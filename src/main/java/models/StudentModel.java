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

    }
}
