package com.fidofi.service;

import com.fidofi.VO.CourseVO;
import com.fidofi.VO.ResultVO;
import com.fidofi.entity.Category;
import com.fidofi.entity.Course;
import com.fidofi.entity.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by fido on 2017/12/20.
 */
@Service
@Transactional
public interface CourseService {

    public ResultVO<String> create(CourseVO course);

    public ResultVO<CourseVO> update(CourseVO course);

    public ResultVO<String> delete(Integer courseId);

    public ResultVO<List<CourseVO>> getAllCourses(Page page);

    public ResultVO<List<CourseVO>> selectByTeacher(Page page, String teacherName);

    public ResultVO<List<CourseVO>> selectByCategory(Page page, Integer categoryId);

    public ResultVO<List<CourseVO>> selectByCourseName(Page page, String courseName);

    public ResultVO<CourseVO> selectByCourseId(Integer courseId);

    public ResultVO<Integer> findCount();

    public ResultVO<Integer> findCountByName(String courseName);

    public ResultVO<List<CourseVO>> getAllPreviousCourses();
    public ResultVO<Integer> findCountByTeacher(String teacherName);

    public ResultVO<Integer> findCountByCategory(Category category);



}
