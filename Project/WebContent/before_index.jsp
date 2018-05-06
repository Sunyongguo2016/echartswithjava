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
	
	//新闻
	$("#scrolltop").myScroll({
		speed:40,
		rowHeight:26
	});
	
	//产品展示
	$("#scrollpic").jCarouselLite({
		btnPrev:'.prev',
		btnNext:'.next',
		auto:2000,
		visible:4
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
<!--			<div class="telephone"><img src="${ctx }/images/telephone.gif" width="226" height="29" alt="咨询电话：0577-86602010" /></div>-->
		</div>
		<div class="clear"></div>
		
		<div class="nav">
			<div class="nlbg"></div>
			<ul>
				<li class="current"><a href="${ctx }/before_index.jsp">首 页</a></li>
				<li><a href="${ctx }/about.jsp">浏览物品数量</a></li>
				<li><a href="${ctx }/news.jsp">用户搜索时间</a></li>
				<li><a href="${ctx }/product.jsp">关键词统计</a></li>
				<li><a href="${ctx }/job.jsp">关键词排行</a></li>
				<li class="last"><a href="${ctx }/contact.jsp">购买与点击数关系</a></li>
			</ul>
			<div class="nrbg"></div>
		</div>
	</div><!--header end-->
	
	<div class="container content">
		
		<div class="banner"><a href="#"><img src="${ctx }/images/banner.jpg" width="960" height="277" alt="" /></a></div>
		
		<div class="f-l i-company pubox">
			<div class="putit"><h2 class="f-l">浏览物品数量</h2><a class="f-r more" href="about.jsp">更多>></a></div>
			<div class="pubcon">
				<a href="about.jsp"><img class="f-l" src="${ctx }/images/timg.jpg" width="300" height="169" alt="公司介绍" /></a>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="f-l i-news pubox">
			<div class="putit"><h2 class="f-l">用户搜索时间</h2><a class="f-r more" href="news.jsp">更多>></a></div>
			<div class="pubcon" id="scrolltop">
				<a href="news.jsp"><img class="f-l" src="${ctx }/images/timg (1).jpg" width="300" height="169" alt="公司介绍" /></a>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="f-r i-contact pubox">
			<div class="putit"><h2 class="f-l">关键词统计</h2><a class="f-r more" href="product.jsp">更多>></a></div>
			<div class="pubcon">
				<a href="product.jsp"><img class="f-l" src="${ctx }/images/timg (2).jpg" width="300" height="169" alt="公司介绍" /></a>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="clear"></div>
		
		<div class="f-l i-product pubox">
			<div class="putit"><h2 class="f-l">关键词排行</h2><a class="f-r more" href="job.jsp">更多>></a></div>
			<div class="pubcon">
				<a href="job.jsp"><img class="f-l" src="${ctx }/images/timg (4).jpg" width="440" height="248" alt="公司介绍" /></a>
				<div class="clear"></div>
			</div>
		</div>
		
		<div class="f-r i-friendship pubox">
			<div class="putit"><h2 class="f-l">购买与点击数关系</h2><a class="f-r more" href="contact.jsp">更多>></a></div>
			<div class="pubcon">
				<a href="contact.jsp"><img class="f-l" src="${ctx }/images/timg (5).jpg" width="440" height="248" alt="公司介绍" /></a>
			</div>
		</div>
		
		<div class="clear"></div>
		
	</div><!--content end-->
	
	<div class="container footer">
		<div class="btnmenu"><a href="${ctx }/before_index.jsp">首 页</a><span>|</span><a href="${ctx }/about.jsp">浏览物品数量</a><span>|</span><a href="${ctx }/news.jsp">用户搜索时间</a><span>|</span><a href="${ctx }/product.jsp">关键词统计</a><span>|</span><a href="${ctx }/job.jsp">关键词排行</a><span>|</span><a href="${ctx }/contact.jsp">购买与点击数关系</a></div>
		<div class="copyright">Copyright © 2018   tssinfo.com   Inc.All Rights Reserved<br /> </div>
	</div><!--footer end-->
	
</body>
</html>