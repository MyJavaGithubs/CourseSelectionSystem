<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>新增课程页面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h2 class="text-center">
                录入选修课程信息
            </h2>
        </div>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form role="form" action="/manager_doCreateCour" method="post" style="margin-left: 400px;margin-top: 80px;">
                <div class="form-group">
                    <label>课程名称：</label><input type="text" class="form-control" name="course.courseName"
                                             style="width:160px;display: inline-block"/>
                </div>
                <div class="form-group">
                    <label>学分：</label><input type="text" class="form-control" name="course.credit"
                                             style="width:100px;display: inline-block"/>
                </div>
                <div class="from-group">
                    <label>类别：</label>
                    <select name="course.category.categoryId">
                        <s:iterator value="#request.categoryList">
                            <option value="<s:property value='categoryId'/>"><s:property value="categoryName"/></option>
                        </s:iterator>
                    </select>
                </div>
                <div class="from-group" style="margin-top: 5px;">
                    <label>先修课：</label>
                    <select name="course.previousId">
                        <s:iterator value="#request.previousCouList">
                            <option value="<s:property value='courseId'/>"><s:property value="courseName"/></option>
                        </s:iterator>
                        <option value="" selected>无</option>
                    </select>
                </div>
                <div class="from-group">
                    <label>授课老师：</label>
                    <input type="text" class="form-control" name="course.teacherName"
                           style="width:120px;display: inline-block" \>
                </div>
                <div class="form-group">
                    <label style="margin-top:10px;">限选人数：</label>
                    <input type="text" class="form-control" name="course.studentNum"
                           style="width:120px;display: inline-block" \>
                </div>
                <div class="form-group">
                    <label>上课时间：</label>
                    <input type="text" class="form-control" name="course.courseTime"
                           style="width:120px;display: inline-block" \>
                </div>
                <div class="form-group">
                    <label>所属学期：</label>
                    <input type="radio" name="course.term" value="true"/> 上学期
                    <input type="radio" name="course.term" value="false"/> 下学期
                </div>
                <button type="submit" class="btn btn-default" style="text-align: center">增加</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
