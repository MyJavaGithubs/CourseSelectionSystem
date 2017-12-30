<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生修改密码</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                学生修改密码
            </h3>
            <div style="width: 250px;margin: 100px auto">
<form class="form-horizontal" role="form" action="/student_doUpdatePassword" method="post"
      style="text-align: center;margin: 0 auto">
    <div class="form-group">
        <div class="col-sm-10">
            <label> 旧密码:</label><input type="password" class="form-control" name="oldPassword"
                                      placeholder="请输入旧密码"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-10">
            <label> 新密码:</label> <input type="password" class="form-control" name="student.studentPassword"
                                       placeholder="请输入新密码"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">更改</button>
        </div>
    </div>
</form>
                <c:if test="${updateMesg!=null}">
                    <div class="alert alert-dismissable alert-warning">
                        <h4>
                            注意!
                        </h4>
                            ${updateMesg}
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>
