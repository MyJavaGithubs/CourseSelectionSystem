<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生选课系统</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                学生选课系统
            </h3>
            <ul class="nav nav-tabs">
                <li>
                    <a href="/student_selectCourses">选课报名</a>
                </li>
                <li>
                    <a href="/student_informations?student.studentId=${student.studentId}">个人信息</a>
                </li>
                <li>
                    <a href="/student_coursesScore?student.studentId=${student.studentId}">课程成绩</a>
                </li>
                <li style="float: right">
                    <a href="/student_updatePassword">修改密码</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>