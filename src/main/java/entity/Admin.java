package entity;

public class Admin  extends User{

    public Admin() {}

    public Admin(String name, String email, String password, String code, String birthOfDate, String gender, String phone ) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.code = code;
        this.birthOfDate = birthOfDate;
        this.gender = gender;
        this.phone = phone;
    }

    public Admin(String name, String code,String password){
        this.name = name;
        this.code = code;
        this.password =  password;
    }

/**
 * Quan tri vien nguoi co the
 * 1. them,
 * 2. sua
 * 3. xoa
 *
 * Sinh vien
 *
 * */
}