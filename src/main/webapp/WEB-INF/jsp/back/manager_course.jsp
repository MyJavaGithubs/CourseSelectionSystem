<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>后台课程管理界面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
    <script>
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
                                <s:property value="credit"/>
                            </td>
                            <td>
                                <s:property value="categoryId"/>
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
                                <a href="">查看详情</a>
                            </td>
                            <td>
                                <a href="">更新</a>
                            </td>
                            <td>
                                <a href="">删除</a>
                            </td>
                        </tr>
                    </s:iterator>
                </s:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
