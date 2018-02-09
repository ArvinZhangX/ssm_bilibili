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
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="<%=request.getContextPath()%>/static/Homepage/js/jquery.min.js"></script>
	
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/videoPlay/css/fz-video.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/videoPlay/font/iconfont.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/video/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/video/css/dashboard.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/video/css/fz-video.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/video/css/popuo-box.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/Homepage/video/css/style.css">


<style type="text/css">
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";background:#121212;}

/* slider */
.wp{position:relative;width:100%;height:600px;overflow:hidden;margin:20px auto;border:1px solid #121212;background:#fff;}

.slider{position:absolute;width:760px;padding:0 20px;left:0;top:0;}
.fl{float:left}
.slider img{display:block;padding:2px;border:1px solid #ccc} 
.slider li{padding:20px 0;border-bottom:1px dashed #ccc;overflow:hidden;width:100%}
.slider p{font-size:12px;margin:0;padding-left:68px;color:#333;line-height:20px;}
</style>


<style>
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code,
	form, fieldset, legend, input, button, textarea, p, blockquote, th, td
	{
	margin: 0;
	padding: 0;
}

body {
	background: #fff;
	color: #555;
	font-size: 14px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}

td, th, caption {
	font-size: 14px;
}

h1, h2, h3, h4, h5, h6 {
	font-weight: normal;
	font-size: 100%;
}

address, caption, cite, code, dfn, em, strong, th, var {
	font-style: normal;
	font-weight: normal;
}

a {
	color: #555;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

img {
	border: none;
}

ol, ul, li {
	list-style: none;
}

input, textarea, select, button {
	font: 14px Verdana, Helvetica, Arial, sans-serif;
}

table {
	border-collapse: collapse;
}

html {
	overflow-y: scroll;
}

.clearfix:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

.clearfix {
	*zoom: 1;
}

/*body{ font-family: "微软雅黑"; background-color: #292929; 	}*/
#testBox {
	width: 80%;
	height: 537px;
	margin: 0 auto;
}
</style>


<title>屄哩屄哩-视频区</title>
</head>
<body>
<div style="width: 100%;height: 40px;" >
<div style="background-color: #6C89B2;">
		<div style="margin-left: 90%;">
	 
			<%
				if (request.getSession().getAttribute("userName") == null) {
			%>
			<button class="btn btn-primary ladda-button" data-style="expand-left" id="login">
				<span class="ladda-label"><a href="login.sf"
					style="font-size: 10px; color: white; text-decoration: none" >登录</a></span>
			</button>

			<button class="btn btn-primary ladda-button" data-style="expand-left" id="zhuce">
				<span class="ladda-label"><a href="zhuce.sf"
					style="font-size: 10px; color: white; text-decoration: none" >注册</a></span>
			</button>
			<%
				} else {
			%>


			<button class="btn btn-primary ladda-button" data-style="expand-left" id="userxinxi">
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



</div>









	<div id="testBox"></div>
	<script
		src="<%=request.getContextPath()%>/static/Homepage/videoPlay/js/fz-video.js"></script>
	<script>
			
		var FZ_VIDEO = new createVideo("testBox", //容器的id
		{	
			
			url : '/bilibili<%=request.getAttribute("dizhi")%>', //视频地址
			autoplay : true
		//是否自动播放
		});
	</script>



	<!-- 评论区 -->
	<div class="all-comments" >
		<div class="all-comments-info">
		<!-- 这里是自定义的js -->
	<script
	src="<%=request.getContextPath()%>/static/adminjs/videojs.js"></script>
		
			<div class="box">
				<!-- <form action="messageuser.sf" method="post"> -->
<!-- 					<input
						type="text" placeholder="标题" required="" name="message"> -->
						<input type="text" id="shipingID" style="display: none" name="shipingID" value="<%=request.getAttribute("shipingID")%>">
					
						<textarea  placeholder="请输入留言内容---------内容不超过150字" id="message" required="" name="message" ></textarea>
					<input type="button" id="button" value="发表">
					<div class="clearfix"></div>
				<!-- </form> -->
			</div>
			<!--<div class="all-comments-buttons">
								<ul>
									<li><a href="#" class="top">Top Comments</a></li>
									<li><a href="#" class="top newest">Newest First</a></li>
									<li><a href="#" class="top my-comment">My Comments</a></li>
								</ul>
							</div>-->
		</div>
		
<script type="text/javascript">
function H$(i){
	return document.getElementById(i)
}
function H$$(c, p){
	return p.getElementsByTagName(c)
}
var slider = function(){
	function init(o){
		this.id = o.id;
		this.at = o.auto ? o.auto : 3;
		this.o = 0;
		this.pos();
	}
	init.prototype = {
		pos : function(){
			clearInterval(this.__b);
			this.o = 0;
			var el = H$(this.id), li = H$$('li', el), l = li.length;
			var _t = li[l-1].offsetHeight;
			var cl = li[l-1].cloneNode(true);
			cl.style.opacity = 0; cl.style.filter = 'alpha(opacity=0)';
			el.insertBefore(cl, el.firstChild);
			el.style.top = -_t + 'px';
			this.anim();
		},
		anim : function(){
			var _this = this;
			this.__a = setInterval(function(){_this.animH()}, 20);
		},
		animH : function(){
			var _t = parseInt(H$(this.id).style.top), _this = this;
			if(_t >= -1){
				clearInterval(this.__a);
				H$(this.id).style.top = 0;
				var list = H$$('li',H$(this.id));
				H$(this.id).removeChild(list[list.length-1]);
				this.__c = setInterval(function(){_this.animO()}, 20);
				//this.auto();
			}else {
				var __t = Math.abs(_t) - Math.ceil(Math.abs(_t)*.07);
				H$(this.id).style.top = -__t + 'px';
			}
		},
		animO : function(){
			this.o += 2;
			if(this.o == 100){
				clearInterval(this.__c);
				H$$('li',H$(this.id))[0].style.opacity = 1;
				H$$('li',H$(this.id))[0].style.filter = 'alpha(opacity=100)';
				this.auto();
			}else{
				H$$('li',H$(this.id))[0].style.opacity = this.o/100;
				H$$('li',H$(this.id))[0].style.filter = 'alpha(opacity='+this.o+')';
			}
		},
		auto : function(){
			var _this = this;
			this.__b = setInterval(function(){_this.pos()}, this.at*1000);
		}
	}
	return init;
}();
</script>
		<script type="text/javascript">
		
			/* $(document).ready(function(){
			 	//alert("测试");//打算在页面加载时 用ajax 根据用户名查询出用户的头像地址
				$.post("userHand",function(test){
					var ht=eval("("+test+")");
					 $.each(ht,function(index,m){
					        
					       });
					 	//alert(html);
					 $("#userHand").html(html);
			});
			});  */
		</script>
			<div align="center"><button type="button" id="buttonhide">动态留言板</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="buttonhide2">静态留言板</button></div>
		<div class="wp"  style="background-color: #E8E8E8" id="danmu">
			<ul id="slider" class="slider">
			<c:forEach items="${messagelist}" var="messagelist">
				<li>
					<a class="fl" href=""><img src="<%=request.getContextPath()%>${messagelist.messageHand}" alt="" width="70px";height="70px" /></a>
					<p>${messagelist.message}</p>
					<br>
					<p style="color: red;">留言者:<a href="" style="color: darkgoldenrod;text-decoration:none;">&nbsp;${messagelist.messageuserName}</a><span style="color: blue;">&nbsp;&nbsp;&nbsp;留言时间:${messagelist.messageTime}</span></p>
				</li>
			</c:forEach>	
			</ul>
		</div>
		
		<script type="text/javascript">
				/* $("#buttonhide").click(function(){
					$("#buttonhide").html("不行 不行! 还是动的弹幕好看!");
					$("#danmu").hide();
				}); */
				$(document).ready(function(){
						$("#danmu").hide();
						$("#texthide").hide();
					$("#buttonhide").click(function(){
						$("#danmu").show();
						$("#texthide").hide();
					});
					
					$("#buttonhide2").click(function(){
						$("#danmu").hide();
						$("#texthide").show();
						
					});
					
					$("#huifu").click(function(){
						//alert("回复未实现!");
						//这里点击之后弹出一个div
						$("#woyaochakan").show();
						
					});
					
					
				});
				
				
		
		</script>

				<style type="text/css">
				*{
				margin:0;padding:0;
				-webkit-touch-callout: none; /* prevent callout to copy image, etc when tap to hold */
				-webkit-text-size-adjust: none; /* prevent webkit from resizing text to fit */
				-webkit-tap-highlight-color: rgba(210,210,210,0.35); /* make transparent link selection, adjust last value opacity 0 to 1.0 */
				-webkit-user-select: none; /* prevent copy paste, to allow, change 'none' to 'text' */
				}
				body{font-family:"微软雅黑";font-size:12px;}
				ul,li{list-style:none;}
				.ylcon{width:100%;min-width:320px;}
				.tit{height:26px;line-height:26px;padding:0px 15px;position:relative;font-size:15px;color:#aaa;border-bottom:1px solid rgba(0, 0, 0, 0.15);}
				 
				.story{border-bottom:1px dashed #cecece;padding:0 15px 3px;position:relative;}
				.story_t{font-size:1.2em;color:rgba(0,0,0,1);padding-top:5px;padding-bottom:2px;}
				.story_m{color:rgba(110,110,110,1);line-height:21px;word-break:break-all;word-wrap:break-word;overflow:hidden;font-size:1.2em;padding:2px 0;}
				.story_time{color:rgba(154,154,154,1);padding:2px 0;}
				.story_hf{background:rgb(245,245,245);font-size:1.2em;border:1px solid rgba(204,204,204,0.2);border-radius:2px;color:rgba(110,110,110,1);padding:4px;margin-bottom:5px;}
				.opbtn{position:absolute;top: 0;right: 0;}
				</style>
							<div class="ylcon" id="texthide">
							<p class="tit">
							所有留言
							</p>
							<div id="messDivId">
							<c:forEach items="${messagelist}" var="messagelist">
							<div class="story">
							<div class="opbtn"></div>
							<p class="story_t">${messagelist.messageuserName}<span style="margin-left: 85%;">
							<button type="button" value="查看留言" id="huifu">查看回复</button>   <button type="button" value="查看留言" id="liuyan">我要留言</button></span>
							
							</p>
							<p class="story_time">${messagelist.messageTime}</p>
							<!--<span style="margin-left: 90%;"><button type="button" value="查看留言">查看留言</button></span>-->
							<p class="story_m">${messagelist.message}</p>
							</div>
							<div id="woyaochakan" style="display: none">这 里可以查看</div>	
							</c:forEach>
							
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
				new slider({id:'slider'})
				</script>




</body>
</html>