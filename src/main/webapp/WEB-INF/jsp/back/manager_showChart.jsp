<%@ page import="com.fidofi.VO.CategoryVO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fidofi.entity.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>数据展示</title>
    <!-- 引入 ECharts 文件 -->
    <script src="/js/echarts.min.js"></script>
</head>
<body>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="left" style="width: 600px;height:500px; float: left;" ></div>
<div id="right" style="width: 600px;height:500px; float: left"></div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('left'));
    var myChart_right = echarts.init(document.getElementById('right'));
    var categoryName = new Array();
    var categorySell = new Array();
    var courseName = new Array();
    var selectNum = new Array();
    <%
       List<CategoryVO> categoryAndCountVOList=(List<CategoryVO>)request.getAttribute("categoryVOList");
       for(int i=0;i<categoryAndCountVOList.size();i++){
               %>
    categoryName[<%=i%>] = '<%=categoryAndCountVOList.get(i).getCategory().getCategoryName()%>'
    categorySell[<%=i%>] = '<%=categoryAndCountVOList.get(i).getCourseNum()%>'
    <%
       }
       %>
    <%
     List<Course> courseList=(List<Course>)request.getAttribute("allCourseList");
       for(int j=0;j<courseList.size();j++){
               %>
    courseName[<%=j%>] = '<%=courseList.get(j).getCourseName()%>'
    selectNum[<%=j%>] = '<%=courseList.get(j).getSelectNum()%>'
        <%
           }
           %>

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '课程类别选修人数统计'
        },
        tooltip: {},
        legend: {
            data: ['人数']
        },
        xAxis: {
            data: categoryName
        },
        yAxis: {},
        series: [{
            name: '人数',
            type: 'bar',
            data: categorySell
        }]
    };
    var option_right = {
        title: {
            text: '各门课程选修人数统计'
        },
        tooltip: {},
        legend: {
            data: ['人数']
        },
        xAxis: {
            data: courseName,
            axisLabel:{
                interval: 0,
                rotate:40
            }
        },
        yAxis: {},
        series: [{
            name: '人数',
            type: 'bar',
            data: selectNum
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    myChart_right.setOption(option_right);
</script>
</body>
</html>
