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


<title>屄哩屄哩-论坛</title>
<link
	href="<%=request.getContextPath()%>/static/Forum/css/bootstrap.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/static/Forum/css/bootstrap-responsive.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/static/Forum/css/application.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/static/Forum/js/jquery.js"
	type="text/javascript"></script>
<style type="text/css">
.fastlg_fm {
	float: left;
	clear: right;
}

.user-panel-mini {
	width: 300px;
}

.input-medium {
	width: 130px;
}
</style>

<script src="<%=request.getContextPath()%>/static/Forum/js/common.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="span4"></div>
			<div class="span8">
				<div class="well well-small pull-right user-panel-mini">
					<script src="<%=request.getContextPath()%>/static/Forum/js/logging.js" type="text/javascript"></script>
					<c:choose>
							<c:when
								test="${sessionScope.userName==''||sessionScope.userName==null}">
								<form action="loginforum.sf" method="post">
									<div class="controls controls-row">
										<input class="input-medium" type="text" name="username"
											id="ls_username" class="px vm xg1" placeholder="用户名"
											tabindex="901" /> <input class="input-medium"
											placeholder="密码" type="password" name="password"
											id="ls_password" class="px vm" autocomplete="off"
											tabindex="902" />
									</div>
									<ul class="nav nav-pills" style="margin-bottom: 0px">
										<li><a href="zhuce.sf" class="xi2 xw1"
											style="color: #000000; font-size: 14px">立即注册</a></li>
										<li><li class="pull-right" style="padding-top: 4px;"><label
											class="checkbox"
											style="margin-right: 10px; float: left; margin-top: 4px;">
									<input type="checkbox" name="cookietime" id="ls_cookietime"
												class="pc" value="" tabindex="903" />自动登录
							</label>

								<button type="submit" class="btn btn-primary pull-left"
												tabindex="904" style="width: 75px;">登录</button></li>
						</ul>
				</form>
								</c:when>
								<c:when
								test="${sessionScope.userName!=''||sessionScope.userName!=null}">
										<div class="controls controls-row">
											欢迎你的登录:${sessionScope.userName}
										</div>
										<div>
											<a href="logoone.sf" class="xi2 xw1"
												style="color: #000000; font-size: 14px">返回首页</a>
												
												<a href="forum.sf" class="xi2 xw1"
												style="color: #000000; font-size: 14px">返回论坛</a>
										</div>
								</c:when>
								
								<c:otherwise>
									<form action="loginforum.sf" method="get">
						<div class="controls controls-row">
							<input class="input-medium" type="text" name="username"
											id="ls_username" class="px vm xg1" placeholder="用户名"
											tabindex="901" /> <input class="input-medium"
											placeholder="密码" type="password" name="password"
											id="ls_password" class="px vm" autocomplete="off"
											tabindex="902" />
						</div>
						<ul class="nav nav-pills" style="margin-bottom: 0px">
							<li><a href="" class="xi2 xw1"
											style="color: #000000; font-size: 14px">立即注册</a></li>
							<li>
							
										<li class="pull-right" style="padding-top: 4px;"><label
											class="checkbox"
											style="margin-right: 10px; float: left; margin-top: 4px;">
									<input type="checkbox" name="cookietime" id="ls_cookietime"
												class="pc" value="" tabindex="903" />自动登录
							</label>

								<button type="submit" class="btn btn-primary pull-left"
												tabindex="904" style="width: 75px;">登录</button></li>
						</ul>
				</form>
								
								</c:otherwise>
							</c:choose>
					<script src="<%=request.getContextPath()%>/static/Forum/js/md5.js" type="text/javascript" reload="1"></script>
				</div>
			</div>
		</div>
	</div>
	<div class="container"">
		<div class="navbar ">
			<div class="navbar-inner ">
				<div class="container ">
					<a class="btn btn-navbar " data-toggle="collapse "
						data-target=".nav-collapse "> <span class="icon-bar "></span>
						<span class="icon-bar "></span> <span class="icon-bar "></span>
					</a>
					<div class="nav-collapse collapse ">
						<ul class="nav ">
							<li class="active " id="mn_forum "><a href="forum.sf"
								hidefocus="true " title="BBS ">论坛<span>BBS</span></a></li>
							<li class="active " id="mn_forum "><a href="logoone.sf"
								hidefocus="true " title="BBS ">首页<span>BBS</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<style>
</style>
		<div class="title-frame title-frame-big ">

			<div class="container ">
				<div id="chart " class="bm bw0 cl small-bar ">

					<div class="chart z ">
						今日: <em><span style="color: red">${onedaycount}</span></em><span class="pipe ">|</span>昨日: <em><span style="color: red">${yessdaycount }</span></em><span
							class="pipe ">|</span>帖子: <em><span style="color: red">${messacount }</span></em><span class="pipe ">|</span>会员:
						<em><span style="color: red">${usercount}位</span></em>
						|一周内: <em><span style="color: red">${servedatcount}</span></em>
						<span class="pipe ">|</span>欢迎新会员: <em><span style="color: red">${userNamemessage} </span></em>
						<span style="color: red;margin-left: 20%">2分钟更新一次</span>
					</div>
						
				
				</div>


			</div>
		</div>


		<style id="diy_style " type="text/css ">#portal_block_71 {  margin-right:0px !important;margin-bottom:8px !important;}#portal_block_70 {  margin-bottom:8px !important;}</style>

		<div id="ct " class=" ">

			<div class=" ">


				<div class=" ">
					<div class="title-frame title-frame-big flg ">
						<div class="title ">
							<span class="o pull-right "> <img id="category_705_img "
								src="picture/collapsed_no.gif " title="收起/展开 " alt="收起/展开 "
								onclick="toggle_collapse( 'category_705'); " />
							</span>
							<h2>
								<a href="javascript:void(0);" style="">嘀哩嘀哩</a>
							</h2>
						</div>
						<div id="category_705 " class="bm_c category " style="">
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_343_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum"
											style="color: #FF0000; font-weight: bold;">热门动漫讨论区</a><em
											class="xw0 xi1 " title="今日 "> (27)</em>
									</h2>






									<p>
										主题:2498,&nbsp;贴数:<span title="292244 ">29万</span>
									</p>
									<p></p>





								</div>




							</div>
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_707_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">嘀哩搞基（姬）区</a><em
											class="xw0 xi1 " title="今日 "> (19)</em>
									</h2>






									<p>
										主题:5265,&nbsp;贴数:<span title="417885 ">41万</span>
									</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:<span
											title="2017-8-14 16:04 ">1&nbsp;小时前</span>
										</a>
									</p>





								</div>




							</div>
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_709_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">嘀哩嘀哩资源区</a><em
											class="xw0 xi1 " title="今日 "> (306)</em>
									</h2>






									<p>
										主题:3405,&nbsp;贴数:<span title="516768 ">51万</span>
									</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:<span
											title="2017-8-14 17:49 ">32&nbsp;秒前</span>
										</a>
									</p>





								</div>




							</div>
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_708_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">嘀哩嘀哩报错寻番</a><em
											class="xw0 xi1 " title="今日 "> (10)</em>
									</h2>






									<p>
										主题:<span title="10995 ">1万</span>,&nbsp;贴数:<span
											title="21418 ">2万</span>
									</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:<span
											title="2017-8-14 17:37 ">12&nbsp;分钟前</span>
										</a>
									</p>





								</div>




							</div>
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_762_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">FAQ反馈建议</a>
									</h2>






									<p>主题:171,&nbsp;贴数:1563</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:<span
											title="2017-8-13 23:17 ">昨天&nbsp;23:17</span>
										</a>
									</p>





								</div>




							</div>

						</div>
					</div>
					<div class="title-frame title-frame-big flg ">
						<div class="title ">
							<span class="o pull-right "> <img id="category_594_img "
								src="<%=request.getContextPath()%>/static/Forum/picture/collapsed_no.gif " title="收起/展开 " alt="收起/展开 "
								onclick="toggle_collapse( 'category_594'); " />
							</span>
							<h2>
								<a href="Forum" style="">ACG资源</a>
							</h2>
						</div>
						<div id="category_594 " class="bm_c category " style="">
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_557_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">萌娘资源</a><em
											class="xw0 xi1 " title="今日 "> (4)</em>
									</h2>





									<p style="width: 130px">
										<a href="javascript:void(0);">专题</a>
									</p>





								</div>




							</div>
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_779_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">D站评论</a><em
											class="xw0 xi1 " title="今日 "> (186)</em>
									</h2>






									<p>
										主题:<span title="54871 ">5万</span>,&nbsp;贴数:<span
											title="346496 ">34万</span>
									</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:<span
											title="2017-8-14 17:48 ">1&nbsp;分钟前</span>
										</a>
									</p>





								</div>




							</div>
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_764_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum"
											style="color: #FF0000; font-weight: bold;">二次元音乐</a>
									</h2>






									<p>主题:43,&nbsp;贴数:718</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:<span
											title="2017-8-13 10:54 ">昨天&nbsp;10:54</span>
										</a>
									</p>





								</div>




							</div>

						</div>
					</div>
					<div class="title-frame title-frame-big flg ">
						<div class="title ">
							<span class="o pull-right "> <img id="category_755_img "
								src="<%=request.getContextPath()%>/static/Forum/picture/collapsed_no.gif " title="收起/展开 " alt="收起/展开 "
								onclick="toggle_collapse( 'category_755'); " />
							</span>
							<h2>
								<a href="Forum" style="">手游专区</a>
							</h2>
						</div>
						<div id="category_755 " class="bm_c category " style="">
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_778_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">死神斩魂</a>
									</h2>






									<p>主题:11,&nbsp;贴数:23</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:2017-8-3
											23:41 </a>
									</p>





								</div>




							</div>
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_763_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">阴阳师手游</a>
									</h2>






									<p>主题:20,&nbsp;贴数:197</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:2017-8-4
											01:52 </a>
									</p>





								</div>




							</div>
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_770_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">甲铁城的卡巴内瑞</a>
									</h2>






									<p>主题:8,&nbsp;贴数:197</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:2017-8-4
											19:36 </a>
									</p>





								</div>




							</div>

						</div>
					</div>
					<div class="title-frame title-frame-big flg ">
						<div class="title ">
							<span class="o pull-right "> <img id="category_8_img "
								src="<%=request.getContextPath()%>/static/Forum/picture/collapsed_no.gif " title="收起/展开 " alt="收起/展开 "
								onclick="toggle_collapse( 'category_8'); " />
							</span>
							<h2>
								<a href="Forum" style="">站务管理</a>
							</h2>
						</div>
						<div id="category_8 " class="bm_c category " style="">
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_703_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">官方通告</a>
									</h2>






									<p>主题:259,&nbsp;贴数:3641</p>
									<p>
										<a href="javascript:void(0);" class="xi2 ">最后:<span
											title="2017-8-11 10:50 ">3&nbsp;天前</span>
										</a>
									</p>





								</div>




							</div>
							<div class="forum-block ">
								<div class="icon ">
									<!--<br/>-->
									<a href="Forum"><img
										src="<%=request.getContextPath()%>/static/Forum/picture/common_38_icon.png " align="left " alt=" " /></a>
								</div>




								<div class="info ">
									<h2>
										<a href="Forum" style="font-weight: bold;">申请事务所</a>
									</h2>






									<p>主题:1010,&nbsp;贴数:3997</p>
									<p>最后:从未</p>





								</div>




							</div>

						</div>
					</div>
				</div>
</body>
</html>