<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增学生界面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h2 class="text-center">
                录入学生信息
            </h2>
        </div>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form role="form" action="/manager_doCreate" method="post" style="margin-left: 400px;margin-top: 80px;">
                <div class="form-group">
                    <label>学号：</label><input type="text" class="form-control" name="student.studentId"
                                             style="width:160px;display: inline-block"/>
                </div>
                <div class="form-group">
                    <label>姓名：</label><input type="text" class="form-control" name="student.studentName"
                                             style="width:100px;display: inline-block"/>
                </div>
                <div class="from-group">
                    <label>性别：</label>
                    <input type="radio" name="student.studentSex" value="true"/> 男
                    <input type="radio" name="student.studentSex" value="false"/> 女
                </div>
                <div class="from-group">
                    <label>专业：</label>
                    <input type="text" class="form-control" name="student.studentMajor"
                           style="width:120px;display: inline-block" \>
                </div>
                <div class="form-group">
                    <label style="margin-top:10px;">家庭住址：</label>
                    <textarea class="form-control" rows="3" style="width: 300px;margin-top:10px;display: inline-block"
                              name="student.address"></textarea>
                </div>
                <div class="form-group">
                    <label>电话：</label>
                    <input type="text" class="form-control" name="student.phone"
                           style="width:120px;display: inline-block" \>
                </div>
                <button type="submit" class="btn btn-default" style="text-align: center">增加</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
