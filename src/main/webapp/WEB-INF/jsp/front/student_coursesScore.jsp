<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>课程成绩查询</title>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-bordered" style="margin-top: 20px">
                <thead>
                <tr>
                    <th>
                        课程名称
                    </th>
                    <th>
                        课程类别
                    </th>
                    <th>
                        课程学分
                    </th>

                    <th>
                        课程成绩
                    </th>
                </tr>
                </thead>
                <tbody>

                <s:if test="%{#request.coursescore!=null}">
                    <!--注意该标签的用法-->
                    <s:iterator value="#request.coursescore">
                        <tr class="success">
                            <td>
                                <s:property value="course.courseName"/>
                            </td>
                            <td>
                                <s:property value="category.categoryName"/>
                            </td>
                            <td>
                                <s:property value="course.credit"/>
                            </td>
                            <td>
                                <s:property value="score"/>
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
                    </tr>
                </s:else>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
