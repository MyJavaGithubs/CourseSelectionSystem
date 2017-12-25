<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>选课系统首页</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <!--注意引用的顺序-->
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.js"></script>
    <script>
        //选课按钮操作
        function selectcourse(courseId, studentId) {
            window.location.href = "/selectcourse_select?selectcourses.courseId=" + courseId + "&selectcourses.studentId=" + studentId;
        }
        //退选课程按钮操作
        function cancelcourse(courseId, studentId) {
            window.location.href = "/selectcourse_cancel?selectcourses.courseId=" + courseId + "&selectcourses.studentId=" + studentId;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-7 column">
            <h4>可选课程</h4>
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1"><span
                            class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                            class="icon-bar"></span><span class="icon-bar"></span></button>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">排序方式<strong
                                    class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="/student_page?orderRole=asc">学分从小到大</a>
                                </li>
                                <li>
                                    <a href="/student_page?orderRole=desc">学分从大到小</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search" method="post" action="/student_findCourse">
                        <div class="form-group">
                            <input type="text" class="form-control" name="course.courseName"/>
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
                <c:choose>
                    <c:when test="${page.currentPage==1}">
                        <li class="disabled">
                            <a href="JavaScript:void(0)" class="disabled">首页</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="/student_page?currentPage=1">首页</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${page.currentPage==1}">
                        <li class="disabled">
                            <a href="JavaScript:void(0)" class="disabled">上一页</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="/student_page?currentPage=${page.currentPage-1}">上一页</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="1" end="${page.totalPage}" var="i">
                    <c:choose>
                        <c:when test="${i==page.currentPage}">
                            <li class="disabled">
                                <a href="JavaScript:void(0)" class="disabled">${i}</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <a href="/student_page?currentPage=${i}">${i}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:choose>
                    <c:when test="${page.currentPage==page.totalPage||page.totalPage==1}">
                        <li class="disabled">
                            <a href="JavaScript:void(0)" class="disabled">下一页</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="/student_page?currentPage=${page.currentPage+1}">下一页</a>
                        </li>
                    </c:otherwise>

                </c:choose>
                <c:choose>
                    <c:when test="${page.totalPage==1||page.currentPage==page.totalPage}">
                        <li class="disabled">
                            <a href="JavaScript:void(0)" class="disabled">尾页</a>
                        </li>
                    </c:when>

                    <c:otherwise>
                        <li>
                            <a href="/student_page?currentPage=${page.totalPage}">尾页</a>
                        </li>
                    </c:otherwise>
                </c:choose>
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
        </div>
    </div>
</div>
<!--输出-->
<c:if test="${mesg!=null}">
    <blockquote>
        <p>
                ${mesg}
        </p>
    </blockquote>
</c:if>
</body>
</html>
