package com.fidofi.interceptor;

import com.fidofi.entity.Manager;
import com.fidofi.entity.Student;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

/**
 * Created by fido on 2017/12/30.
 * 管理员端的登录拦截
 */
public class ManagerLoginInterceptor extends MethodFilterInterceptor {

    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        Manager manager = (Manager) ServletActionContext.getRequest().getSession().getAttribute("manager");
        if (manager == null) {
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
