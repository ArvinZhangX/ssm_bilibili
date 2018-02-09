<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>屄哩屄哩-周边商品</title>

		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/Shoppingcss/css/slippry.css">
		<script src="<%=request.getContextPath()%>/static/Shoppingcss/js/jquery.min.js"></script>

<!----webfonts---->
		
		<!----//webfonts---->
		<!----start-alert-scroller---->

		<script type="text/javascript">
		$(document).ready(function(){
			$('#demo').hide();
			$('.vticker').easyTicker();
		});
		</script>
		<!----start-alert-scroller---->
		<!-- start menu -->

		
		<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
	
		<!-- //End menu -->
		<!---slider---->

		<script>
			  jQuery('#jquery-demo').slippry({
			  // general elements & wrapper
			  slippryWrapper: '<div class="sy-box jquery-demo" />', // wrapper to wrap everything, including pager
			  // options
			  adaptiveHeight: false, // height of the sliders adapts to current slide
			  useCSS: false, // true, false -> fallback to js if no browser support
			  autoHover: false,
			  transition: 'fade'
			});
		</script>
		<!----start-pricerage-seletion---->
	
		
		<script type='text/javascript'>//<![CDATA[ 
			$(window).load(function(){
			 $( "#slider-range" ).slider({
			            range: true,
			            min: 0,
			            max: 500,
			            values: [ 100, 400 ],
			            slide: function( event, ui ) {  $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
			            }
			 });
			$( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) + " - $" + $( "#slider-range" ).slider( "values", 1 ) );
			
			});//]]>  
		</script>
		<!----//End-pricerage-seletion---->
		<!---move-top-top---->
		
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});
		</script>
		<!---//move-top-top---->
</head>
<body>
<div style="background-color: #6C89B2;width: 100%;height: 25px">
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
				id="userxinxi" ">
				<span class="ladda-label"><a href="User_full_information.sf"
					style="font-size: 10px; color: white; text-decoration: none">
						欢迎你的登录: <span style="color: red"><%=request.getSession().getAttribute("userName")%>
					</span>

				</a></span>
			</button>
				
				<%} %>
			</div>
	
</div>


		<!-- //request.getSession().getAttribute("userName") -->
		<div align="left" style="margin-left: 93%;margin-top: 300px;position: fixed; z-index: 999;"><a href="gouwuche.sf" style="color:white;background:red;">查看购物车</a>
			<div>&nbsp;&nbsp;</div>
		<a href="logoone.sf" style="color:white;background:red;">返回首页</a>
		<script type="text/javascript"></script>
</div>

<!---start-wrap---->
			<!---start-header---->
			<div class="header">
				<div class="top-header">

				</div>
				<!----start-mid-head---->
				<div class="mid-header">
					
				</div>
				<!----//End-mid-head---->
				<!----start-bottom-header---->

				</div>
				<!----//End-bottom-header---->
			<!---//End-header---->
		<!----start-image-slider---->

		<div class="clear"> </div>
		<!----//End-image-slider---->
		
		</div>
		<!----//End-price-rage--->
		<!--- start-content---->
		<div class="content" >
			<div class="wrap" style="margin-right: 160%;">
				<div class="content-left">
						<div class="content-left-top-grid">
							<div class="content-left-price-selection">
								
								
						</div>
						</div>
						
				</div>
				<div class="content-right">
					<div class="product-grids" style="width: 120%;">
						<!--- start-rate---->
							<script src="js/jstarbox.js"></script>
							<link rel="stylesheet" href="css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />
							<script type="text/javascript">
								jQuery(function() {
									jQuery('.starbox').each(function() {
										var starbox = jQuery(this);
										starbox.starbox({
											average: starbox.attr('data-start-value'),
											changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
											ghosting: starbox.hasClass('ghosting'),
											autoUpdateAverage: starbox.hasClass('autoupdate'),
											buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
											stars: starbox.attr('data-star-count') || 5
										}).bind('starbox-value-changed', function(event, value) {
											if(starbox.hasClass('random')) {
												var val = Math.random();
												starbox.next().text(' '+val);
												return val;
											} 
										})
									});
								});
							</script>
							<!---//End-rate---->
							<!---caption-script---->
							<!---//caption-script---->
							
							<c:forEach items="${gridslist}" var="gridslist">
						<div onclick="location.href='details.html';" class="product-grid fade" style="width: 300px">
							<div class="product-grid-head">
								<ul class="grid-social">
									<li><a class="facebook" href="gridspay.sf?girdsID=${gridslist.gridsID}"><span> </span></a></li>
									<li><a class="twitter" href="gridspay.sf?girdsID=${gridslist.gridsID}"><span> </span></a></li>
									<li><a class="googlep" href="gridspay.sf?girdsID=${gridslist.gridsID}"><span> </span></a></li>
									<div class="clear"> </div>
								</ul>
								
							</div>
							<div class="product-pic">
								<a href="gridspay.sf?girdsID=${gridslist.gridsID}"><img width="200px" height="200px" src="<%=request.getContextPath()%>${gridslist.girdsimg}" title="product-name" /></a>
								<p>
								<a href="gridspay.sf?girdsID=${gridslist.gridsID}">${gridslist.girdsName}</a>
								<!-- <span>Men's Firm-Ground Football Boot</span> -->
								</p>
							</div>
							<div class="product-info">
								<div class="product-info-cust">
									<a href="gridspay.sf?girdsID=${gridslist.gridsID}">价格</a>
								</div>
								<div class="product-info-price">
									<a href="gridspay.sf?girdsID=${gridslist.gridsID}">${gridslist.girdsjiage}</a>
								</div>
								<div class="clear"> </div>
							</div>
							<div class="more-product-info">
								<span> </span>
							</div>
						</div>
								</c:forEach>
						<div class="clear"> </div>
					</div>
				</div>
				<div class="clear"> </div>
			</div>
		</div>

		<!---//End-footer---->
		<!---//End-wrap---->

</body>
</html>