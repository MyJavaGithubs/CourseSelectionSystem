package com.fidofi.action;

import com.fidofi.VO.ResultVO;
import com.fidofi.entity.Selectcourses;
import com.fidofi.service.SelectionCoursesService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by fido on 2017/12/24.
 * 选课操作相关
 */
public class SelectCourseAction {

    private Selectcourses selectcourses;

    private HttpServletRequest request = ServletActionContext.getRequest();
    @Autowired
    private SelectionCoursesService selectionCoursesService;

    public Selectcourses getSelectcourses() {
        return selectcourses;
    }

    public void setSelectcourses(Selectcourses selectcourses) {
        this.selectcourses = selectcourses;
    }

    //选课操作
    public String select() {
        ResultVO<String> resultVO = selectionCoursesService.confirmCourse(selectcourses);
        request.setAttribute("mesg", resultVO.getMessage());
        return "Select";
    }

    //退选操作
    public String cancel() {
        ResultVO<String> resultVO = selectionCoursesService.cancelCourse(selectcourses);
        request.setAttribute("mesg", resultVO.getMessage());
        return "Cancel";
    }
}
