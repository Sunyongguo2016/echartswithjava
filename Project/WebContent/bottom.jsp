<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"   %>    
<%request.setCharacterEncoding("UTF-8");%> 

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>底部bottom</title>
<link href="${ctx }/css/css.css" type="text/css" rel="stylesheet" />
<style>
#footer{font-size:12px;}
.footer_pad{padding:7px 9px 5px 9px;}
</style>
</head> 
<body style="overflow-x:hidden; background:url(${ctx }/images/main/bottombg.jpg) repeat-x top left;" onselectstart="return false" oncontextmenu=return(false) >
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="footer">
  <tr>
    <td align="left" valign="middle" class="footer_pad">COPYRIGHT©2018</td>
  </tr>
</table>
</body>
</html>