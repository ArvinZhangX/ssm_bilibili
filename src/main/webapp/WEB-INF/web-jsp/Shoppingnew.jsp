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
<title>屄哩屄哩-周边商品</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/Shoppingcss/new/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/Shoppingcss/new/css/style.css">
<script
	src="<%=request.getContextPath()%>/static/Shoppingcss/new/js/jquery-1.11.3.min.js"></script>
<script
	src="<%=request.getContextPath()%>/static/Shoppingcss/new/js/shop.min.js"></script>

</head>
<body>
	<div style="background-color: #6C89B2; width: 100%; height: 40px">
		<div style="margin-left: 90%;">
			<%
				if (request.getSession().getAttribute("userName") == null) {
			%>
			<button class="btn btn-primary ladda-button" data-style="expand-left"
				id="login">
				<span class="ladda-label"><a href="login.sf"
					style="font-size: 10px; color: black; text-decoration: none">登录</a></span>
			</button>

			<button class="btn btn-primary ladda-button" data-style="expand-left">
				<span class="ladda-label"><a href="zhuce.sf"
					style="font-size: 10px; color: black; text-decoration: none"
					id="zhuce">注册</a></span>
			</button>
			<%
				} else {
			%>

			<button class="btn btn-primary ladda-button" data-style="expand-left"
				id="userxinxi"">
				<span class="ladda-label"><a href="User_full_information.sf"
					style="font-size: 10px; color: white; text-decoration: none">
						欢迎你的登录: <span style="color: red"><%=request.getSession().getAttribute("userName")%>
					</span>

				</a></span>
			</button>

			<%
				}
			%>
		</div>

	</div>

	<div align="left"
		style="margin-left: 93%; margin-top: 300px; position: fixed; z-index: 999;">
		<a href="gouwuche.sf" style="color: white; background: red;">查看购物车</a>
		<div>&nbsp;&nbsp;</div>
		<a href="index.sf" style="color: white; background: red;">返回首页</a>
		<script type="text/javascript"></script>
	</div>





	<div class="ct-pageWrapper">
		<main>
		<div class="container">
			<div class="row"></div>
			<div class="col-md-9">
				<div class="row">
					<c:forEach items="${gridslist}" var="gridslist">
						<div class="col-sm-4">
							<div class="ct-product">
								<div class="image">
									<a href="gridspay.sf?girdsID=${gridslist.gridsID}"><img
										src="<%=request.getContextPath()%>${gridslist.girdsimg}"
										alt="${gridslist.girdsName}"></a>
								</div>
								<div class="inner">
									<h2 class="ct-product-title">
										<a href="gridspay.sf?girdsID=${gridslist.gridsID}">${gridslist.girdsName}</a>
									</h2>
									<p class="ct-product-description"></p>
									<span class="ct-product-price">$ ${gridslist.girdsjiage}</span>
								</div>
							</div>
						</div>
						<br>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>