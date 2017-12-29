package com.fidofi.utils;

import com.fidofi.VO.CourseVO;
import com.fidofi.VO.ResultVO;
import com.fidofi.entity.Course;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by fido on 2017/12/27.
 * CourseVO与CoursePOJO的转换
 */
public class CourseUtils {

    /**
     * 根据VO转换成pojo对象，方便持久层写入数据库
     *
     * @param courseVO
     * @return
     */
    public static Course getCoursePOJO(CourseVO courseVO) {
        Course course = new Course();
        course.setCourseName(courseVO.getCourseName());
        course.setTerm(courseVO.getTerm());
        course.setTeacherName(courseVO.getTeacherName());
        course.setStudentNum(courseVO.getStudentNum());
        course.setSelectNum(courseVO.getSelectNum());
        course.setCourseTime(courseVO.getCourseTime());
        course.setCredit(courseVO.getCredit());
        if(courseVO.getPreviousCourse()!=null)
        course.setPreviousId(courseVO.getPreviousCourse().getPreviousId());
        course.setCategory(courseVO.getCategory());
        return course;
    }

    /**
     * 根据pojo对象转换成vo对象，方便展示层展示
     * 这是有先行课的情况
     *
     * @param course
     * @param previousCourse
     * @return
     */
    public static CourseVO getCourseVO(Course course, Course previousCourse) {
        CourseVO courseVO = new CourseVO();
        courseVO.setCategory(course.getCategory());
        courseVO.setSelectNum(course.getSelectNum());
        courseVO.setTeacherName(course.getTeacherName());
        courseVO.setCredit(course.getCredit());
        courseVO.setCourseTime(course.getCourseTime());
        courseVO.setPreviousCourse(previousCourse);
        courseVO.setStudentNum(course.getStudentNum());
        courseVO.setCourseId(course.getCourseId());
        courseVO.setCourseName(course.getCourseName());
        courseVO.setTerm(course.isTerm());
        return courseVO;
    }

    /**
     * 根据pojo对象转换成vo对象，方便展示层展示
     * 这是没有先行课的情况
     *
     * @param course
     * @return
     */

    public static CourseVO getCourseVO(Course course) {
        CourseVO courseVO = new CourseVO();
        courseVO.setCategory(course.getCategory());
        courseVO.setSelectNum(course.getSelectNum());
        courseVO.setTeacherName(course.getTeacherName());
        courseVO.setCredit(course.getCredit());
        courseVO.setCourseTime(course.getCourseTime());
        courseVO.setStudentNum(course.getStudentNum());
        courseVO.setCourseId(course.getCourseId());
        courseVO.setCourseName(course.getCourseName());
        courseVO.setTerm(course.isTerm());
        return courseVO;
    }

}
