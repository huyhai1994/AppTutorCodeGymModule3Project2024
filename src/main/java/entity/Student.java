package entity;

public class Student extends User{

    public Student(){}

    private int id;
    private int classId;

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

    public void setBirthOfDate(String birthOfDate) {
        this.birthOfDate = birthOfDate;
    }

    public String getBirthOfDate() {
        return birthOfDate;
    }
    /**
     * Hoc sinh dang theo hoc tai trung tam gia su
     *
     * */


}
