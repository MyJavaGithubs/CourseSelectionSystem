<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看课程详情界面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function backIndex() {
            window.location.href="/manager_manageCourse";
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h2 class="text-center">
                查看课程详情
            </h2>
        </div>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column" style="text-align: center;margin: 0 auto">
                <div class="form-group">
                    <br/>
                    <label>课程名称：</label>
                    <input type="text" class="form-control" value="<s:property value='#request.detailCour.courseName'/> "
                           style="width:160px;display: inline-block" readonly/>
                </div>
                <div class="form-group">
                    <label>学分：</label><input type="text" class="form-control" value="<s:property value='#request.detailCour.credit'/>"
                                             style="width:100px;display: inline-block" readonly/>
                </div>
                <div class="from-group">
                    <label>类别：</label>
                    <input type="text" class="form-control" value="<s:property value='#request.detailCour.category.categoryName'/> "
                           style="width:150px;display: inline-block" readonly/>
                </div>
                <div class="from-group" style="margin-top: 5px;">
                    <label>先修课：</label>
                    <s:if test="%{#request.detailCour.previousCourse!=null}">
                        <input type="text" class="form-control" value="<s:property value='#request.detailCour.previousCourse.courseName'/> "
                               style="width:150px;display: inline-block" readonly/>
                    </s:if>
                    <s:else>
                        无
                    </s:else>
                </div>
                <div class="from-group">
                    <label>授课老师：</label>
                    <input type="text" class="form-control" value="<s:property value='#request.detailCour.teacherName'/> "
                           style="width:120px;display: inline-block" readonly \>
                </div>
                <div class="form-group">
                    <label style="margin-top:10px;">限选人数：</label>
                    <input type="text" class="form-control" value="<s:property value='#request.detailCour.studentNum'/> "
                           style="width:120px;display: inline-block" readonly \>
                    <label style="margin-top:10px;">已选人数：</label>
                    <input type="text" class="form-control" value="<s:property value='#request.detailCour.selectNum'/> "
                           style="width:120px;display: inline-block" readonly \>
                </div>
                <div class="form-group">
                    <label>上课时间：</label>
                    <input type="text" class="form-control" value="<s:property value='#request.detailCour.courseTime'/> "
                           style="width:120px;display: inline-block" readonly \>
                </div>
                <div class="form-group">
                    <label>所属学期：</label>
              <s:if test="%{#request.detailCour.term==true}">
                  <input type="text" class="form-control" value="上学期"
                         style="width:120px;display: inline-block" readonly \>
              </s:if>
                    <s:else>
                        <input type="text" class="form-control" value="下学期"
                               style="width:120px;display: inline-block" readonly \>
                    </s:else>
                </div>
                <button type="submit" class="btn btn-default" style="text-align: center" onclick="backIndex()">返回主页</button>
        </div>
    </div>
</div>
</body>
</html>