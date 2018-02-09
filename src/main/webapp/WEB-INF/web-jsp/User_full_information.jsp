<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/User_Data_Update/css/jiazaitoubu.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/User_Data_Update/css/css.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/User_Data_Update/css/center.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/User_Data_Update/city/city.css"
	type="text/css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/User_Data_Update/css/shangchuan.css"
	type="text/css" />

<!-- <script src="<%=request.getContextPath()%>/static/User_Data_Update/"></script> -->
<script
	src="<%=request.getContextPath()%>/static/User_Data_Update/js/jquery-1.8.3.min.js"></script>
<script
	src="<%=request.getContextPath()%>/static/User_Data_Update/js/index2.js"></script>
<script
	src="<%=request.getContextPath()%>/static/User_Data_Update/js/index2.js"></script>

<script type="text/javascript">

//显示灰色 jQuery 遮罩层 
function showBg() {
	var bh = $("body").height();
	var bw = $("body").width();
/* 	$("#sid").click(function(){
		//alert("123");
		 window.open("Shangchuan.jsp","_blank","toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes, width=400, height=200");

	});  */
	
	$("#fullbg").css({
		height: bh,
		width: bw,
		display: "block"
	});
	$("#dialog").show();
	}
		//关闭灰色 jQuery 遮罩 
		function closeBg() {
			$("#fullbg,#dialog").hide();
		}
		
		
</script>


<title>屄哩屄哩-用户信息</title>
</head>
<body>
	<!-- 这里是上传头像界面 -->
	<div id="dialog">
		<p class="close">
			<a href="User_full_information.sf" onclick="closeBg();">关闭</a>
		</p>
		<!-- <div>正在加载，请稍后....</div> -->
		<div>

			<form method="post" action="UploadServlet"
				enctype="multipart/form-data">
				选择一个文件: <input type="file" name="uploadFile" /> <br /> <input
					type="submit" id="sid" value="上传" />
		</div>
		</form>


		进度条
	</div>
	</div>

	<!-- 这里是上传头像界面 -->

	<div class="top" id="wyqtb">
		<!--热门搜索-->

		<!--导航-->
		<div class="dao_hang" style="background-color: #6C89B2;">


			<!--结束-->
			<div class="dao_list">
				<a href="index.sf">首页</a> <a href="javascript:return false;">视频收藏</a> <a href="Shopping.sf">周边</a>
				<a href="javascript:return false;">小黑屋</a>
			</div>
		</div>
	</div>
	<script>
window.onload=function(){
	$(".aside").css({display:"none"})
	$(".important").mouseenter(function(){
		$(".aside").css({display:"block"})
		}).mouseleave(function(){
			$(".aside").css({display:"none"})
			})
	}
</script>
	<!--当前位置-->
	<div class="now_positionm">
		<span>当前位置：</span><a href="index.sf">首页></a><a
			href="User_full_information.sf">个人中心</a>
	</div>
	<!--centers-->
	<div class="centers_m">
		<!--清除浮动-->
		<div class="clear_sm"></div>
		<!--left-->
		<div class="centers_ml">
			<!--头像-->
			<div class="center_header">
				<a href="User_full_information.sf"><img
					src="<%=request.getContextPath()%>${user.userHand}" /></a> <em>您好，<font>${user.userName}</font></em>
				<!-- <a href="">上传头像</a></font>	 -->
				<font style="color: red; font-size: 10px;">(下方可修改资料~喵) 
			</div>
			<!--列表go-->
			<div class="centers_listm">
				<div class="centers_listm_one">
					<img
						src="<%=request.getContextPath()%>/static/User_Data_Update/images/zshy.png" />
					<em>会员中心</em>
				</div>
				<!--一条开始-->
				<div class="centers_listm_one_in">
					<img
						src="<%=request.getContextPath()%>/static/User_Data_Update/images/shezhi.png" />
					<em>资料管理</em> <b></b>
				</div>

				<span class="gjszmdm"> <a href="javascript:showBg();"
					class="center_in_self"><font id="shangchuan">上传头像</font></a> <!-- <input type="submit" id="sid" class="center_in_self" value="上传头像" /> -->
					<a href="Information.sf" class="center_in_self"><font>信息资料</font></a>
					<a href="Bank_Card.sf" class="center_in_self"><font>银行卡管理</font></a>
					<a href="Delivery_address.sf" class="center_in_self"><font>收货地址管理</font></a>
				</span>
				<!--一条开始-->
				<div class="centers_listm_one_in">
					<img
						src="<%=request.getContextPath()%>/static/User_Data_Update/images/ddgl.png" />
					<em>订单管理</em> <b></b>
				</div>
			<span class="gjszmdm"> <a href="Order.sf" class="center_in_self"><font>我的订单</font></a>
					<a href="DeletOrder" class="center_in_self"><font>已删除订单</font></a> <a
					href="javascript:return false;" class="center_in_self"><font>订单投诉</font></a>
				</span>

				<%-- <!--一条开始-->
				<div class="centers_listm_one_in">
					<img
						src="<%=request.getContextPath()%>/static/User_Data_Update/images/wdssc.png" />
					<em>收藏管理</em> <b></b>
				</div>
				<span class="gjszmdm"> <a href="#" class="center_in_self"><font>店铺收藏</font></a>
					<a href="#" class="center_in_self"><font>菜品收藏</font></a>
				</span> --%>

			</div>
			<script type="text/javascript">
		$(function(){//第一步都得写这个
			$(".centers_listm_one_in").click(function(){
				$(this).next(".gjszmdm").slideToggle().siblings("gjszmdm").slideUp()
			});
			
				//弹出上传头像界面
		

		})
		</script>
		</div>
		<!--right-->
		<div class="centers_mr">
			<h1 class="welcom_tm">
				欢迎您，超级会员 <font><%=request.getSession().getAttribute("userName")%></font>！您上次登录时间为 2016-10-28 14:23
				
				<div class="gezhong_szm_in" style="margin-top: -50px;margin-left: 40px">
						<a href="exect.sf">切换账号</a>
						<a href="videoFileTop">我要投稿</a>
						</div>
			</h1>
			<!--一条开始-->
			<div>您的账户当前余额为: 　${user.userRMB}　元</div>
			<div class="public_m1">
				<div class="public_m2">账户安全</div>
				<div class="public_m4">
					<p>
						<em>您当前的安全等级：</em><i style="color: #fa3b4a">高</i>
					</p>
				</div>
				<!--各种设置-->
				<div class="gezhong_szm">
					<!--一条开始a-->
					<div class="gezhong_szm_in">
						<b
							style=" background:url(<%=request.getContextPath()%>/static/User_Data_Update/images/fourm.png) no-repeat 0 0"></b>
						<span>登录密码<br>
						<em>已设置</em></span>
						<p>安全性高的密码，可以使账户更安全。建议您定期更换密码。安全性高的密码，可以使账户更安全。建议您定期更换密码。安全性高的密码，可以使账户更安全。建议您定期更换密码。</p>
						<a href="Update_login_password.sf">修改密码</a>
					</div>
					<!--一条开始a-->
					<div class="gezhong_szm_in">
						<b
							style=" background:url(<%=request.getContextPath()%>/static/User_Data_Update/images/fourm.png) no-repeat 0 -50px"></b>
						<span>邮箱绑定<br>
						<em>Email</em></span>
						<p>进行邮箱验证后，可用于接收敏感操作的身份验证信息，以及订阅更优惠商品的促销邮件。</p>
						<a href="Update_email.sf">绑定邮箱</a>
					</div>
					<!--一条开始a-->
					<div class="gezhong_szm_in">
						<b
							style=" background:url(<%=request.getContextPath()%>/static/User_Data_Update/images/fourm.png) no-repeat 0 -100px"></b>
						<span>手机绑定<br>
						<em>Phone</em></span>
						<p>进行手机验证后，可用于接收敏感操作的身份验证信息，以及进行积分消费的验证确认，非常有助于保护您的账号和账户财产安全。</p>
						<a href="Update_Phone.sf">修改手机</a>
					</div>
					<!--一条开始a-->
					<div class="gezhong_szm_in">
						<b
							style=" background:url(<%=request.getContextPath()%>/static/User_Data_Update/images/fourm.png) no-repeat 0 -150px"></b>
						<span>支付密码<br>
						<em>Password</em></span>
						<p>设置支付密码后，在使用账户中余额时，需输入支付密码。</p>
						<a href="Update_PayPassword.sf">修改密码</a>
					</div>
				</div>
			</div>
</body>
</html>