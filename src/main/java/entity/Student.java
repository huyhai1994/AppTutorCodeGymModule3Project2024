package entity;

public class Student extends User {
    private int id;
    private int classId;

    public Student() {
    }

    public Student(String name, String code, String password, String gender, String birthdate, String email, String phone, int classId) {
        this.name = name;
        this.code = code;
        this.password = password;
        this.gender = gender;
        this.birthOfDate = birthdate;
        this.email = email;
        this.phone = phone;
        this.classId = classId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

}
