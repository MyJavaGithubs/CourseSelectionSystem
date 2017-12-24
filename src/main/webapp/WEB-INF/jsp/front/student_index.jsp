<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>选课系统首页</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script>
        //选课按钮操作
        function selectcourse(courseId, studentId) {
            window.location.href = "/selectcourse_select?selectcourses.courseId=" + courseId + "&selectcourses.studentId=" + studentId;
        }
        //退选课程按钮操作
        function cancelcourse(courseId, studentId) {
            window.location.href = "/cancelcourse_select?selectcourses.courseId=" + courseId + "&selectcourses.studentId=" + studentId;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-7 column">
            <h4>可选课程</h4>
            <nav class="navbar navbar-default" role="navigation">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">排序方式<strong
                                    class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">学分从小到大</a>
                                </li>
                                <li>
                                    <a href="#">学分从大到小</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" style="display: inline-block"/>
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                </div>
            </nav>
            <table class="table">
                <thead>
                <tr>
                    <th>
                        课程名称
                    </th>
                    <th>
                        学分
                    </th>
                    <th>
                        上课时间
                    </th>
                    <th>
                        教师
                    </th>
                    <th>
                        先修课
                    </th>
                    <th>
                        限选人数
                    </th>
                    <th>
                        已选人数
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <s:if test="%{#request.courseList!=null}">
                    <s:iterator value="#request.courseList">
                        <tr>
                            <td>
                                <s:property value="courseName"/>
                            </td>
                            <td>
                                <s:property value="credit"/>
                            </td>
                            <td>
                                <s:property value="courseTime"/>
                            </td>
                            <td>
                                <s:property value="teacherName"/>
                            </td>
                            <td>
                                <s:property value="previousId"/>
                            </td>
                            <td>
                                <s:property value="studentNum"/>
                            </td>
                            <td>
                                <s:property value="selectNum"/>
                            </td>
                            <td>
                                <button type="button" class="btn btn-xs"
                                        onclick="selectcourse(<s:property value='courseId'/>,<s:property
                                                value="#session.student.studentId"/>)">选课
                                </button>
                            </td>
                        </tr>
                    </s:iterator>
                </s:if>
                <s:else>
                    <tr class="warning">
                        <td>
                            无
                        </td>
                        <td>
                            无
                        </td>
                        <td>
                            无
                        </td>
                        <td>
                            无
                        </td>
                        <td>
                            无
                        </td>
                        <td>
                            无
                        </td>
                        <td>
                            无
                        </td>
                        <td>
                            无
                        </td>
                    </tr>
                </s:else>
                </tbody>
            </table>
            <ul class="pagination">
                <li>
                    <a href="#">上一页</a>
                </li>
                <li>
                    <a href="#">1</a>
                </li>
                <li>
                    <a href="#">2</a>
                </li>
                <li>
                    <a href="#">3</a>
                </li>
                <li>
                    <a href="#">4</a>
                </li>
                <li>
                    <a href="#">5</a>
                </li>
                <li>
                    <a href="#">下一页</a>
                </li>
            </ul>
        </div>
        <div class="col-md-5 column">
            <h4>已选课程</h4>
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>
                        课程名称
                    </th>
                    <th>
                        学分
                    </th>
                    <th>
                        上课时间
                    </th>
                    <th>
                        教师
                    </th>
                    <th>
                        退选
                    </th>
                </tr>
                </thead>
                <tbody>
                <s:if test="%{#request.selectList!=null}">
                    <s:iterator value="#request.selectList">
                        <tr class="success">
                            <td>
                                <s:property value="courseName"/>
                            </td>
                            <td>
                                <s:property value="credit"/>
                            </td>
                            <td>
                                <s:property value="courseTime"/>
                            </td>
                            <td>
                                <s:property value="teacherName"/>
                            </td>
                            <td>
                                <button type="button" class="btn btn-xs"
                                        onclick="cancelcourse(<s:property value='courseId'/>,<s:property
                                                value="#session.student.studentId"/>)">退选
                                </button>
                            </td>
                        </tr>
                    </s:iterator>
                </s:if>
                </tbody>
            </table>
            <!--输出-->
            <s:if test="%{#request.mesg!=null}">
                <script type="text/javascript">
                    alert(<s:property  value="#request.mesg"/>);
                </script>
            </s:if>
        </div>
    </div>
</div>

</body>
</html>
