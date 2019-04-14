<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body {

			background-color: #F6F6F6;
			background: url(${pageContext.request.contextPath }//img/1.jpg);
			background-size: cover;
		}
		
		#box1 {
		width: 400px;
		height: 200px;
		margin: 150px 500px 0px 425px;
		padding-top: 100px;
		padding-left: 100px;
		background: url(${pageContext.request.contextPath }/img/li.jpg);
		opacity:0.85;
		}
	
	</style>

<script type="text/javascript">
	function _change() {
		/*
			获取<img>元素
		*/
		var ele = document.getElementById("vCode");
		ele.src = "${pageContext.request.contextPath }/UserServlet?method=verifyCode&xxx=" + new Date().getTime();
	}
</script>

  </head>
  
  <body>
  	<h1>欢迎登录</h1>
  	
  	<div id="box1">
  	<p style="color:red; font-weight:900">${msg }</p>
    <form action="${pageContext.request.contextPath }/UserServlet" method="post">
    	<input type="hidden" name="method" value="login"/>
    	用户名：<input type="text" name="username" value="${user.username }" /><span style="color:red">${errors.username }</span><br/>
    	密　码：<input type="password" name="password"/><span style="color:red">${errors.password }</span><br/>
    	验证码：<input type="text" name="verifyCode" size="3"/> 
    	<img id="vCode" src="${pageContext.request.contextPath }/UserServlet?method=verifyCode">
    	<a href="javascript:_change()">换一张</a> <span style="color:red">${errors.verify }</span><br/>
    	<input type="submit" value="登录"/><br/>
    	
    
    </form>
    </div>
  </body>
</html>
