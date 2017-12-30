package com.fidofi.service.impl;

import com.fidofi.VO.CategoryVO;
import com.fidofi.VO.CourseVO;
import com.fidofi.VO.ResultVO;
import com.fidofi.dao.CategoryDao;
import com.fidofi.dao.CourseDao;
import com.fidofi.entity.Category;
import com.fidofi.entity.Course;
import com.fidofi.entity.Page;
import com.fidofi.service.CourseService;
import com.fidofi.utils.CourseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by fido on 2017/12/20.
 */
@Service
@Transactional
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseDao courseDao;

    @Autowired
    private CategoryDao categoryDao;

    public ResultVO<String> create(Course course) {
        ResultVO<String> resultVO;
        try {
            courseDao.create(course);
            resultVO = ResultVO.createBySuccess("新增课程成功");
            return resultVO;
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = ResultVO.createByError("新增课程失败");
            return resultVO;
        }
    }

    public ResultVO<CourseVO> update(CourseVO courseVO) {
        ResultVO<CourseVO> resultVO;
        Course course = CourseUtils.getCoursePOJO(courseVO);
        try {
            Course newCourse = courseDao.update(course);
            resultVO = ResultVO.createBySuccess("更新课程成功");
            return resultVO;
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = ResultVO.createByError("更新课程失败");
            return resultVO;
        }
    }

    public ResultVO<String> delete(Integer courseId) {
        ResultVO<String> resultVO;
        try {
            courseDao.delete(courseId);
            resultVO = ResultVO.createBySuccess("删除课程成功");
            return resultVO;
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = ResultVO.createByError("删除课程失败");
            return resultVO;
        }
    }

    public ResultVO<List<CourseVO>> getAllCourses(Page page) {
        ResultVO<List<CourseVO>> resultVO;
        try {
            List<Course> courseList = courseDao.selectCourses(page);

            if (courseList != null && courseList.size() > 0) {
                List<CourseVO> courseVOList = this.getCourseVOList(courseList);
                resultVO = ResultVO.createBySuccess("查询课程列表成功", courseVOList);
            } else
                resultVO = ResultVO.createBySuccess("暂无课程");
            return resultVO;
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = ResultVO.createByError("获取课程列表失败");
            return resultVO;
        }
    }

    public ResultVO<List<CourseVO>> selectByTeacher(Page page, String teacherName) {
        ResultVO<List<CourseVO>> resultVO;
        try {
            List<Course> courseList = courseDao.selectByTeacher(page, teacherName);
            if (courseList != null && courseList.size() > 0) {
                List<CourseVO> courseVOList = this.getCourseVOList(courseList);
                resultVO = ResultVO.createBySuccess("查询课程列表成功", courseVOList);
            } else
                resultVO = ResultVO.createBySuccess("暂无课程");
            return resultVO;
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = ResultVO.createByError("获取课程列表失败");
            return resultVO;
        }
    }

    public ResultVO<List<CourseVO>> selectByCategory(Page page, Integer categoryId) {
        ResultVO<List<CourseVO>> resultVO;
        try {
            List<Course> courseList = courseDao.selectByCategory(page, categoryId);
            if (courseList != null && courseList.size() > 0) {
                List<CourseVO> courseVOList = this.getCourseVOList(courseList);

                resultVO = ResultVO.createBySuccess("查询课程列表成功", courseVOList);
            } else
                resultVO = ResultVO.createBySuccess("暂无课程");
            return resultVO;
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = ResultVO.createByError("获取课程列表失败");
            return resultVO;
        }
    }

    public ResultVO<List<CourseVO>> selectByCourseName(Page page, String courseName) {
        ResultVO<List<CourseVO>> resultVO;
        try {
            List<Course> courseList = courseDao.selectByCourseName(page, courseName);
            if (courseList != null && courseList.size() > 0) {
                List<CourseVO> courseVOList = this.getCourseVOList(courseList);
                resultVO = ResultVO.createBySuccess("查询课程列表成功", courseVOList);
            } else
                resultVO = ResultVO.createBySuccess("暂无课程");
            return resultVO;
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = ResultVO.createByError("获取课程列表失败");
            return resultVO;
        }
    }

    public ResultVO<CourseVO> selectByCourseId(Integer courseId) {
        ResultVO<CourseVO> resultVO;
        try {
            Course course = courseDao.selectByCourseId(courseId);
            CourseVO courseVO;
            if (course != null) {
                //查找先行课
                if (course.getPreviousId() != null) {
                    Course previousCourse = courseDao.selectByCourseId(course.getPreviousId());
                    courseVO = CourseUtils.getCourseVO(course, previousCourse);
                } else {
                    courseVO = CourseUtils.getCourseVO(course);
                }
                resultVO = ResultVO.createBySuccess("查询课程成功", courseVO);
            } else
                resultVO = ResultVO.createBySuccess("暂无此课程");
            return resultVO;
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = ResultVO.createByError("获取课程失败");
            return resultVO;
        }
    }

    public ResultVO<Integer> findCount() {
        ResultVO<Integer> resultVO = ResultVO.createBySuccess(courseDao.findCount());
        return resultVO;
    }

    public ResultVO<Integer> findCountByName(String courseName) {
        ResultVO<Integer> resultVO = ResultVO.createBySuccess(courseDao.findCountByName(courseName));
        return resultVO;
    }

    /**
     * 用于将查找的pojo list转换为vo list
     *
     * @param courseList
     * @return
     */
    private List<CourseVO> getCourseVOList(List<Course> courseList) {
        List<CourseVO> courseVOList = new ArrayList<CourseVO>();
        for (Course course : courseList) {
            CourseVO courseVO;
            if (course.getPreviousId() != null) {
                Course previousCourse = courseDao.selectByCourseId(course.getPreviousId());
                courseVO = CourseUtils.getCourseVO(course, previousCourse);
            } else {
                courseVO = CourseUtils.getCourseVO(course);
            }
            courseVOList.add(courseVO);
        }
        return courseVOList;
    }

    public ResultVO<List<CourseVO>> getAllPreviousCourses() {
        List<Course> courseList = courseDao.getAllPreviousCourse();
        ResultVO<List<CourseVO>> resultVO;
        try {
            if (courseList != null && courseList.size() > 0) {
                List<CourseVO> courseVOList = this.getCourseVOList(courseList);
                resultVO = ResultVO.createBySuccess("查找先修课程成功", courseVOList);
            } else
                resultVO = ResultVO.createBySuccess("没有先修课程");
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = ResultVO.createByError("查找先修课程失败");
        }
        return resultVO;
    }

    public ResultVO<Integer> findCountByTeacher(String teacherName) {
        ResultVO<Integer> resultVO = ResultVO.createBySuccess(courseDao.findCountByTeacher(teacherName));
        return resultVO;
    }

    public ResultVO<Integer> findCountByCategory(Category category) {
        ResultVO<Integer> resultVO = ResultVO.createBySuccess(courseDao.findCountByCategory(category));
        return resultVO;
    }

    public ResultVO<List<CategoryVO>> getCategoryVO() {
        List<Category> categoryList = categoryDao.getAllCategory();
        List<CategoryVO> categoryVOList = new ArrayList<CategoryVO>();
        for (Category category : categoryList) {
            int courseNum = courseDao.findCountByCategory(category);
            CategoryVO categoryVO = new CategoryVO(category, courseNum);
            categoryVOList.add(categoryVO);
        }
        ResultVO<List<CategoryVO>> resultVO = ResultVO.createBySuccess("查找类别统计数据成功", categoryVOList);
        return resultVO;
    }

    public ResultVO<List<Course>> getAllCourse() {
        List<Course> courseList = courseDao.getAllCourse();
        ResultVO<List<Course>> resultVO = ResultVO.createBySuccess("获得所有课程成功", courseList);
        return resultVO;
    }
}
