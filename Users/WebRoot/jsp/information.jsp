<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'information.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	
	<style type="text/css">
	
		body{
			background-color: greenyellow;
			background: url(../img/a.png);
 		}
	
		form{
			margin:100px auto;
		}
		
		.area{
			margin:0px 580px;
		}

	</style>

  </head>
  
  <body style="text-align: center;">

  <c:choose>
	<c:when test="${empty sessionScope.sessionUser }">
		<c:set var="msg" value="您还没有登陆!" scope="request" />
		<c:out value="${msg }" />
		<a href="<c:url value='/jsp/login.jsp'/>" target="_self">点击此处登陆</a> 　
	</c:when>
	<c:otherwise>
		
    <form action="${pageContext.request.contextPath }/UserServlet" method="post">
    	<input type="hidden" name="method" value="edit"/>
    	用户名：　<input type="text" name="username" value="${sessionScope.sessionUser.username }" readonly unselectable="on"/><br/>
    	密　码：　<input type="text" name="password" value="${sessionScope.sessionUser.password }"/><br/>
    	
    	性　别：　
    	  <c:choose>
			<c:when test="${sessionScope.sessionUser.gender == 'male' }">
    			<input type="radio" name="gender" value="male" checked/> 男
    			<input type="radio" name="gender" value="female" />女<br/><br/>
			</c:when>
			<c:when test="${sessionScope.sessionUser.gender == 'female' }">
    			<input type="radio" name="gender" value="male" /> 男
    			<input type="radio" name="gender" value="female" checked/>女<br/><br/>
			</c:when>
			<c:otherwise>
			    <input type="radio" name="gender" value="male"/> 男
    			<input type="radio" name="gender" value="female" />女<br/><br/>
			</c:otherwise>
		</c:choose>

		个性签名：<textarea rows="10" cols="30" name="sign">${sessionScope.sessionUser.sign }</textarea><br/><br/><br/>
		<input class="area" type="submit" value="编辑" />

    </form>
	</c:otherwise>
</c:choose>
  </body>
</html>
