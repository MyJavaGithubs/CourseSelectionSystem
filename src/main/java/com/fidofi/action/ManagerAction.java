package com.fidofi.action;

import com.fidofi.VO.ResultVO;
import com.fidofi.entity.Course;
import com.fidofi.entity.Manager;
import com.fidofi.entity.Page;
import com.fidofi.entity.Student;
import com.fidofi.service.CourseService;
import com.fidofi.service.ManagerService;
import com.fidofi.service.StudentService;
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
    @Autowired
    private ManagerService managerService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private CourseService courseService;


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

    public String index() {
        return "Login";
    }

    public String login() {
        ResultVO<Boolean> resultVO = managerService.login(manager.getRootName(), manager.getRootPassword());
        if (resultVO.getData() == true) {
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
        ResultVO<List<Course>> resultVO = courseService.getAllCourses(page);
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
        return "CreateCour";
    }

    //处理新增课程
    public String doCreateCour() {
        return this.manageCourse();
    }

    //跳转到更新课程页面
    public String updateCour() {
        return "UpdateCour";
    }

    //删除课程
    public String deleteCour() {
        return this.manageCourse();
    }

    //查看课程详情
    public String detailCour() {
        return "DetailCour";
    }

    //处理更新课程
    public String doUpdateCour() {
        return this.manageCourse();
    }
}
