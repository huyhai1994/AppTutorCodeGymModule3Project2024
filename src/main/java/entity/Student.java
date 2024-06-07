package entity;

public class Student extends User{
    private int id;
    private int classId;
    public Student(){}

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
    /**
     * Hoc sinh dang theo hoc tai trung tam gia su
     *
     * */

}
