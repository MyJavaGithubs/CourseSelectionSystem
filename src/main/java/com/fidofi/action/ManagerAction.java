package com.fidofi.action;

import com.fidofi.VO.ResultVO;
import com.fidofi.entity.Manager;
import com.fidofi.service.ManagerService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by fido on 2017/12/25.
 * 管理员端
 */
@Controller
public class ManagerAction extends ActionSupport {

    private Manager manager;
    private HttpServletRequest request = ServletActionContext.getRequest();
    @Autowired
    private ManagerService managerService;

    public Manager getManager() {
        return manager;
    }

    public void setManager(Manager manager) {
        this.manager = manager;
    }

    public String index() {
        return "Login";
    }

    public String login() {
        ResultVO<Boolean> resultVO = managerService.login(manager.getRootName(), manager.getRootPassword());
        if (resultVO.getData() == true) {
            return "BackIndex";
        } else {
            request.setAttribute("loginMesg", resultVO.getMessage());
            return "Login";
        }
    }
    //跳转到学生管理
    public String manageStudent(){
        return "BackIndex";
    }

    //跳转到成绩管理
    public String manageScore() {
        return "Score";
    }

    //跳转到课程管理
    public String manageCourse() {
        return "CourseManage";
    }
}
