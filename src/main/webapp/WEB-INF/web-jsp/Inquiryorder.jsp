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
                 <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="请输入订单用户名字" name="keywords"  id="text" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="button" id="chaxun"></td>
                        </tr>
                    </table>
                </form> 
            </div>
            
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                   
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%" id="did">
                        <tr>
                            <th>订单时间</th>
                            <th>订单商品名字</th>
                            <th>购买者用户名</th>
                            <th>订单价格</th>
                            <th>状态</th>
                        </tr>
                        
                    </table>
                   <!--  <div class="list-page"> 2 条 1/1 页</div> -->
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
    		function time(){ 
				//alert("我3秒出来一次.");
				//每过一段时间向后台请求查询 是否有新的订单
				
				
				
				}setInterval("time()",3000);
    </script>
    
    
    
    <script type="text/javascript">
            		$("#chaxun").click(function(){
            			//获得输入的内容
            			var val = $("#text").val();
            			var html = "";
            			var orderStat = "";
            			//使用ajax遍历出来
            			$.post("AJAXinquiryorder",{"val":val},function(test) {
							var ht = eval("("+test+ ")");
							$.each(ht,function(index,m) {
												html += "<tr>";
												html +=	"<td>"+m.orderTime+"</td>";
												html +=	" <td><a target='_blank' href='' >"+m.orderIgridsName+"</a></td>";
												html +=	"<td>"+m.orderuserName+"</td> ";
												html +=	" <td>"+m.orderzongRMB+"</td> ";
												if(m.orderStat=="1"){
													orderStat="待发货"
												}else if(m.orderStat=="2"){
													orderStat="已发货"
												}else if(m.orderStat=="3"){
													orderStat="退货中"
												}else if(m.orderStat=="4"){
													orderStat="订单完成"
												}else if(m.orderStat=="5"){
													orderStat="退货完成"
												}else{
													orderStat="订单异常"
												}
												
												html +=	"<td style='color: red'>"+orderStat+"</td>";
												html += "</tr>";
											});
							//alert(html);
							$("#did").html(html);
							html = "";
						});
            		});
            
            </script>
    <!--/main-->
</div>
	
</body>
</html>