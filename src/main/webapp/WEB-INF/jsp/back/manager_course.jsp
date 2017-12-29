<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>后台课程管理界面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script>
        //新增学生
        function  createCour() {
            window.location.href="/manager_createCour";
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <button type="button" class="btn btn-default" style="float: right;margin: 10px" onclick="createCour()">新增课程</button>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>
                        课程名称
                    </th>
                    <th>
                        授课老师
                    </th>
                    <th>
                        课程类别
                    </th>
                    <th>
                        学分
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
                        查看详情
                    </th>
                    <th colspan="2" style="align: center">
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
                                <s:property value="teacherName"/>
                            </td>
                            <td>
                                <s:property value="category.categoryName"/>
                            </td>
                            <td>
                                <s:property value="credit"/>
                            </td>
                            <td>
                                <s:property value="previousCourse.courseName"/>
                            </td>
                            <td>
                                <s:property value="studentNum"/>
                            </td>
                            <td>
                                <s:property value="selectNum"/>
                            </td>
                            <td>
                                <a href="/manager_detailCour?course.courseId= <s:property value='courseId'/>">查看详情</a>
                            </td>
                            <td>
                                <a href="/manager_updateCour?course.courseId=<s:property value="courseId"/>">更新</a>
                            </td>
                            <td>
                                <a href="/manager_deleteCour?course.courseId=<s:property value="courseId"/>">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                </s:if>
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
                            <a href="/manager_manageCourse?currentPage=1">首页</a>
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
                            <a href="/manager_manageCourse?currentPage=${page.currentPage-1}">上一页</a>
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
                                <a href="/manager_manageCourse?currentPage=${i}">${i}</a>
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
                            <a href="/manager_manageCourse?currentPage=${page.currentPage+1}">下一页</a>
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
                            <a href="/manager_manageCourse?currentPage=${page.totalPage}">尾页</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
