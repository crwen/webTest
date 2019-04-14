<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base target="main">
    <title>welcome</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/wl.css"/>
	<script src="../js/drag.js" type="text/javascript" charset="utf-8"></script>
	<style type="text/css">
		#box1 {
			
			width:50px;
			color:red;
			font-size: 40px;
			background-color: red;
			background: url(../img/a.gif);
			position:absolute;
		}
		

		
	</style>
<script src="../js/wel.js" type="text/javascript" charset="utf-8"></script>
  </head>

  
  <body style="text-align: center;">
    
    <c:choose>
	<c:when test="${empty sessionScope.sessionUser }">
		<c:set var="msg" value="您还没有登陆!" scope="request" />
		<c:out value="${msg }" />
		<a href="<c:url value='/jsp/login.jsp'/>" target="_self">点击此处登陆</a> 　
		
	</c:when>
	<c:otherwise>
		<div id="box1">
			<h3>${sessionScope.sessionUser.sign }</h3>
		</div>
		<div>
	    <ul class="nav">
			<li><a href="https://pandao.github.io/editor.md/" target="_blank">editor</a></li>
			<li><a href="<c:url value='/jsp/install.jsp'/>" target="_blank">常用插件</a></li>
			<li><a href="<c:url value='/jsp/information.jsp'/>"  target="_blank">个人信息</a></li>
			<li><a href="<c:url value='/UserServlet?method=quit'/>" target="_self">退出</a></li>
			
		</ul>
		</div>
		<div class="box"></div>
		
		<div id="imageFlow">
		<div class="top"></div>
		<div class="bank">
			<a rel="../img/install.png" title="常用插件" href="http://localhost:8080/Users/jsp/install.jsp">在这里有许多神奇的浏览器插件</a>
			<a rel="../img/editor.png" title="editor" href="https://pandao.github.io/editor.md/">这是一个开源在线的markdown编辑器</a>
			<a rel="../img/qiang.jpg" title="qmx" href="#">这是物联网的根节点</a>
			<a rel="../img/bookstore.png" title="无人知晓的书店" href="http://localhost:8080/bookstore">这是一个没有人知道的书店</a>
			<a rel="../img/qiang.jpg" title="qmx" href="#">这是物联网的根节点</a>
		</div>

		<div class="text">
			<div class="title">Loading</div>
			<div class="legend">Please wait...</div>
		</div>
		<div class="scrollbar">
			<img class="track" src="../img/sb.gif" alt="">
			<img class="arrow-left" src="../img/sl.gif" alt="">
			<img class="arrow-right" src="../img/sr.gif" alt="">
			<img class="bar" src="../img/sc.gif" alt="">
		</div>
	</div>
		
	</c:otherwise>
</c:choose>

  </body>
</html>
