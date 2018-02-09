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
<title>订单</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/Adminbackgroundshipment/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/Adminbackgroundshipment/css/main.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/Adminbackgroundshipment/js/libs/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/Adminbackgroundshipment/js/jquery-1.8.3.min.js" ></script>
</head>
<body>

	
	<div style="width: 200px;height: 170px;background-color: white;position: fixed; z-index: 999;margin-left:85%;margin-top: 35%" id="xinxiaoxi">
			<b style="color: red;margin-left: 8%">有瓜皮下单了! 点击立即查看</b>
			<a href="Adminbackgroundshipment"><img width="200px;" height="170px" alt="" src="<%=request.getContextPath()%>/static/Adminbackgroundshipment/images/gaoxiao.gif"></a>
	</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="javascript:return false;"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="Adminbackgroundshipment"><i class="icon-font">&#xe008;</i>全部订单</a></li>
                        <li><a href="Shipmentpending"><i class="icon-font">&#xe005;</i>待发货</a></li>
                        <li><a href="Completedorder"><i class="icon-font">&#xe006;</i>已完成</a></li>
                        <li><a href="Returngoods"><i class="icon-font">&#xe008;</i>退货订单</a></li>
                        <li><a href="Inquiryorder"><i class="icon-font">&#xe006;</i>查询订单</a></li>
                        <li><a href="Houtai.sf"><i class="icon-font">&#xe005;</i>注册用户管理</a></li>
                    </ul>
                </li>
              
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="javascript:return false;" color="#white">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">订单查询</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <!-- <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form> -->
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                   
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th>订单时间</th>
                            <th>订单商品名字</th>
                            <th>购买者用户名</th>
                            <th>订单价格</th>
                            <th>状态</th>
                        </tr>
             <c:forEach items="${ordertable}" var="ordertable">
                        <tr>
                            <td>${ordertable.orderTime}</td> <!--标签ID-->
                            <td><a target="_blank" href="">${ordertable.orderIgridsName}</a> <!--课程名称-->
                            </td>
                            <td>${ordertable.orderuserName}</td> <!--购买者用户名-->
                            <td>${ordertable.orderzongRMB}</td> <!--销售者用户名-->
                            <td style="color: red"><c:choose>
                          							    <c:when test="${ordertable.orderStat=='1'}">用户下单,未发货</c:when>
														<c:when test="${ordertable.orderStat=='2'}">已发货</c:when>
														<c:when test="${ordertable.orderStat=='3'}">待退货</c:when>
														<c:when test="${ordertable.orderStat=='4'}">订单完成</c:when>
                            	<c:otherwise>退货完成</c:otherwise>
                            
                            </c:choose> </td> <!--订单时间-->
                        </tr>
			</c:forEach>
                    </table>
                   <!--  <div class="list-page"> 2 条 1/1 页</div> -->
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
    //xinxiaoxi
    $(document).ready(function(){	
    	$("#xinxiaoxi").hide();
    });
    function time(){ 
		//alert("我3秒出来一次.");
		//每过一段时间向后台请求查询 是否有新的订单
		//countordertable
		var html = "";
		$.post("countordertable",function(test) {
			var ht = eval("("+test+ ")");
			$.each(ht,function(index,m) {
							html+=m;
						
							});
			//alert(html);
			if(html=="无新订单"){
				//没有订单
			}else{
				$("#xinxiaoxi").show();
			}
			html = "";
			
		});
		
		}setInterval("time()",20000);
		
		function fuck(){
			$("#xinxiaoxi").hide();
		}setInterval("fuck()",10000);
    </script>
    <!--/main-->
</div>
	
</body>
</html>