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
<title>屄哩屄哩-确认订单</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/grids/gridsPay/css/tasp.css" />
<link href="<%=request.getContextPath()%>/static/grids/gridsPay/css/orderconfirm.css" rel="stylesheet" />
	<script
	src="<%=request.getContextPath()%>/static/Homepage/js/jquery.min.js"></script>




</head>

<style>
#page{width:auto;}
#comm-header-inner,#content{width:950px;margin:auto;}
#logo{padding-top:26px;padding-bottom:12px;}
#header .wrap-box{margin-top:-67px;}
#logo .logo{position:relative;overflow:hidden;display:inline-block;width:140px;height:35px;font-size:35px;line-height:35px;color:#f40;}
#logo .logo .i{position:absolute;width:140px;height:35px;top:0;left:0;background:url(http://a.tbcdn.cn/tbsp/img/header/logo.png);}
</style>

<body>
		
		<div style="width: 1000px;height: 500px;background-color: white;position: fixed; z-index: 999;margin-left:12%;display: none" id="zhifumima">
				<div align="right" style="width: 1000px"><button type="button" id="clos">X</button></div>
				<br><br><br><br><br><br><br>
				<div align="center" id="pwd">请输入支付密码:<input type="password" id="oText"><input type="button" id="zhifu" value="支付" style="margin-left:20px"> </div>  
				<div align="center">
				<br>
				<input type="button" id="wangjipassword" value="忘记支付密码?" style="margin-left: 320px">
				<br>
				
				</div>
				
		</div>
    
    <script type="text/javascript">
    		$("#clos").click(function(){
    			$("#zhifumima").hide();
    		});
    		$("#wangjipassword").click(function(){
    			location.href = "Update_PayPassword.sf";
    		});
    		
    		$("#zhifu").click(function(){
    			var pass = $("#oText").val();
    			if(pass==""||pass=="null"){
    				alert("支付密码不能为空");
    			}else{
    				var html = "";
    				//ajax 验证支付密码是否正确
    								var jiage = ${grids.girdsjiage};//价格
									var yunfei = $('select option:selected').val();//运费
									var zong = parseInt(jiage) + parseInt(yunfei);//总价
									var shangpingmingzi="${grids.girdsName}";//商品名字
									var shangpingtupiao="${grids.girdsimg}";//商品图片
									var dizhi = $("#userAddress").text();//收货地址

    				jQuery.post("yanzhengpass.sf",{"pass":pass,"zong":zong,"shangpingmingzi":shangpingmingzi,"shangpingtupiao":shangpingtupiao,"dizhi":dizhi},function(test){
    					var ht=eval("("+test+")");
    					jQuery.each(ht,function(index,m){
    					        //alert(m.videoName);
        					     html+=m;
    					       });
    						if(html=="对不起,您输入的支付密码有误!"){
    							location.reload();
    							alert(html);
    						}
    						if(html=="服务器错误...请联系管理员!"){
    							location.href = "logoone.sf";
    							alert(html);
    						}
    						
    						if(html=="下单成功"){
    							location.href = "Order.sf";
    							alert(html);
    						}
    					//location.href = "login.sf";
    					 	//alert(html);
    					 	//Shopping.sf
    					 	//location.href = "Shopping.sf";
    			});
    				
    				
    			}
    		})
    
    </script>
<script type="text/javascript">
	//页面加载时
	$(document).ready(function(){
			//alert("页面加载时");
		var userName = "<%=request.getSession().getAttribute("userName")%>";
		if(userName=="null")
			{
				alert("请登录之后购买");
				location.href = "login.sf";
			}else{
				
				 //获取被选中的option标签
				var jiage = ${grids.girdsjiage};
				var yunfei = $('select option:selected').val();
				var zong = parseInt(jiage) + parseInt(yunfei);
				$("#zong").html(zong);
				$("#J_ActualFee").html(zong);
		//alert("页面加载时获取用户地址")
		var html = "" ;
		var down = "" ;
		
		$.post("querendingdan1.sf",function(test){
			var ht=eval("("+test+")");
			 $.each(ht,function(index,m){
			     	html+=m.userAddress;//+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
			     	html+="<em style='margin-left: 30%'> tell:&nbsp;&nbsp;"+m.userPhone+"</em>";
			     	down+="<li><em>寄送至:</em><span id='J_AddrConfirm' style='word-break: break-all;'>";
			     	down+=""+m.userAddress+"";
			     	down+="</span></li>";
			     	down+="<li><em>收货人:</em><span id='J_AddrNameConfirm'>"+m.userMingzi+" "+m.userPhone+" </span></li>";
			       });
			 
			$("#userAddress").html(html);
			$("#down").html(down);
			html="";
			down="";
									});

			}
	});
	

</script>
				<!-- <li><em>寄送至:</em><span id="J_AddrConfirm" style="word-break: break-all;">
			   			     湖北省 恩施土家族苗族自治州 恩施市 湖北民族学院（信息工程学院）  男生宿舍楼235栋1234202
			       		 </span></li>
			      	<li><em>收货人:</em><span id="J_AddrNameConfirm">某某某 18124317260 </span></li> -->

	<div id="page">

 <div id="content" class="grid-c">

  <div id="address" class="address" style="margin-top: 20px;" data-spm="2">
<form name="addrForm" id="addrForm" action="#">
<h3>确认收货地址
 <span class="manage-address">
 <a href="Delivery_address.sf" target="_blank" title="管理我的收货地址"
 class="J_MakePoint" data-point-url="Delivery_address.sf">修改收货地址</a>
 </span>
</h3>
<ul id="address-list" class="address-list">
     <li class="J_Addr J_MakePoint clearfix  J_DefaultAddr "  data-point-url="http://log.mmstat.com/buy.1.20">
 <s class="J_Marker marker"></s>
 <span class="marker-tip">寄送至</span>
   <div class="address-info">
 	<a href="#" class="J_Modify modify J_MakePoint" data-point-url="Delivery_address.sf">修改本地址</a>
 	<input name="address"
 	class="J_MakePoint "
 	type="radio"
	 value="674944241"
 	id="addrId_674944241"
 	data-point-url="Delivery_address.sf"

  checked="checked" >
 	<label for="addrId_674944241" class="user-address" id="userAddress">
       <!-- 收货地址区 -->
   </label>

 <em class="tip" style="display: none">默认地址</em>
  </div>
    
	<ul id="J_MoreAddress" class="address-list hidden">
     
 </ul>



</form>
</div>
<form id="J_Form" name="J_Form" action="/auction/order/unity_order_confirm.htm" method="post">
 
           <div>
 <h3 class="dib">确认订单信息</h3>
 <table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable" summary="统一下单订单信息区域">
 <caption style="display: none">统一下单订单信息区域</caption>
 <thead>
 <tr>
 <th class="s-title">店铺宝贝<hr/></th>
 <th class="s-price">单价(元)<hr/></th>
 <th class="s-amount">数量<hr/></th>
 <th class="s-agio">优惠方式(元)<hr/></th>
 <th class="s-total">小计(元)<hr/></th>
 </tr>
 </thead>
     


<tbody data-spm="3" class="J_Shop" data-tbcbid="0" data-outorderid="47285539868"  data-isb2c="false" data-postMode="2" data-sellerid="1704508670">
<tr class="first"><td colspan="5"></td></tr>
<tr class="shop blue-line">
 <td colspan="3">
   店铺：<a class="J_ShopName J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.6" href="http://store.taobao.com/shop/view_shop.htm?shop_id=104337282"
 target="_blank" title="bilibili">bilibili</a>
     <span class="seller">卖家：<a href="" target="_blank" class="J_MakePoint" data-point-url="">bilibili</a></span>
     <span class="J_WangWang"  data-nick="bilibili"   data-display="inline" ></span>
    
    </td>
 <td colspan="2" class="promo">
 <div>
   <ul class="scrolling-promo-hint J_ScrollingPromoHint">
       </ul>
   </div>
 </td>
</tr>
 <tr class="item" data-lineid="19614514619:31175333266:35612993875" data-pointRate="0">
 <td class="s-title">
   <a href="#" target="_blank" title="${grids.girdsName}" class="J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5">
     <img src="<%=request.getContextPath()%>${grids.girdsimg}" class="itempic"><span class="title J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5">${grids.girdsName }</span></a>

   <div class="props">
     <span> </span>
   <span> </span>
   <span> </span>
   <span> </span>
         </div>
 <a title="消费者保障服务，卖家承诺商品如实描述" href="#" target="_blank">
<img src="http://img03.taobaocdn.com/tps/i3/T1bnR4XEBhXXcQVo..-14-16.png"/>
</a>
    <div>
 <span style="color:gray;">卖家承诺72小时内发货</span>
 </div>
     </td>
 <td class="s-price">
   
  <span class='price '>
 <em class="style-normal-small-black J_ItemPrice"  >${grids.girdsjiage}</em>
  </span>
<input type="hidden" name="costprice" value="630.00" class="J_CostPrice" />
</td>
 <td class="s-amount" data-point-url="">
         <input type="hidden" class="J_Quantity" value="1" name="19614514619_31175333266_35612993875_quantity"/>1
 
 </td>
 <td class="s-agio">
       <div class="J_Promotion promotion" data-point-url="">无优惠</div>
   </td>
 <td class="s-total">
   
   <span class='price '>
 <em class="style-normal-bold-red J_ItemTotal "  >${grids.girdsjiage}</em>
  </span>
    <input id="furniture_service_list_b_47285539868" type="hidden" name="furniture_service_list_b_47285539868"/>
 </td>
</tr>



<tr class="item-service">
 <td colspan="5" class="servicearea" style="display: none"></td>
</tr>

<tr class="blue-line" style="height: 2px;"><td colspan="5"></td></tr>
<tr class="other other-line">
 <td colspan="5">
 <ul class="dib-wrap">
 <li class="dib user-info">
 <ul class="wrap">
 <li>
  <div class="field gbook">
   <label class="label">给卖家留言：</label>
   <textarea style="width:350px;height:80px;" title="选填：对本次交易的补充说明（建议填写已经和卖家达成一致的说明）" name=""></textarea>
 </div>
</li>
   </ul>
 </li>
 <li class="dib extra-info">

 <div class="shoparea">
 <ul class="dib-wrap">
 <li class="dib title">店铺优惠：</li>
 <li class="dib sel"><div class="J_ShopPromo J_Promotion promotion clearfix" data-point-url="http://log.mmstat.com/buy.1.16"></div></li>
 <li class="dib fee">  <span class='price '>
 -<em class="style-normal-bold-black J_ShopPromo_Result"  >0.00</em>
  </span>
</li>
 </ul>
 </div>

 <div class="shoppointarea"></div>

   <div class="farearea">
 <ul class="dib-wrap J_farearea">
 <li class="dib title">运送方式：</li>
 <li class="dib sel" data-point-url="http://log.mmstat.com/jsclick?cache=*&tyxd=wlysfs">
 
   <select name="1704508670:2|post" id="selectsf" class="J_Fare" onchange="xuanzhong()">
     <option data-fare="1500" value="15" data-codServiceType="2" data-level=""  selected="selected"  >
 快递 15.00元 
 </option>
       <option data-fare="2500" value="25" data-codServiceType="7" data-level=""  >
 EMS 25.00元 
 </option>
       <option data-fare="1500" value="35" data-codServiceType="1" data-level=""  >
 平邮 35.00元 
 </option>
     </select>
     
     <script type="text/javascript">
			 
     </script>     
     
   <em tabindex="0" class="J_FareFree" style="display: none">免邮费</em>
     </li>
 <li class="dib fee">  <span class='price '>
<!--  <em class="style-normal-bold-red J_FareSum"  >30.00</em> -->
  </span>
</li>
 </ul>
 </div>
   <div class="extra-area">
 <ul class="dib-wrap">
 <li class="dib title">发货时间：</li>
 <li class="dib content">卖家承诺订单在买家付款后，72小时内发货</li>
 </ul>
 </div>
   
   <div class="servicearea" style="display: none"></div>
 </li>
 </ul>
 </td>
</tr>

<tr class="shop-total blue-line">
 <td colspan="5">店铺合计(<span class="J_Exclude" style="display: none">不</span>含运费<span class="J_ServiceText" style="display: none">，服务费</span>)：
   <span class='price g_price '>
 <span>&yen;</span><em class="style-middle-bold-red J_ShopTotal"  id = "zong"></em>
  </span>


   </td>
</tr>
</tbody>
  <tfoot>
 <tr>
 <td colspan="5">

<div class="order-go" data-spm="4">
<div class="J_AddressConfirm address-confirm">
 <div class="kd-popup pop-back" style="margin-bottom: 40px;">
 <div class="box">
 <div class="bd">
 <div class="point-in">
   
   <em class="t">实付款：</em>  <span class='price g_price '>
 <span>&yen;</span><em class="style-large-bold-red"  id="J_ActualFee" ></em>
  </span>
</div>
<script type="text/javascript">
function xuanzhong(){
	 //获取被选中的option标签
		var jiage = ${grids.girdsjiage};
		var yunfei = $('select option:selected').val();
		var zong = parseInt(jiage) + parseInt(yunfei);
		$("#zong").html(zong);
		$("#J_ActualFee").html(zong);
}
</script>
  <ul id="down">
 
 </ul>
     </div>
 </div>
 



         <a href="gouwuche.sf"
 class="back J_MakePoint" target="_top"
 data-point-url="">返回购物车</a>
       <a id="J_Go" class=" btn-go"   data-point-url=""  tabindex="0" title="点击此按钮，提交订单">提交订单<b class="dpl-button"></b></a>
<script type="text/javascript">
       
       		$("#J_Go").click(function(){
       			$("#zhifumima").show();
       		});
       
       </script>
  </div>
 </div>

 <div class="J_confirmError confirm-error">
 <div class="msg J_shopPointError" style="display: none;"><p class="error">积分点数必须为大于0的整数</p></div>
 </div>


 <div class="msg" style="clear: both;">
 <p class="tips naked" style="float:right;padding-right: 0">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</p>
 </div>
 </div>
 </td>
 </tr>
 </tfoot>
 </table>
</div>

</form>
</div>

		
		
</body>
</html>