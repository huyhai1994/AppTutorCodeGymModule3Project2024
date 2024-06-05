package entity;

public class Student extends User{

    public Student(){}

    public Student(String name, String email, String password, String code, String birthOfDate, String gender, String phone, String studentId, String major) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.code = code;
        this.birthOfDate = birthOfDate;
        this.gender = gender;
        this.phone = phone;
    }
    /**
     * Hoc sinh dang theo hoc tai trung tam gia su
     *
     * */


}
