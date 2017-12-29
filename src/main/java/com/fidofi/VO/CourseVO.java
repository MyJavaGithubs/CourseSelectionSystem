package com.fidofi.VO;

import com.fidofi.entity.Category;
import com.fidofi.entity.Course;

/**
 * Created by fido on 2017/12/27.
 * 展示层所用的课程类
 */
public class CourseVO {

    private int courseId;
    private String courseName;
    private double credit;
    private String teacherName;
    private int studentNum;
    private String courseTime;
    private boolean term;
    private Integer selectNum;
    private Category category;
    private Course previousCourse;//先修课程

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public double getCredit() {
        return credit;
    }

    public void setCredit(double credit) {
        this.credit = credit;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(int studentNum) {
        this.studentNum = studentNum;
    }

    public String getCourseTime() {
        return courseTime;
    }

    public void setCourseTime(String courseTime) {
        this.courseTime = courseTime;
    }

    public boolean getTerm() {
        return term;
    }

    public void setTerm(boolean term) {
        this.term = term;
    }

    public Integer getSelectNum() {
        return selectNum;
    }

    public void setSelectNum(Integer selectNum) {
        this.selectNum = selectNum;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Course getPreviousCourse() {
        return previousCourse;
    }

    public void setPreviousCourse(Course previousCourse) {
        this.previousCourse = previousCourse;
    }

    @Override
    public String toString() {
        return "CourseVO{" +
                "courseId=" + courseId +
                ", courseName='" + courseName + '\'' +
                ", credit=" + credit +
                ", teacherName='" + teacherName + '\'' +
                ", studentNum=" + studentNum +
                ", courseTime='" + courseTime + '\'' +
                ", term=" + term +
                ", selectNum=" + selectNum +
                ", category=" + category +
                ", previousCourse=" + previousCourse +
                '}';
    }
}
