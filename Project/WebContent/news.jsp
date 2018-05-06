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
				<li class="current"><a href="${ctx }/news.jsp">用户搜索时间</a></li>
				<li><a href="${ctx }/product.jsp">关键词统计</a></li>
				<li><a href="${ctx }/job.jsp">关键词排行</a></li>
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
					<h1 class="title01">用户搜索时间</h1>
				</div>
				<div class="leftbtn"></div>
			</div>
			
			
		</div><!--left end-->
		
		<div class="right">
			<div class="breadcrumbs"><img src="${ctx }/images/home-icon.gif" width="16" height="17" alt="首页" />当前位置：<a href="before_index.jsp">首页</a><span>></span><span>用户搜索时间</span></div>
			<div class="about">					
				<div class="show" title="cat1">
					<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
					<div id="main2" style="height:400px"></div>
					<!-- ECharts单文件引入 -->
					<script src="${ctx }/js/echarts.js"></script>
					<script type="text/javascript">
						// 基于准备好的dom，初始化echarts图表
						var myChart = echarts.init(document.getElementById('main2'),'light'); 

						 $.get('${ctx }/data/newsjson', function (data) {
							console.log(data);
							console.log(data.xAxisData);
							console.log(data.seriesData);
							 
							var option = {
								title : {
									text: '用户搜索时间'
								},
								tooltip : {
									trigger: 'axis'
								},
								legend: {
									data:['数量']
								},
								toolbox: {
									show : true,
									feature : {
										mark : {show: true},
										dataView : {show: true, readOnly: false},
										magicType : {show: true, type: ['line', 'bar']},
										restore : {show: true},
										saveAsImage : {show: true}
									}
								},
								calculable : true,
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
										"type":"line",
										"data":data.seriesData,
										markPoint : {
											data : [
												{type : 'max', name: '最大值'},
												{type : 'min', name: '最小值'}
											]
										},
										markLine : {
											data : [
												{type : 'average', name: '平均值'}
											]
										}
									}
								]
							}
	
							// 为echarts对象加载数据 
							myChart.setOption(option); 
						 }); 
					</script>
				</div>
				<div class="show" title="cat2">
					<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
					<div id="main1" style="height:400px"></div>
					<!-- ECharts单文件引入 -->
					<script src="${ctx }/js/echarts.js"></script>
					<script type="text/javascript">
						// 基于准备好的dom，初始化echarts图表
						var myChartpie = echarts.init(document.getElementById('main1'),'light'); 

						 $.get('${ctx }/data/newsjsonpie', function (data) {
								console.log(data);
								console.log(data.xAxisData);
								console.log(data.seriesData);
						
							var option = {
								title : {
									text: '用户搜索时间',
									x:'center'
								},
								tooltip : {
									trigger: 'item',
									formatter: "{a} <br/>{b} : {c} ({d}%)"
								},
								legend: {
									orient : 'vertical',
									x : 'left',
									data:data.xAxisData
								},
								toolbox: {
									show : true,
									feature : {
										mark : {show: true},
										dataView : {show: true, readOnly: false},
										magicType : {
											show: true, 
											type: ['pie', 'funnel'],
											option: {
												funnel: {
													x: '25%',
													width: '50%',
													funnelAlign: 'left',
													max: 1548
												}
											}
										},
										restore : {show: true},
										saveAsImage : {show: true}
									}
								},
								calculable : true,
								series : [
									{
										name:'数据',
										type:'pie',
										radius : '55%',
										center: ['50%', '60%'],
										data:data.seriesData
									}
								]
							};
	
							// 为echarts对象加载数据 
							myChartpie.setOption(option); 
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