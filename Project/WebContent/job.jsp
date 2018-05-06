<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"   %>    
<%request.setCharacterEncoding("UTF-8");%> 

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>用户分析系统</title>
<meta name="keywords" content="用户分析系统" />
<meta name="description" content="用户分析系统" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<link type="text/css" href="${ctx }/css/style.css" rel="stylesheet" />
<script type="text/javascript" src="${ctx }/js/jquery.1.4.2.min.js"></script>
<script type="text/javascript" src="${ctx }/js/lib.js"></script>
<script type="text/javascript">
$(function() {

	//导航
	$(".nav").lavaLamp({
		fx: "backinout", 
		speed: 700,
		click: function(event, menuItem) {
			return true;
		}
	});
	
});
</script>
<!--解决 IE6 背景缓存-->
<!--[if IE 6]><script type="text/javascript">document.execCommand("BackgroundImageCache", false, true);</script><![endif]-->
</head>

<body>

	<div class="container header">
		<a class="logo" href="#"><img src="${ctx }/images/logo.gif" width="203" height="56" alt="" /></a>
		<div class="ritside">
			<script type="text/javascript">
			document.write("<div class='today'>"+
				getFullYear(today)+"年&nbsp;&nbsp;"
				+isnMonths[today.getMonth()]+"月"
				+today.getDate()+"日&nbsp;&nbsp;"
				+isnDays[today.getDay()]
			+"</div>");
			</script>
			
		</div>
		<div class="clear"></div>
		
		<div class="nav">
			<div class="nlbg"></div>
			<ul>
				<li><a href="${ctx }/before_index.jsp">首 页</a></li>
				<li><a href="${ctx }/about.jsp">浏览物品数量</a></li>
				<li><a href="${ctx }/news.jsp">用户搜索时间</a></li>
				<li><a href="${ctx }/product.jsp">关键词统计</a></li>
				<li class="current"><a href="${ctx }/job.jsp">关键词排行</a></li>
				<li class="last"><a href="${ctx }/contact.jsp">购买与点击数关系</a></li>
			</ul>
			<div class="nrbg"></div>
		</div>
	</div><!--header end-->
	
	<div class="container content">
		
		<div class="banner"><a href="#"><img src="${ctx }/images/banner.jpg" width="960" height="277" alt="" /></a></div>
		
		<div class="left">
			<div class="leftcon">
				<div class="leftnav">
					<h1 class="title01">关键词排行</h1>

				</div>
				<div class="leftbtn"></div>
			</div>
			
			
		</div><!--left end-->
		
		<div class="right">
			<div class="breadcrumbs"><img src="${ctx }/images/home-icon.gif" width="16" height="17" alt="首页" />当前位置：<a href="before_index.jsp">首页</a><span>></span><span>关键词排行</span></div>
			<div class="about">
				<div class="show" title="cat1">
					<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
					<div id="main" style="height:400px"></div>
					<!-- ECharts单文件引入 -->
					<script src="${ctx }/js/echarts.js"></script>
					<script type="text/javascript">						
						var myChart = echarts.init(document.getElementById('main'),'light'); 

						$.get('${ctx }/data/jobjson', function (data) {
							console.log(data);
							console.log(data.xAxisData);
							console.log(data.seriesData);
							
							var option = {
								title : {
									text: '关键词排行',
									x:'left'
								},
								tooltip: {
									show: true
								},
								legend: {
									data:['数量']
								},
								xAxis : [
									{
										type : 'category',
										data : data.xAxisData
									}
								],
								yAxis : [
									{
										type : 'value'
									}
								],
								series : [
									{
										"name":"数量",
										"type":"bar",
										"data":data.seriesData
									}
								]
							};
	
							// 为echarts对象加载数据 
							myChart.setOption(option); 
						});
					</script>
				</div>
			</div>
		</div><!--right end-->
		
		<div class="clear"></div>
		
	</div><!--content end-->
	
	<div class="container footer">
		<div class="btnmenu"><a href="${ctx }/before_index.jsp">首 页</a><span>|</span><a href="${ctx }/about.jsp">浏览物品数量</a><span>|</span><a href="${ctx }/news.jsp">用户搜索时间</a><span>|</span><a href="${ctx }/product.jsp">关键词统计</a><span>|</span><a href="${ctx }/job.jsp">关键词排行</a><span>|</span><a href="${ctx }/contact.jsp">购买与点击数关系</a></div>
		<div class="copyright">Copyright © 2018   tssinfo.com   Inc.All Rights Reserved<br /> </div>
	</div><!--footer end-->
	
</body>
</html>