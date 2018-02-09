<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/video/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/video/dashboard.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/video/style.css">


<script
	src="<%=request.getContextPath()%>/static/Homepage/js/jquery.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>屄哩屄哩-视频展示</title>
</head>
<body>
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/static/Homepage/css/style.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/static/Homepage/css/example.css">
	<script
		src="<%=request.getContextPath()%>/static/Homepage/js/sHover.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/static/Homepage/js/jquery.min.js"></script>


	<link
		href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
		rel="stylesheet">


	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/static/Homepage/video/bootstrap.min.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/static/Homepage/video/dashboard.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/static/Homepage/video/style.css">

	<!-- 联系我们css js jq -->
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/static/cebianlan/css/style.css">
	<script
		src="<%=request.getContextPath()%>/static/cebianlan/js/index.js"></script>
	<script src="<%=request.getContextPath()%>/static/cebianlan/js/jq22.js"></script>
	<script
		src="<%=request.getContextPath()%>/static/cebianlan/js/jquery-1.10.2.min.js"></script>
</head>

<script language="javascript">
	$(document).ready(
			
			
			
			function() {

				/* 	1st example	*/

				/// wrap inner content of each anchor with first layer and append background layer
				$("#menu1 li a").wrapInner('<span class="out"></span>').append(
						'<span class="bg"></span>');

				// loop each anchor and add copy of text content
				$("#menu1 li a").each(
						function() {
							$(
									'<span class="over">' + $(this).text()
											+ '</span>').appendTo(this);
						});

				$("#menu1 li a").hover(function() {
					// this function is fired when the mouse is moved over
					$(".out", this).stop().animate({
						'top' : '40px'
					}, 250); // move down - hide
					$(".over", this).stop().animate({
						'top' : '0px'
					}, 250); // move down - show
					$(".bg", this).stop().animate({
						'top' : '0px'
					}, 120); // move down - show

				}, function() {
					// this function is fired when the mouse is moved off
					$(".out", this).stop().animate({
						'top' : '0px'
					}, 250); // move up - show
					$(".over", this).stop().animate({
						'top' : '-40px'
					}, 250); // move up - hide
					$(".bg", this).stop().animate({
						'top' : '-40px'
					}, 120); // move up - hide
				});

				/*	2nd example	*/

				$("#menu2 li a").wrapInner('<span class="out"></span>');

				$("#menu2 li a").each(
						function() {
							$(
									'<span class="over">' + $(this).text()
											+ '</span>').appendTo(this);
						});

				$("#menu2 li a").hover(function() {
					$(".out", this).stop().animate({
						'top' : '40px'
					}, 300); // move down - hide
					$(".over", this).stop().animate({
						'top' : '0px'
					}, 300); // move down - show

				}, function() {
					$(".out", this).stop().animate({
						'top' : '0px'
					}, 300); // move up - show
					$(".over", this).stop().animate({
						'top' : '-40px'
					}, 300); // move up - hide
				});

			});
</script>
<body>

	<!-- <div class="container"></div> -->





	<!-- 客服部分 -->
	<div style="right: -230px;" class="contactusdiyou">

		<div class="hoverbtn">
			<span>联</span><span>系</span><span>我</span><span>们</span> <img
				class="hoverimg"
				src="<%=request.getContextPath()%>/static/cebianlan/images/hoverbtnbg.gif"
				height="9" width="13">
		</div>
		<div class="conter">
			<!--	<div class="con1"> 
			<dl class="fn_cle">
				<dt><img src="images/tel.png" height="31" width="31"></dt>
				<dd class="f1">咨询热线：</dd>
				<dd class="f2"><span class="ph_num">187-9779-0616</span></dd>
			</dl>
		</div> -->
			<div class="blank0"></div>
			<div class="qqcall">
				<dl class="fn_cle">
					<dt>
						<img
							src="<%=request.getContextPath()%>/static/cebianlan/images/zxkfqq.png"
							height="31" width="31">
					</dt>
					<dd class="f1 f_s14">在线客服：</dd>
					<dd class="f2 kefuQQ">
						<span>客服一</span> <a target="_blank"
							href="

http://shang.qq.com/open_webaio.html?sigt=6abe29a244eb227a65bc98c7bd8db390952bd95efbb3295f83d8383e3adbafd33663e0b1763171504a69aef06db7c246&sigu=53edec6635b8a65c6ebd2879cd09c64b5bf5425f269417462a92f949cec06d26fb69e1450ae26685&tuin=794799102"></a>

						<br> <span>客服二</span> <a target="_blank"
							href="

http://shang.qq.com/open_webaio.html?sigt=6abe29a244eb227a65bc98c7bd8db390952bd95efbb3295f83d8383e3adbafd33663e0b1763171504a69aef06db7c246&sigu=53edec6635b8a65c6ebd2879cd09c64b5bf5425f269417462a92f949cec06d26fb69e1450ae26685&tuin=794799102"></a>
					</dd>
				</dl>
				<div class="blank0" ></div>
			</div>
			<div class="blank0"></div>
			<div class="weixincall">
				<dl class="fn_cle">
					<dt>
						<img
							src="<%=request.getContextPath()%>/static//cebianlan/images/weixin.png"
							height="31" width="31">
					</dt>
					<dd class="f1">官方微信站：</dd>
					<dd class="f3">
						<img
							src="<%=request.getContextPath()%>/static//cebianlan/images/erweima.png"
							height="73" width="73">
					</dd>
				</dl>
			</div>
			<!--<div class="blank0"></div>
		<div class="dytimer">
			<span style="font-weight: bold;">公司官网：</span>
			<span><a href="http://www.jq22.com/">www.jq22.com</a></span>
		</div>-->
		</div>
	</div>

	<div class="diyoumask" style="height: 2000px;"></div>

	<script type="text/javascript">
$(function() {
	$(".contactusdiyou").hover(function() {
		$(".hoverimg").attr("src","images/hoverbtnbg1.gif");
		$('.diyoumask').fadeIn();
		$('.contactusdiyou').animate({right:'0'},300); 
	}, function() {
		$(".hoverimg").attr("src","images/hoverbtnbg.gif");
		$('.contactusdiyou').animate({right:'-230px'},300,function(){});
		$('.diyoumask').fadeOut();
	});
});
</script>





	<!-- 上方是导航栏 -->
	<div style="background-color: #6C89B2; margin-top: 0px">
		<div style="margin-left: 90%;">

			<%
				if (request.getSession().getAttribute("userName") == null) {
			%>
			<button class="btn btn-primary ladda-button" data-style="expand-left"
				id="login">
				<span class="ladda-label"><a href="login.sf"
					style="font-size: 10px; color: white; text-decoration: none">登录</a></span>
			</button>

			<button class="btn btn-primary ladda-button" data-style="expand-left"
				id="zhuce">
				<span class="ladda-label"><a href="zhuce.sf"
					style="font-size: 10px; color: white; text-decoration: none">注册</a></span>
			</button>
			<%
				} else {
			%>


			<button class="btn btn-primary ladda-button" data-style="expand-left"
				id="userxinxi">
				<span class="ladda-label"><a href="User_full_information.sf"
					style="font-size: 10px; color: white; text-decoration: none">
						欢迎你的登录: <span style="color: red"><%=request.getSession().getAttribute("userName")%></span>
				</a></span>
			</button>


			<%
				}
			%>
		</div>
		<script type="text/javascript">
$(document).ready(function(){
	$("#userxinxi").click(function(){
		location.href="User_full_information.sf";
		
	});
	$("#login").click(function(){
		location.href="login.sf";
	});
	$("#zhuce").click(function(){
		location.href="zhuce.sf";
	});
});
</script>
	</div>
	<div>
		<img
			src="<%=request.getContextPath()%>/static/Homepage/images/bilibili.png"
			style="width: 100%;" />

	</div>

	<style type="text/css">
body {
	font: normal 100% 'Arial', 'Helvetica', 'Verdana', sans-serif;
	color: #CECECE;
}

p {
	padding: 12px 0;
	margin: 0;
	font-size: .8em;
	line-height: 1.5;
}

form {
	margin: 0;
}

#search_box {
	width: 201px;
	height: 32px;
	background: url(http://files.jb51.net/demoimg/200912/bg_search_box.gif);
}

#search_box #s {
	float: left;
	padding: 0;
	margin: 6px 0 0 6px;
	border: 0;
	width: 159px;
	background: none;
	font-size: .8em;
}

#search_box #go {
	float: right;
	margin: 3px 4px 0 0;
}
</style>

	<div id="menu1" class="menu">
		<ul>
			<li><a href="logoone.sf">首 页</a></li>
			<li><a href="testshabi.sf">动 画</a></li>
			<li><a href="testshabi.sf">番 剧</a></li>
			<li><a href="testshabi.sf">国 创</a></li>
			<li><a href="testshabi.sf">音 乐</a></li>
			<li><a href="#">测 试</a></li>
			<li><a href="xiaoheiwu.sf">小 黑 屋</a></li>

			<!--
		<li><a href="#">登录</a></li>
		<li><a href="#">注册</a></li>
	-->
		</ul>
		<div class="cls"></div>


	</div>
	<div id="test"></div>
	<div align="center" style="color: red">
		<b>共计:<%=request.getAttribute("tag1")%>条记录
		</b> <b id="page"></b>
	</div>
	<div align="center" style="color: black">
		<button type="button" id="shou">首页</button>
		&nbsp;
		<button type="button" id="up">上一页</button>
		&nbsp;
		<button type="button" id="next">下一页</button>
		&nbsp;
		<button type="button" id="wei">尾页</button>
		&nbsp;<input type="text" id="text"
			onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"
			onblur="this.v();" style="width: 80px; height: 22px"></input> &nbsp;
		<button type="button" id="tiaozhuan">跳转</button>
	</div>

	<script type="text/javascript">
					//得到标记为1的视频总数
					var tag1=<%=request.getAttribute("tag1")%>;
<%-- 					//得到标记为2的视频总数
					var tag2=<%=request.getAttribute("tag2")%>;
					//得到标记为3的视频总数
					var tag3=<%=request.getAttribute("tag3")%>; --%>
					//每页显示多少个
					var tag4=<%=request.getAttribute("tag4")%>;
					
					
			var dangqianye = 0;//页面加载时 默认当前页为 0
			//需要查询的标记 标记为1 2 3
			var State = 1;
			//页面当前页
			var page = 1;
			var html = "";
					</script>
	<script src="<%=request.getContextPath()%>/static/adminjs/liebiao.js"></script>
	</div>
	<div class="clearfix"></div>
	</div>
	</div>
	</div>

	<div class="clearfix"></div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
</body>
</html>