<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>更新课程界面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h2 class="text-center">
                更新课程界面
            </h2>
        </div>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form role="form" action="/manager_doUpdateCour" method="post" style="margin-left: 400px;margin-top: 80px;">
            <div class="form-group">
                <br/>
                <label>课程名称：</label>
                <input type="text" class="form-control" name="course.courseName"
                       value="<s:property value='#request.updateCour.courseName'/> "
                       style="width:160px;display: inline-block" />
            </div>
            <div class="form-group">
                <label>学分：</label><input type="text" class="form-control" name="course.credit"
                                         value="<s:property value='#request.updateCour.credit'/>"
                                         style="width:100px;display: inline-block" />
            </div>
            <div class="from-group">
                <label>类别：</label>
                <select name="course.category.categoryId">
                    <s:iterator value="#request.categoryList">
                        <s:if test="%{#request.updateCour.category.categoryId==categoryId}">
                        <option value="<s:property value='categoryId'/>" selected><s:property value="categoryName"/></option>
                        </s:if>
                        <s:else>
                            <option value="<s:property value='categoryId'/>"><s:property value="categoryName"/></option>
                        </s:else>
                    </s:iterator>
                </select>
            </div>
            <div class="from-group" style="margin-top: 5px;">
                <label>先修课：</label>
                <s:if test="%{#request.updateCour.previousCourse!=null}">
                    <input type="text" class="form-control"
                           value="<s:property value='#request.updateCour.previousCourse.courseName'/> "
                           style="width:150px;display: inline-block" />
                </s:if>
                <s:else>
                    无
                </s:else>
            </div>
            <div class="from-group">
                <label>授课老师：</label>
                <input type="text" class="form-control" name="course.teacherName"
                       value="<s:property value='#request.updateCour.teacherName'/> "
                       style="width:120px;display: inline-block"  \>
            </div>
            <div class="form-group">
                <label style="margin-top:10px;">限选人数：</label>
                <input type="text" class="form-control" name="course.studentNum" value="<s:property value='#request.updateCour.studentNum'/> "
                       style="width:120px;display: inline-block"  \>
                <label style="margin-top:10px;">已选人数：</label>
                <input type="text" class="form-control" name="course.selectNum" value="1"
                       style="width:120px;display: inline-block" readonly \>
            </div>
            <div class="form-group">
                <label>上课时间：</label>
                <input type="text" class="form-control" name="course.courseTime" value="<s:property value='#request.updateCour.courseTime'/> "
                       style="width:120px;display: inline-block"   \>
            </div>
            <div class="form-group">
                <label>所属学期：</label>
                <s:if test="%{#request.updateCour.term==true}">
                    <input type="radio" name="course.term" value="true" checked="checked"/> 上学期
                    <input type="radio" name="course.term" value="false"/> 下学期
                </s:if>
                <s:else>
                    <input type="radio" name="course.term" value="true"/> 上学期
                    <input type="radio" name="course.term" value="false" checked="checked"/> 下学期
                </s:else>
            </div>
            <button type="submit" class="btn btn-default" style="text-align: center" >更新</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
