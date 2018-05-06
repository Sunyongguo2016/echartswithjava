<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"   %>    
<%request.setCharacterEncoding("UTF-8");%> 

<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>主要内容区main</title>
<link href="${ctx }css/css.css" type="text/css" rel="stylesheet" />
<link href="${ctx }css/main.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="images/main/favicon.ico" />
<style>
body{overflow-x:hidden; background:#f2f0f5; padding:15px 0px 10px 5px;}
#searchmain{ font-size:12px;}
#search{ font-size:12px; background:#548fc9; margin:10px 10px 0 0; display:inline; width:100%; color:#FFF; float:left}
#search form span{height:40px; line-height:40px; padding:0 0px 0 10px; float:left;}
#search form input.text-word{height:24px; line-height:24px; width:180px; margin:8px 0 6px 0; padding:0 0px 0 10px; float:left; border:1px solid #FFF;}
#search form input.text-but{height:24px; line-height:24px; width:55px; background:url(images/main/list_input.jpg) no-repeat left top; border:none; cursor:pointer; font-family:"Microsoft YaHei","Tahoma","Arial",'宋体'; color:#666; float:left; margin:8px 0 0 6px; display:inline;}
#search a.add{ background:url(${ctx }images/main/add.jpg) no-repeat -3px 7px #548fc9; padding:0 10px 0 26px; height:40px; line-height:40px; font-size:14px; font-weight:bold; color:#FFF; float:right}
#search a:hover.add{ text-decoration:underline; color:#d2e9ff;}
#main-tab{ border:1px solid #eaeaea; background:#FFF; font-size:12px;}
#main-tab th{ font-size:12px; background:url(${ctx }images/main/list_bg.jpg) repeat-x; height:32px; line-height:32px;}
#main-tab td{ font-size:12px; line-height:40px;}
#main-tab td a{ font-size:12px; color:#548fc9;}
#main-tab td a:hover{color:#565656; text-decoration:underline;}
.bordertop{ border-top:1px solid #ebebeb}
.borderright{ border-right:1px solid #ebebeb}
.borderbottom{ border-bottom:1px solid #ebebeb}
.borderleft{ border-left:1px solid #ebebeb}
.gray{ color:#dbdbdb;}
td.fenye{ padding:10px 0 0 0; text-align:right;}
.bggray{ background:#f9f9f9}
</style>
<script src="${ctx }/js/jquery.js"></script>
</head>
<body>
<!--main_top-->
<table width="99%" border="0" cellspacing="0" cellpadding="0" id="searchmain">
  <tr>
    <td width="99%" align="left" valign="top">您的位置：用户管理</td>
  </tr>
  <tr>
    <td align="left" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="search">
  		<tr>
   		 <td width="90%" align="left" valign="middle">
	         <form method="post" action="${ctx }/data/list?searchParam="+$("#searchParam").val();>
	         <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	         <input type="text" placeholder="请输入买家标签" id="searchParam" name="searchParam" value="${searchParam }" 
						class="text-word" style="width: 250px; line-height: 17px; display: inline-block" />
			<!-- <a href="javascrpt:searchp()" class="button border-main icon-search" 
						 onclick="searchp();return false;" style="width: 94px; height:40px; ">买家标签搜索</a> -->
			<input name="" type="button" value="查询" class="text-but"  onclick="searchp();return false;" style="width: 94px; height:40px;color:red;" >
	      
	         </form>
         </td>
  		  <td width="10%" align="center" valign="middle" style="text-align:right; width:150px;"><a href="${ctx }/add_info.jsp" target="mainFrame" class="add">添加数据</a></td>
  		</tr>
	</table>
    </td>
  </tr>
  <tr>
    <td align="left" valign="top">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab">
      <tr>
        <th align="center" valign="middle" class="borderright">商品ID</th>
        <th align="center" valign="middle" class="borderright">买家用户标签</th>
        <th align="center" valign="middle" class="borderright">查询词</th>
        <th align="center" valign="middle" class="borderright">点击数</th>
        <th align="center" valign="middle" class="borderright">日期</th>
        <th align="center" valign="middle">操作</th>
      </tr>
      <c:forEach items="${page.list }" var="pa">
	      <tr onMouseOut="this.style.backgroundColor='#ffffff'" onMouseOver="this.style.backgroundColor='#edf5ff'">
	        <td align="center" valign="middle" class="borderright borderbottom">${pa.item_id }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${pa.usertag }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${pa.query }</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${pa.jpy}</td>
	        <td align="center" valign="middle" class="borderright borderbottom">${pa.ds }</td>
	        <td align="center" valign="middle" class="borderbottom"><a href="${ctx }/data/detail?itemId=${pa.item_id}" 
	        target="mainFrame" onFocus="this.blur()" class="add">查看</a><span class="gray">&nbsp;|&nbsp;</span>
	        <a href="${ctx }/data/delete?itemId=${pa.item_id}" onFocus="this.blur()" class="delete">删除</a></td>
	      </tr>
	  </c:forEach>
    </table></td>
    </tr>
  <tr>
    <td align="left" valign="top" class="fenye">&nbsp;&nbsp;
    <a href="${ctx }/data/list?pageNum=1" target="mainFrame" onFocus="this.blur()">首页</a>&nbsp;&nbsp;
    <a href="${ctx }/data/list?pageNum=${page.prePageNum}" target="mainFrame" onFocus="this.blur()">上一页</a>&nbsp;&nbsp;
    <c:forEach begin="1" end="${page.totalPageNum }" var="pageNum">
	 	<c:choose>
			<c:when test="${page.currentPageNum == pageNum}">  
      		<span class="current">${page.currentPageNum}</span>
			</c:when>
			<c:otherwise> 
 			<a href="${ctx }/data/list?pageNum=${pageNum }" target="mainFrame" onFocus="this.blur()">${pageNum }</a>
			</c:otherwise>
		</c:choose>	
    </c:forEach>
    <a href="${ctx }/data/list?pageNum=${page.nextPageNum}" target="mainFrame" onFocus="this.blur()">下一页</a>&nbsp;&nbsp;
    <a href="${ctx }/data/list?pageNum=${page.totalPageNum}" target="mainFrame" onFocus="this.blur()">尾页</a></td>
  </tr>
</table>

<script type="text/javascript">
	//搜索
	function searchp(){
		var p=$("#searchParam").val();
		window . location . href = "${ctx }/data/list?searchParam="+p;
		$("[name='pagen']").each(function(key,value){
			$(this).attr("href",$(this).attr("href")+"&searchParam='"+p+"'");
		});
	}

		//单个删除
		function del(id, mid, iscid) {
			if (confirm("您确定要删除吗?")) {

			}
		}

		//全选
		$("#checkall").click(function() {
			$("input[name='id[]']").each(function() {
				if (this.checked) {
					this.checked = false;
				} else {
					this.checked = true;
				}
			});
		})

		//批量删除
		function DelSelect() {
			var Checkbox = false;
			$("input[name='id[]']").each(function() {
				if (this.checked == true) {
					Checkbox = true;
				}
			});
			if (Checkbox) {
				var t = confirm("您确认要删除选中的内容吗？");
				if (t == false)
					return false;
				$("#listform").submit();
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}

		
	</script>
</body>
</html>