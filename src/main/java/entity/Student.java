package entity;

public class Student extends User{
    int id;
    int classId;

    public Student(){
    }

    public Student(String name, String email, String password, String code, String birthOfDate, String gender, String phone, String studentId, String major) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.code = code;
        this.birthOfDate = birthOfDate;
        this.gender = gender;
        this.phone = phone;
    }

    public Student (String name,String code , String password){
        this.name = name;
        this.code = code;
        this.password =  password;
    }

    public Student(String name, String usernameDB, String passwordDB, String genderDB, String phoneDB, String emailDB, String birthOfDateDB, int classDB) {
        this.name = name;
        this.code = usernameDB;
        this.password =  passwordDB;
        this.gender = genderDB;
        this.phone = phoneDB;
        this.email = emailDB;
        this.birthOfDate = birthOfDateDB;
        this.classId = classDB;
    }


    /**
     * Hoc sinh dang theo hoc tai trung tam gia su
     *
     * */


}
