<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"   %>    
<%request.setCharacterEncoding("UTF-8");%> 
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户分析系统</title>
<link rel="shortcut icon" href="${ctx }/images/favicon.ico" />
<link href="${ctx }/css/css.css" type="text/css" rel="stylesheet" />
<script src="${ctx }/js/jquery.js"></script>
</head>
<!--框架样式-->
<frameset rows="95,*,30" cols="*" frameborder="no" border="0" framespacing="0">
<!--top样式-->
	<frame src="${ctx }/top.jsp" name="topframe" scrolling="no" noresize id="topframe" title="topframe" />
<!--contact样式-->
	<frameset id="attachucp" framespacing="0" border="0" frameborder="no" cols="194,12,*" rows="*">
		<frame scrolling="auto" noresize="" frameborder="no" name="leftFrame" src="${ctx }/left.jsp"></frame>
		<frame id="leftbar" scrolling="no" noresize="" name="switchFrame" src="${ctx }/swich.jsp"></frame>
		<frame scrolling="auto" noresize="" border="0" name="mainFrame" src="${ctx }/data/list"></frame>
	</frameset>
<!--bottom样式-->
	<frame src="${ctx }/bottom.jsp" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<!--不可以删除-->
</html>