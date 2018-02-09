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
<title>屄哩屄哩-商品详情</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/grids/gridsPay/css/normalize.css"/>
<script
	src="<%=request.getContextPath()%>/static/Homepage/js/jquery.min.js"></script>
 <script src="<%=request.getContextPath()%>/static/grids/gridsPay/js/common.js" type="text/javascript" charset="utf-8"></script>
</head>
 <script type="text/javascript">
  $(document).ready(function(){
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,//宽度,该版本中请把宽高填写成一样
		  "boxh":400,//高度,该版本中请把宽高填写成一样
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
  });
</script>
<body>
<div class="showall" align="center">
	                <!--left -->
	                <div class="showbot">
                    <div id="showbox">
                        <img src="<%=request.getContextPath()%>${gridslist.girdsimg}" width="400" height="400" />
                        
                    </div><!--展示图片盒子-->
                        <div id="showsum">
                        	<!--展示图片里边-->
                        </div>
                        <p class="showpage">
                            <a href="javascript:void(0);" id="showlast"> < </a>
                            <a href="javascript:void(0);" id="shownext"> > </a>
                        </p>
                        </div>
                        <!--conet -->
                        <div class="tb-property">
                        	<div class="tr-nobdr">
                        		<h3>${gridslist.girdsName}</h3>
                        	</div>
                        		<div class="txt">
                        			<span class="nowprice">￥<a href="">${gridslist.girdsjiage}</a></span>
                        			<div class="cumulative">
                        				<span class="number ty1">累计售出<br /><em id="add_sell_num_363">370</em></span>
                        				<span class="number tyu">累计评价<br /><em id="add_sell_num_363">25</em></span>
                        			</div>
                        		</div>
                        	<div class="txt-h">
                        		<span class="tex-o">分类</span>
                        		<ul class="glist" id="glist" data-monitor="goodsdetails_fenlei_click">
                        			<li><a title="红色36g" href="">纯</a></li>
                        			<!--<li><a title="蓝色16g" href="">红色36g</a></li>-->
                        		<!--<li><a title="红色36g" href="">红色36g</a></li>
                        			<li><a title="蓝色16g" href="">红色36g</a></li>-->
                        		</ul>
                        	</div>
                        	<script>
                        	$(document).ready(function(){
                        	//����ı������
                          	var t = $("#text_box");
                        	//��ʼ������Ϊ1,��ʧЧ��
                        	$('#min').attr('disabled',true);
                            	//�������Ӳ���
                            	$("#add").click(function(){    
                               	 t.val(parseInt(t.val())+1)
                               	 if (parseInt(t.val())!=1){
                                   	 $('#min').attr('disabled',false);
                                	}
      
                           	 }) 
                            	//�������ٲ���
                            	$("#min").click(function(){
                                	t.val(parseInt(t.val())-1);
                                	if (parseInt(t.val())==1){
                                   	 $('#min').attr('disabled',true);
                                	}
      
                            	})  
                        	});
                        	</script>  
                        	<div class="gcIpt">
                        		<span class="guT">数量</span>
                        		<input id="min" name="" type="button" value="-" />  
                        		<input id="text_box" name="" type="text" value="1"style="width:30px; text-align: center; color: #0F0F0F;"/>  
                        		<input id="add" name="" type="button" value="+" />
                        		<span class="Hgt">库存（${gridslist.girdskucun}）</span>
                        	</div>
                        	<div class="nobdr-btns">
                        		<button class="addcart yh" id="lijigoumai"><img src="<%=request.getContextPath()%>/static/grids/gridsPay/images/ht.png" width="25" height="25"/>立即购买</button>
                        		<button class="addcart hu" id="gouwuce"><img src="<%=request.getContextPath()%>/static/grids/gridsPay/images/shop.png" width="25" height="25"/>加入购物车</button>
                        	</div>
                        	<div class="guarantee">
                        		<span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""><img src="<%=request.getContextPath()%>/static/grids/gridsPay/images/me.png"/></a></span>
                        	</div>
                        </div>
                        <script type="text/javascript">
                        		$("#lijigoumai").click(function(){
                        			//alert("立即购买");
                        			var user = "<%=request.getSession().getAttribute("userName")%>";
                        			if(user!="null"){
                        				var a="Confirmorder.sf?girdsID=${gridslist.gridsID}&gridsName=${gridslist.girdsName}&gridskucun=${gridslist.girdskucun}&gridsjiage=${gridslist.girdsjiage}&gridsimg=${gridslist.girdsimg}"
                        				location.href =  a;
                        			}else{
                        				alert("请登录之后购买");
                        				location.href = "login.sf";
                        			}
                        		})
                        		
                        		$("#gouwuce").click(function(){
                        			//alert("购物车");
                        			var user = "<%=request.getSession().getAttribute("userName")%>";
                        			if(user!="null"){
                        				var html = "";
                        				var girdsName="${gridslist.girdsName}";//商品名字
                        				var girdsimg = "${gridslist.girdsimg}";//商品图片地址
                        				var girdsjiage = "${gridslist.girdsjiage}";//商品价格
                        				var girdsID = "${gridslist.gridsID}";//商品ID
                        				
                        					//这里是添加至购物车
                        				$.post("gouwuchet.sf",{"userName":user,"girdsName":girdsName,"girdsimg":girdsimg,"girdsjiage":girdsjiage,"girdsID":girdsID},function(test){
                        					var ht=eval("("+test+")");
                        					 $.each(ht,function(index,m){
                        					        //alert(m.videoName);
	                        					     html+=m;
                        					       });
                        					 	alert(html);
                        					 	//Shopping.sf
                        					 	location.href = "Shopping.sf";
                        			});
                        			}else{
                        				alert("请登录之后购买");
                        				location.href = "login.sf";
                        			}
                        		})
                        		
                        </script>
                        <!--right -->
                       <!-- <div class="extInfo">
            	            <div class="brand-logo">
            	             	<a href="" title="奥影汽车影音">
            	             		<img src="images/ho_03.png"/>
            	             	</a>
            	            </div>
            	            
                        </div>-->
                    </div>                

                
</body>
</html>