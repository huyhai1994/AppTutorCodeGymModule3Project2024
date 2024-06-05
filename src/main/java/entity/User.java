package entity;

public  abstract class User{
    protected String name;
    protected String email;
    protected String password;
    protected String code;
    protected String birthOfDate;
    protected String gender;
    protected String phone;

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
