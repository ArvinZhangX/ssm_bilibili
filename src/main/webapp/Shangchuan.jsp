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
<title>上传头像界面</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/jingdutiao/css/css.css"
	type="text/css" />

<script
	src="<%=request.getContextPath()%>/static/jingdutiao/jquery-1.8.2.js"></script>
<script
	src="<%=request.getContextPath()%>/static/jingdutiao/jquery-1.8.3.min.js"></script>

</head>
<body onload="pro()">
	<div id="ddd" class="cent"></div>
	<script type="text/javascript">
       var t;
       function pro(){
       var html="";
    	   //ajax请求上传数据
    	   $.post("ProServlet",function(r){
    		   //把json字符串转换为json对象
    		   var obj=eval("("+r+")");
    		   //得到DIV\
    		   var a=obj.Test;
    		   a+=1;
    		    html+="<div class='Bar' id='she'>";
				    		   html+="<div style='width:"+a+"%;' >";
				    		 	 html+="<span>"+a+"%</span>";	
				    		 	  html+="</div>";
				    		    html+="</div>";
				    		    //alert(html);
				    		    $("#ddd").html(html); 
    		   if(obj.endTag==1){
        		   clearTimeout(t);
        	   }
    	   });
    	  
    	   //重复请求
    	 t=  setTimeout("pro()",100);
    	  
       }
       
       </script>
</body>
</html>