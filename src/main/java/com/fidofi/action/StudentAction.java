package com.fidofi.action;

import com.fidofi.VO.CourseAndScore;
import com.fidofi.VO.CourseVO;
import com.fidofi.VO.ResultVO;
import com.fidofi.dao.CourseDao;
import com.fidofi.entity.Category;
import com.fidofi.entity.Course;
import com.fidofi.entity.Page;
import com.fidofi.entity.Student;
import com.fidofi.service.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.xml.transform.Result;
import java.util.List;

/**
 * Created by fido on 2017/12/21.
 * 学生端action
 */
@Controller
public class StudentAction extends ActionSupport {

    private Integer currentPage;//当前页，分页要用
    private Student student;
    private String role;

    private Category category;
    private String orderRole;//排序规则

    private Course course;
    //此对象可以获得request,session
    private ActionContext cxt = ActionContext.getContext();
    private HttpServletRequest request = ServletActionContext.getRequest();

    @Autowired
    private StudentService studentService;

    @Autowired
    private MajorCoursesService majorCoursesService;

    @Autowired
    private SelectionCoursesService selectionCoursesService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private CategoryService categoryService;

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getOrderRole() {
        return orderRole;
    }

    public void setOrderRole(String orderRole) {
        this.orderRole = orderRole;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    //跳转到登录界面
    public String index() {
        return "Login";
    }

    //登录
    public String login() {
        ResultVO<Student> resultVO = studentService.login(student.getStudentId(), student.getStudentPassword());
        if (resultVO.getData() == null) {
            //登录不成功，返回错误信息
            cxt.put("loginMesg", resultVO.getMessage());
            return "Login";
        } else {
            //登录成功，将学生信息放入session
            cxt.getSession().put("student", resultVO.getData());
            getPage(currentPage);
            return "SelectCourses";
        }
    }

    //跳转到选课界面
    public String selectCourses() {
        getPage(currentPage);
        return "SelectCourses";
    }

    //跳转到个人信息界面
    public String informations() {
        ResultVO<Student> resultVO = studentService.selectById(student.getStudentId());
        if (resultVO == null)
            request.setAttribute("infoMesg", resultVO.getMessage());
        else
            request.setAttribute("studentInfo", resultVO.getData());
        return "Information";
    }

    //跳转到课程成绩界面
    public String coursesScore() {
        ResultVO<List<CourseAndScore>> resultVO = majorCoursesService.getByStudent(student.getStudentId());
        if (resultVO.getData() == null) {
            cxt.put("scroeMesg", resultVO.getMessage());
        } else {
            request.setAttribute("coursescore", resultVO.getData());
        }
        return "CoursesScore";
    }

    //分页逻辑
    public String page() {
        if (course != null) {
            return findCourse();
        } else
            return selectCourses();
    }

    //处理个人信息更新
    public String updateInfo() {
        ResultVO<Student> resultVO = studentService.update(student);
        if (resultVO.getData() == null) {
            request.setAttribute("updateInfo", resultVO.getMessage());
        } else
            request.setAttribute("studentInfo", resultVO.getData());
        return "Information";
    }

    //按类别查找
    public String findByCategory() {
        if (currentPage == null) {
            currentPage = 1;
        }
        ResultVO<Category> resultCategory = categoryService.getCategoryById(category.getCategoryId());
        Page page = new Page(currentPage, courseService.findCountByCategory(resultCategory.getData()).getData());
        ResultVO<List<CourseVO>> courseList = courseService.selectByCategory(page, category.getCategoryId());
        request.setAttribute("page", page);
        request.setAttribute("courseList", courseList.getData());
        //将类别信息存进去
        ResultVO<List<Category>> categoryList = categoryService.getAllCategory();
        request.setAttribute("categoryList", categoryList.getData());
        return "SelectCourses";
    }

    //搜索课程
    public String findCourse() {
        if (currentPage == null) {
            currentPage = 1;
        }
        Page page;
        ResultVO<List<CourseVO>> resultVO;
        if ("teacherName".equals(role)) {
            page = new Page(currentPage, courseService.findCountByTeacher(course.getCourseName()).getData());
            if (orderRole != null)
                page.setOrderRole(orderRole);
            resultVO = courseService.selectByTeacher(page, course.getCourseName());
        } else {
            page = new Page(currentPage, courseService.findCountByName(course.getCourseName()).getData());
            if (orderRole != null)
                page.setOrderRole(orderRole);
            resultVO = courseService.selectByCourseName(page, course.getCourseName());
        }
        request.setAttribute("page", page);
        request.setAttribute("courseList", resultVO.getData());
        //将类别信息存进去
        ResultVO<List<Category>> categoryList = categoryService.getAllCategory();
        request.setAttribute("categoryList", categoryList.getData());
        return "SelectCourses";
    }

    //获取课程列表分页展示
    private void getPage(Integer currentPage) {
        if (currentPage == null) {
            currentPage = 1;
        }
        //将类别信息存进去
        ResultVO<List<Category>> categoryList = categoryService.getAllCategory();
        request.setAttribute("categoryList", categoryList.getData());
        Page pageBean;
        ResultVO<Integer> result = courseService.findCount();
        if (result.getData() == null) {
            request.setAttribute("getcourseMesg", result.getMessage());
            pageBean = new Page(currentPage, 0);
        } else {
            pageBean = new Page(currentPage, result.getData());
            if (orderRole != null)
                pageBean.setOrderRole(orderRole);
                ResultVO<List<CourseVO>> courseList = courseService.getAllCourses(pageBean);
                request.setAttribute("courseList", courseList.getData());

        }
        request.setAttribute("page", pageBean);
        Student s = (Student) cxt.getSession().get("student");
        //获取该学生的选课列表
        ResultVO<List<Course>> resultVO = selectionCoursesService.getStudentCourses(s.getStudentId());
        if (resultVO.getData() != null) {
            request.setAttribute("selectList", resultVO.getData());
        }
    }
}
