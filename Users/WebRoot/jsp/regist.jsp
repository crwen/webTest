<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册</title>
    
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
			background: url(${pageContext.request.contextPath }//img/2.jpg);
			background-size: cover;
		}
		
		#box1 {
		width: 400px;
		height: 200px;
		margin: 150px 500px 0px 425px;
		padding-top: 90px;
		padding-left: 100px;
		background-color: white;
		background: url(${pageContext.request.contextPath }//img/sino.png);
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
	
	function checkPassword() {
		
		function $(id) {
			return document.getElementById(id);
		}
		
		var passwordEle = $("passwordEle");
		var errorSpanP = $("errorSpanP");
		if(passwordEle.value == "") {
			//alert();
			errorSpanP.innerHTML = "密码不能为空！";
		} else if(passwordEle.value.length < 6 || passwordEle.value.length > 20) {
			errorSpanP.innerHTML = "密码必须为6~20位!";
		} else {
			errorSpanP.innerHTML = "";
		}
	}
	
	function checkPassword2() {
		
		function $(id) {
			return document.getElementById(id);
		}
		var passwordEle = $("passwordEle");
		var passwordEle2 = $("passwordEle2");
		var errorSpanP2 = $("errorSpanP2");
		if(passwordEle2.value != passwordEle.value) {
			//alert();
			errorSpanP2.innerHTML = "两次密码不一致！";
		} else {
			errorSpanP2.innerHTML = "";
		}
	}
	
</script>

	<script type="text/javascript">
	function createXMLHttpRequest() {
		try {
			return new XMLHttpRequest();
		} catch(e) {
			try {
				return ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				try {
					return ActiveXObject("Microsoft.XMLHTTP");
				} catch(e) {
					alert("哥们儿，你用的什么浏览器啊？");
					throw e;
				}
			};
		};
	}
	window.onload = function() {
		var userEle = document.getElementById("usernameEle");
		userEle.onblur = function() {//失去焦点事件
			//获取异步对象
			var xmlHttp = createXMLHttpRequest();
			//打开连接
			xmlHttp.open("POST", "<c:url value='/UserServlet?method=doPost'/>", true);
			//设置请求头
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			//发送请求
			xmlHttp.send("username=" + userEle.value);
			//给xmlHttp的onreadystatechange事件注册监听
			xmlHttp.onreadystatechange = function() {
				if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var textu = xmlHttp.responseText;
					var spanu = document.getElementById("errorSpanU");
					
					if(textu == "-1") {
						spanu.innerHTML = "用户名已经被注册！";
					} else if(textu == "0") {
						spanu.innerHTML= "用户名不能为空！";
					} else {
						spanu.innerHTML = "";
					};
				};
			};
		};
	
	};
	
	</script>



  </head>
  
  <body>
  <h1>欢迎您注册</h1>
  <p style="color:red; font-weight:900">${msg }</p>
  <div id="box1">
    <form action="${pageContext.request.contextPath }/UserServlet" method="post">
    	<input type="hidden" name="method" value="regist"/>
    	用户名：　<input type="text" name="username" value="${user.username }" id="usernameEle" /> <span style="color:red">${errors.username }</span><span style="color:red" id="errorSpanU"></span><br/>
    	密　码：　<input type="password" name="password" value="${user.password }" id="passwordEle" onblur="checkPassword()"/> <span style="color:red">${errors.password }</span><span style="color:red" id="errorSpanP"></span><br/>
    	确认密码：<input type="password" name="password2" value="${user.password2 }" id="passwordEle2" onblur="checkPassword2()"/> <span style="color:red">${errors.password2 }</span><span style="color:red" id="errorSpanP2"></span><br/>
    	验证码：　<input type="text" name="verifyCode" size="3"/> 
    	<img id="vCode" src="${pageContext.request.contextPath }/UserServlet?method=verifyCode">
    	<a href="javascript:_change()">换一张</a> <span style="color:red">${errors.verify }</span><br/>
    	<input type="submit" value="注册"/><br/>
    </form>
   </div>
  </body>
</html>
