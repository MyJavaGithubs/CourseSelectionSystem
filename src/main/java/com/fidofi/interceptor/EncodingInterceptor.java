package com.fidofi.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.StrutsStatics;
import org.hibernate.annotations.SourceType;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by fido on 2017/12/25.
 * 处理中文乱码的拦截器
 */
public class EncodingInterceptor extends AbstractInterceptor {

    public String intercept(ActionInvocation actionInvocation) throws Exception {
        ActionContext actionContext = actionInvocation.getInvocationContext();
        HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
        request.setCharacterEncoding("UTF-8");
        return actionInvocation.invoke();
    }
}
