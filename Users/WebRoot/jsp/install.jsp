<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>常用插件</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
				
	<link rel="stylesheet" type="text/css" href="../css/install.css">

  </head>
  
  <body>

  <c:choose>
	<c:when test="${empty sessionScope.sessionUser }">
		<c:set var="msg" value="您还没有登陆!" scope="request" />
		<c:out value="${msg }" />
		<a href="<c:url value='/jsp/login.jsp'/>" target="_self">点击此处登陆</a> 　
	</c:when>
	<c:otherwise>			
		<div class="top">
		<div class="top2">
				<h2>有哪些超神的油猴脚本？</h2>
				相关问题：<a href="https://www.zhihu.com/question/21174406">有哪些好用的用户脚本（UserScript）？</a><br/>
		</div>
		</div>
		
			<div class="box2">
			
		
		<div class="box">

		<div>
			<h3>绕过搜索结果的自我跳转，直接访问原始网页：
				<a href="https://greasyfork.org/zh-CN/scripts/14178-ac-baidu" target="_blank">AC-baidu</a>
			</h3>
			<div>
				<p>
					Weibo 官方界面已经成为不少脚本应用必修的对象，ts 开发的这款脚本可以高度定制 Weibo 电脑端版面，
					去除各类广告、微博主自带的各种徽标、过滤热门话题等主要功能，用户需要在脚本的设置中启用相应功能。
				</p>
					如果希望单独安装浏览器插件的话，推荐 眼不见心不烦，其支持 Chrome 和 Firefox 脚本		<br/><br/>
			<img src="../img/re.jpg"/><br/><br/><br/>
			</div>
			</div>
		</div>
		
		<div>
			<h3>GitHub 中文化界面：
				<a href="https://openuserjs.org/scripts/52cik/GitHub_%E6%B1%89%E5%8C%96%E6%8F%92%E4%BB%B6" target="_blank">GitHub 汉化插件</a>
			</h3>
			<div>
				<p>
					很多新手朋友不太会玩 GitHub，可能被全英文界面所困扰，这款脚本实现汉化了 GitHub 界面的部分菜单及内容，
					新手熟悉之后可选择停用脚本恢复英文模式。
				</p>
			<img src="../img/zn.jpg"/><br/><br/><br/><br/>
			</div>
		</div>
		
		<div>
			<h3>查看完整的知乎回答而无需注册登录：
				<a href="https://openuserjs.org/scripts/ts/Zhihu_Visitor" target="_blank">Zhihu Visitor</a><br/>
			</h3>
			<div>
				<p>
					知乎问题页面里，比较长的答案添加展开按钮，点击可以显示全文。
					点击「更多回答」可以加载更多回答而非登录框。隐藏了必须登录才能使用的相关功能的按钮，如点赞或收藏等。
				</p><br/>
			<img src="../img/hidden.jpg"/><br/><br/><br/>
			</div>
		</div>
		
		<div>
			<h3>自动翻页 Google 搜索结果：
				<a href="https://openuserjs.org/scripts/tumpio/Endless_Google" target="_blank">Endless Google</a><br/>
			</h3>
			<div>
				<p>
					实现无需手动点击 Google 搜索结果的页码，实现自动翻页显示搜索内容。
				</p><br/>
			<img src="../img/auto.jpg"/><br/><br/><br/>
			</div>
		</div>
		
		<div>
			<h3>
				<a href="https://greasyfork.org/zh-CN/scripts/28497-remove-web-limits-modified" target="_blank">限制解除</a><br/>
			</h3>
			<div>
				<p>
					你一定遇到过在某些网站想复制一些文字，然后发现被网站无情地拒绝了。
					这个脚本可以很好地解除这样的限制,自由复制、剪切你想要的片段。
				</p><br/>
			<img src="../img/release.jpg"/><br/><br/><br/>
			</div>
		</div>
		
		<div>
			<h3>
				<a href="https://greasyfork.org/zh-CN/scripts/14466" target="_blank">购物党自动比价工具</a><br/>
			</h3>
			<div>
				<p>
					经常网购的小伙伴一定不能缺少这一款比价利器。可以自动比较一件商品在不同购物平台的最低价或者差价等，哪家最划算一目了然。
				</p><br/>
				<p>价格走势一目了然，购物不能再轻松。</p>
			<img src="../img/shopping.jpg"/><br/><br/><br/>
			</div>
		</div>
		
		<div>
			<h3>Userscript+ 能帮你自动发现合适脚本
				
			</h3>
			<div>
				<p>
					推荐一款可以自动发现当前网站适用脚本的小工具「Userscript+」，实现一键安装可用的脚本，告别折腾过程。
					首先大家安装好对应浏览器的油猴插件：<a href="https://sspai.com/post/40485" target="_blank">Tampermonkey for Chrome</a><br/>、
					<a href="https://sspai.com/post/40485" target="_blank">Greasemonkey for Firefox</a><br/>，
					然后在用户脚本网站 GreasyFork 上搜索找到 <a href="https://greasyfork.org/zh-CN/scripts/24508-userscript-show-site-all-userjs" target="_blank">Userscript+</a><br/>，点击安装此脚本之后完成安装步骤。
				</p><br/>

			<img src="../img/find.jpg"/><br/><br/><br/>
			</div>
		</div>
		
		</div>
	</c:otherwise>
</c:choose>

  </body>
</html>
