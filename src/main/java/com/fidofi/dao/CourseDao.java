package com.fidofi.dao;

import com.fidofi.entity.Category;
import com.fidofi.entity.Course;
import com.fidofi.entity.Page;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by fido on 2017/12/16.
 * 课程类的数据库操作
 */

public interface CourseDao {

    public void create(Course course);

    public Course update(Course course);

    public void delete(Integer courseId);

    public List<Course> selectCourses(Page page);

    public List<Course> selectByTeacher(Page page, String teacherName);

    public List<Course> selectByCategory(Page page, Integer categoryId);

    public List<Course> selectByCourseName(Page page, String courseName);

    public Course selectByCourseId(Integer courseId);

    public void cancelCourse(Integer courseId);

    public void confirmCourse(Integer courseId);

    public int findCount();

    public Course getPreviousCourse(Integer courseId);

//    public Course getCourseById(Integer courseId);


    public int findCountByName(String courseName);

    public List<Course> getAllPreviousCourse();

    public int findCountByTeacher(String teacherName);

    public int findCountByCategory(Category category);

    public List<Course> getAllCourse();

}
