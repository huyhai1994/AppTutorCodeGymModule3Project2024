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
//    private final Connection connection;
//
//    public StudentModel(){
//       DBConnect dbConnect = new DBConnect();
//       this.connection = dbConnect.getConnection();
//   }
//
//
//    public List<Student> getAllStudents() throws SQLException {
//        List<Student> students = new ArrayList<>();
//        String query = "SELECT * FROM students";
//        try (Connection conn = DBConnect.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(query);
//             ResultSet rs = stmt.executeQuery()) {
//            while (rs.next()) {
//                Student student = new Student();
//                // Thiết lập các thuộc tính của student từ rs
//                students.add(student);
//            }
//        }
//        return students;
//    }
}
