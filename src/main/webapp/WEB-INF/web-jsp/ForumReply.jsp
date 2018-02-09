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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/Forum/css/style_4_common_1.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/Forum/css/style_4_forum_viewthread.css" />
<script
	src="<%=request.getContextPath()%>/static/Homepage/js/jquery.min.js"></script>
<title>屄哩屄哩-帖子详细</title>
</head>
<body id="nv_forum" class="pg_viewthread"
	onkeydown="if(event.keyCode==27) return false;">
	<div id="append_parent"></div>
	<div id="ajaxwaitid"></div>

	</div>

	<div id="hd">
		<div class="wp">
			<div class="hdc cl margin-top-bottom">
				<div class="login-container" align="center">
					<div class="well well-small pull-right user-panel-mini">
						<script
							src="<%=request.getContextPath()%>/static/Forum/js/logging.js"
							type="text/javascript"></script>

						<input type="hidden" name="quickforward" value="yes" /> <input
							type="hidden" name="handlekey" value="ls" />
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
						<script src="" type="text/javascript" reload="1"></script></div>
										
				</div>

			</div>

			<div id="nv">

				<ul class="nav ">
							<li class="active " id="mn_forum "><a href="forum.sf"
								hidefocus="true " title="BBS ">论坛<span>BBS</span></a></li>
							<li class="active " id="mn_forum "><a href="logoone.sf"
								hidefocus="true " title="BBS ">首页<span>BBS</span></a></li>
						</ul>
			</div>

		</div>
	</div>
	<div id="wp" class="wp">
		<script type="text/javascript">
			var fid = parseInt('343'), tid = parseInt('618506');
		</script>

		<div class="wp">
			<!--[diy=diy1]-->
			<div id="diy1" class="area"></div>
			<!--[/diy]-->
		</div>

		<div id="ct" class="wp cl">


			<div id="postlist" class="pl bm btr bbr">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td class="pls ptn pbn"></td>
						<td class="plc ptm pbn vwthd">

							<h1 class="ts">
								<span id="thread_subject">${user.forumBT }</span>
							</h1>

						</td>
					</tr>
				</table>

				<table cellspacing="0" cellpadding="0" class="ad">
					<tr>
						<td class="pls"></td>
						<td class="plc"></td>
					</tr>
				</table>
				<div id="post_4555646">
					<table id="pid4555646" class="plhin" summary="pid4555646"
						cellspacing="0" cellpadding="0">
						<tr>
							<td class="pls" rowspan="2">
								<div id="favatar4555646" class="pls favatar">
									<a name="newpost"></a> <a name="lastpost"></a>
									<div class="pi">
										<div class="authi">
											<a href="" target="_blank" class="xw1" style="color: #333333">${user.forumuserName }</a>
										</div>
									</div>

									<div>
										<div class="avatar"
											onmouseover="showauthor(this, 'userinfo4555646')">
											<a href="" class="avtm" target="_blank"><img
												src="<%=request.getContextPath()%>${user.firumhand }" /></a>
										</div>
									</div>





									<dl class="pil cl"></dl>

									<!--onclick="showWindow('sendpm', this.href);"-->
								</div>
							</td>

							<td class="plc">
								<div class="pi">


									<div class="pti">
										<div class="pdbt"></div>
										<div class="authi">
											<a href="" target="_blank" class="xi2 z small-avatar"
												style="padding-right: 10px;"><img
												src="<%=request.getContextPath()%>${user.firumhand }" /></a><img
												class="authicn vm" id="authicon4555646"
												src="<%=request.getContextPath()%>${user.firumhand }" /> <em
												id="authorposton4555646">发表于 <span
												title="${user.forumTime }">${user.forumTime }</span></em>
										</div>
									</div>
								</div>
								<div class="pct">
									<style type="text/css">
.pcb {
	margin-right: 0
}
</style>
									<div class="pcb">

										<div class="t_fsz">
											<table cellspacing="0" cellpadding="0">
												<tr>
													<td class="t_f" id="postmessage_4555646"><br />
														<div align="left">${user.forummessage }</div>
														
														<br /></td>
												</tr>
											</table>

										</div>
										<div id="comment_4555646" class="cm"></div>

										<div id="post_rate_div_4555646"></div>
									</div>
								</div>

							</td>
						</tr>
						<tr>
							<td class="plc plm"></td>
						</tr>
						<tr id="_postposition4555646"></tr>
						<tr>
							<td class="pls"></td>
							<td class="plc" style="overflow: visible;">
								<div class="po hin">
									<div class="pob cl">



										<ul id="mgc_post_4555646_menu" class="p_pop mgcmn"
											style="display: none;">
										</ul>
										<script type="text/javascript" reload="1">
											checkmgcmn('post_4555646')
										</script>
									</div>
								</div>
							</td>
						</tr>
						<tr class="ad">
							<td class="pls"></td>
							<td class="plc"></td>
						</tr>
					</table>
				</div>
				<div id="postlistreply" class="pl">
					<div id="post_new" class="viewthread_table" style="display: none"></div>
				</div>
			</div>
<!-- ----------------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------------- -->
<c:forEach items="${forumre}" var="forumre">
		
<div id="wp" class="wp">
		<script type="text/javascript">
			var fid = parseInt('343'), tid = parseInt('618506');
		</script>

		<div class="wp">
			<!--[diy=diy1]-->
			<div id="diy1" class="area"></div>
			<!--[/diy]-->
		</div>

		<div id="ct" class="wp cl">


			<div id="postlist" class="pl bm btr bbr">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td class="pls ptn pbn"></td>
						<td class="plc ptm pbn vwthd">

							<h1 class="ts">
								<%-- <span id="thread_subject">${user.forumBT }</span> --%>
							</h1>

						</td>
					</tr>
				</table>

				<table cellspacing="0" cellpadding="0" class="ad">
					<tr>
						<td class="pls"></td>
						<td class="plc"></td>
					</tr>
				</table>
<div id="post_4555646">
					<table id="pid4555646" class="plhin" summary="pid4555646"
						cellspacing="0" cellpadding="0">
						<tr>
							<td class="pls" rowspan="2">
								<div id="favatar4555646" class="pls favatar">
									<a name="newpost"></a> <a name="lastpost"></a>
									<div class="pi">
										<div class="authi">
											<a href="" target="_blank" class="xw1" style="color: #333333">${forumre.replyname}</a>
										</div>
									</div>

									<div>
										<div class="avatar"
											onmouseover="showauthor(this, 'userinfo4555646')">
											<a href="" class="avtm" target="_blank"><img
												src="<%=request.getContextPath()%>${forumre.replyhand }" /></a>
										</div>
									</div>





									<dl class="pil cl"></dl>

									<!--onclick="showWindow('sendpm', this.href);"-->
								</div>
							</td>

							<td class="plc">
								<div class="pi">


									<div class="pti">
										<div class="pdbt"></div>
										<div class="authi">
											<a href="" target="_blank" class="xi2 z small-avatar"
												style="padding-right: 10px;"><img
												src="<%=request.getContextPath()%>${forumre.replyhand }" /></a><img
												class="authicn vm" id="authicon4555646"
												src="<%=request.getContextPath()%>${forumre.replyhand }" /> <em
												id="authorposton4555646">发表于 <span
												title="${forumre.replytime }">${forumre.replytime }</span></em>
										</div>
									</div>
								</div>
								<div class="pct">
									<style type="text/css">
.pcb {
	margin-right: 0
}
</style>
									<div class="pcb">

										<div class="t_fsz">
											<table cellspacing="0" cellpadding="0">
												<tr>
													<td class="t_f" id="postmessage_4555646"><br />
														<div align="left">${forumre.replyneirong }</div>
														
														<br /></td>
												</tr>
											</table>

										</div>
										<div id="comment_4555646" class="cm"></div>

										<div id="post_rate_div_4555646"></div>
									</div>
								</div>

							</td>
						</tr>
						<tr>
							<td class="plc plm"></td>
						</tr>
						<tr id="_postposition4555646"></tr>
						<tr>
							<td class="pls"></td>
							<td class="plc" style="overflow: visible;">
								<div class="po hin">
									<div class="pob cl">



										<ul id="mgc_post_4555646_menu" class="p_pop mgcmn"
											style="display: none;">
										</ul>
										<script type="text/javascript" reload="1">
											checkmgcmn('post_4555646')
										</script>
									</div>
								</div>
							</td>
						</tr>
						<tr class="ad">
							<td class="pls"></td>
							<td class="plc"></td>
						</tr>
					</table>
				</div>
				<div id="postlistreply" class="pl">
					<div id="post_new" class="viewthread_table" style="display: none"></div>
				</div>
			</div>
			</c:forEach>
<!-- ----------------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------------- -->

			<form method="post" autocomplete="off" name="modactions"
				id="modactions">
				<input type="hidden" name="formhash" value="3253e9cf" /> <input
					type="hidden" name="optgroup" /> <input type="hidden"
					name="operation" /> <input type="hidden" name="listextra"
					value="page%3D1" /> <input type="hidden" name="page" value="1" />
			</form>


			<!--[diy=diyfastposttop]-->
			<div id="diyfastposttop" class="area"></div>
			<!--[/diy]-->
			<script type="text/javascript">
				var postminchars = parseInt('5');
				var postmaxchars = parseInt('500000');
				var disablepostctrl = parseInt('0');
			</script>

			<div id="f_pst" class="pl bm bmw">
				<form method="post" autocomplete="off" id="fastpostform"
					action="forum.php?mod=post&amp;action=reply&amp;fid=343&amp;tid=618506&amp;extra=page%3D1&amp;replysubmit=yes&amp;infloat=yes&amp;handlekey=fastpost"
					onSubmit="return fastpostvalidate(this)">
					<div class="mfastpost">
						<div>
							<div class="pls"></div>
							<div class="plc">

								<span id="fastpostreturn"></span>

								<div class="cl">
									<div id="fastsmiliesdiv" class="y">
										<div id="fastsmiliesdiv_data">
											<div id="fastsmilies"></div>
										</div>
									</div>
									<div class="hasfsl" id="fastposteditor">
										<div class="tedt">
											<div class="bar">
												<span class="y"> </span>
												<div class="fpd">
													<a href="javascript:;" title="文字加粗" class="fbld">B</a> <a
														href="javascript:;" title="设置文字颜色" class="fclr"
														id="fastpostforecolor">Color</a> <a id="fastpostimg"
														href="javascript:;" title="图片" class="fmg">Image</a> <a
														id="fastposturl" href="javascript:;" title="添加链接"
														class="flnk">Link</a> <a id="fastpostquote"
														href="javascript:;" title="引用" class="fqt">Quote</a> <a
														id="fastpostcode" href="javascript:;" title="代码"
														class="fcd">Code</a> <a href="javascript:;" class="fsml"
														id="fastpostsml">Smilies</a>
												</div>
											</div>
											<div class="area">

												<div class="pt hm">
													<textarea style="width: 98%; height: 100%;" id="message"></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>

								<input type="hidden" name="formhash" value="3253e9cf" /> <input
									type="hidden" name="usesig" value="" /> <input type="hidden"
									name="subject" value="" />
								<p class="ptm pnpost">	
									<button type="button" 
										
										name="replysubmit" id="fastpostsubmit" class="pn pnc vm"
										value="replysubmit" tabindex="5">
										<strong>发表回复</strong>
									</button>

								</p>
								
								<script type="text/javascript">
										$("#fastpostsubmit").click(function(){
											var html = "";
											var neirong = $("#message").val();//回复内容
											var id = "<%=request.getParameter("forumID")%>" 
											//回复帖子的ID  forumID
											
											if(neirong==null||neirong==""||id==null||id==""){
													alert("请键入内容在回复帖子");
											}else{
												var userName = "<%=request.getSession().getAttribute("userName")%>";
												if(userName==null||userName=="null"||userName==""){
													alert("请登录之后操作!");
												}else{
													//使用ajax传到后天提交
													$.post("forumreply.sf",{"neirong":neirong,"id":id},function(test){
														var ht=eval("("+test+")");
														//alert("1");
															$.each(ht,function(index,m){
																html+=m;
															});
															alert(html);
															//window.location.href="index.jsp"
															//window.location.href="jb51.jsp?backurl="+window.location.href; 
															html="";
															$("#message").val(" ");
														});
												}
												
											}
											
											
										})
								
								</script>
							</div>
						</div>

					</div>
				</form>
			</div>


		</div>

		<div class="wp mtn">
			<!--[diy=diy3]-->
			<div id="diy3" class="area"></div>
			<!--[/diy]-->
		</div>

	</div>


	<div id="discuz_tips" style="display: none;"></div>

</body>
</html>