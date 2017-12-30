package com.fidofi.action;

import com.fidofi.VO.CategoryVO;
import com.fidofi.VO.CourseVO;
import com.fidofi.VO.ResultVO;
import com.fidofi.entity.*;
import com.fidofi.service.*;
import com.fidofi.utils.CourseUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by fido on 2017/12/25.
 * 管理员端
 */
@Controller
public class ManagerAction extends ActionSupport {

    private Integer currentPage;//当前页
    private Manager manager;
    private HttpServletRequest request = ServletActionContext.getRequest();
    //学生
    private Student student;

    //课程
    private Course course;
    @Autowired
    private ManagerService managerService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private MajorCoursesService majorCoursesService;


    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

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

    public String index() {
        return "Login";
    }

    public String login() {
        ResultVO<Boolean> resultVO = managerService.login(manager.getRootName(), manager.getRootPassword());
        if (resultVO.getData() == true) {
            ActionContext cxt = ActionContext.getContext();
            Manager currentManager = new Manager(manager.getRootName(), manager.getRootPassword());
            //放进去
            cxt.getSession().put("manager", currentManager);
            return manageStudent();
        } else {
            request.setAttribute("loginMesg", resultVO.getMessage());
            return "Login";
        }
    }

    //跳转到学生管理
    public String manageStudent() {
        if (currentPage == null) {
            currentPage = 1;
        }
        //分页对象
        Page page = new Page(currentPage, this.studentService.findCount().getData());
        ResultVO<List<Student>> resultVO = studentService.getAllStudent(page);
        if (resultVO.getData() == null) {
            request.setAttribute("getStudentMesg", resultVO.getMessage());
        } else {
            request.setAttribute("studentList", resultVO.getData());

        }
        request.setAttribute("page", page);
        return "BackIndex";
    }

    //跳转到成绩管理
    public String manageScore() {

        return "Score";
    }

    //跳转到课程管理
    public String manageCourse() {
        if (currentPage == null) {
            currentPage = 1;
        }
        //分页对象
        Page page = new Page(currentPage, courseService.findCount().getData());
        ResultVO<List<CourseVO>> resultVO = courseService.getAllCourses(page);
        if (resultVO.getData() == null) {
            request.setAttribute("getCourseMesg", resultVO.getMessage());
        } else {
            request.setAttribute("courseList", resultVO.getData());
        }
        request.setAttribute("page", page);

        return "CourseManage";
    }

    //跳转到新增学生界面
    public String createStu() {
        return "CreateStu";
    }

    //处理新增逻辑
    public String doCreate() {
        ResultVO<String> resultVO = studentService.create(student);
        return this.manageStudent();
    }

    //搜索学生
    public String searchStu() {
        ResultVO<Student> resultVO = studentService.selectById(student.getStudentId());
        if (resultVO.getData() == null) {
            request.setAttribute("searchMesg", resultVO.getMessage());
        } else {
            request.setAttribute("studentList", resultVO.getData());
        }
        Page page = new Page(1, 1);
        request.setAttribute("page", page);
        return "BackIndex";
    }

    //删除学生
    public String deleteStu() {
        ResultVO<String> resultVO = studentService.delete(student);
        return this.manageStudent();
    }

    //跳转到新增课程界面
    public String createCour() {
        ResultVO<List<Category>> categoryList = categoryService.getAllCategory();
        ResultVO<List<CourseVO>> previousCouList = courseService.getAllPreviousCourses();
        //先修课
        request.setAttribute("previousCouList", previousCouList.getData());
        request.setAttribute("categoryList", categoryList.getData());//类别
        return "CreateCour";
    }

    //处理新增课程
    public String doCreateCour() {
        course.setSelectNum(0);
        ResultVO<String> resultVO = courseService.create(course);
        return this.manageCourse();
    }

    //跳转到更新课程页面
    public String updateCour() {
        ResultVO<CourseVO> resultVO = this.courseService.selectByCourseId(course.getCourseId());
        ResultVO<List<Category>> categoryList = categoryService.getAllCategory();
        if (resultVO.getData() == null) {
            return this.manageStudent();
        } else {
            request.setAttribute("categoryList", categoryList.getData());//类别
            request.setAttribute("updateCour", resultVO.getData());
            return "UpdateCour";
        }
    }

    //删除课程
    public String deleteCour() {
        this.courseService.delete(course.getCourseId());
        return this.manageCourse();
    }

    //查看课程详情
    public String detailCour() {
        ResultVO<CourseVO> resultVO = courseService.selectByCourseId(course.getCourseId());
        request.setAttribute("detailCour", resultVO.getData());
        return "DetailCour";
    }

    //处理更新课程
    public String doUpdateCour() {
        CourseVO courseVO = CourseUtils.getCourseVO(course);
        courseService.update(courseVO);
        return this.manageCourse();
    }

    //数据图表展示
    public String showChart() {
        ResultVO<List<CategoryVO>> resultVO = courseService.getCategoryVO();
        ResultVO<List<Course>> courseList = courseService.getAllCourse();
        request.setAttribute("categoryVOList", resultVO.getData());
        request.setAttribute("allCourseList", courseList.getData());
        return "ShowChart";
    }
}
