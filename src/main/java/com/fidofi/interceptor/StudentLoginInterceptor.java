package com.fidofi.interceptor;

import com.fidofi.entity.Student;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by fido on 2017/12/30.
 * 登录拦截器，防止未登录用户访问页面
 */
public class StudentLoginInterceptor extends MethodFilterInterceptor {
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        Student student = (Student) ServletActionContext.getRequest().getSession().getAttribute("student");
        if (student == null) {
            //没有登录就进行访问了
            ActionSupport actionSupport = (ActionSupport) actionInvocation.getAction();
            actionSupport.addActionError("你还没有登录，不能访问");
            return "Login";
        } else {
            //已经登录过了
            return actionInvocation.invoke();
        }
    }
}
