<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>选课系统后台界面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script>

        //新增学生
        function create() {
            window.location.href = "/manager_createStu";
        }
        //删除学生
        function deleteStu(studentId) {
            window.location.href = "/manager_deleteStu?student.studentId=" + studentId;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <button type="button" class="btn btn-default" style="margin-top: 8px;float: right;" onclick="create()">
                新增学生
            </button>
            <form class="navbar-form navbar-left" role="search" method="post" action="/manager_searchStu">
                <div class="form-group">
                    <input type="text" class="form-control" name="student.studentId"/>
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>
                        学号
                    </th>
                    <th>
                        姓名
                    </th>
                    <th>
                        性别
                    </th>
                    <th>
                        家庭住址
                    </th>
                    <th>
                        专业
                    </th>
                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>
                <s:if test="%{#request.studentList!=null}">
                    <s:iterator value="#request.studentList">
                        <tr>
                            <td>
                                <s:property value="studentId"/>
                            </td>
                            <td>
                                <s:property value="studentName"/>
                            </td>
                            <td>
                                <s:if test="studentSex==true">
                                    男
                                </s:if>
                                <s:else>
                                    女
                                </s:else>
                            </td>
                            <td>
                                <s:property value="address"/>
                            </td>
                            <td>
                                <s:property value="studentMajor"/>
                            </td>
                            <td>
                                <button type="button" class="btn btn-xs"
                                        onclick="deleteStu(<s:property value="studentId"/>)">删除
                                </button>
                            </td>
                        </tr>
                    </s:iterator>
                </s:if>
                <s:else>
                    <tr>
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
                            <a href="/manager_manageStudent?currentPage=1">首页</a>
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
                            <a href="/manager_manageStudent?currentPage=${page.currentPage-1}">上一页</a>
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
                                <a href="/manager_manageStudent?currentPage=${i}">${i}</a>
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
                            <a href="/manager_manageStudent?currentPage=${page.currentPage+1}">下一页</a>
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
                            <a href="/manager_manageStudent?currentPage=${page.totalPage}">尾页</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>

</body>
</html>
