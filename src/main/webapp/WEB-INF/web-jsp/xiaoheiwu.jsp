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
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/Houtai/css/style.css" type="text/css" />
	<script
	src="<%=request.getContextPath()%>/static/Homepage/js/sHover.min.js"></script>
	<script
	src="<%=request.getContextPath()%>/static/User_Data_Update/js/jquery-1.8.3.min.js"></script>


<title>屄哩屄哩-小黑屋</title>
</head>
<body>	
		<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="3">


  <tr>
    <td height="100%" valign="top">
    <div style="overflow:auto;height:100%; width:100%">
      <table width="100%" border="0" cellpadding="3" cellspacing="1" class="table1">
        <TR>
          <th align="center"><input type="checkbox" name="checkbox" id="checkbox"></th>
          <th align="center">用户名</th>
          
          <th align="center">用户性别</th>
          
           <th align="center">原因</th>
          <!-- <th align="center">企业负责人</th>
          <th align="center">联系电话</th>
          <th align="center">地址</th>
          <th align="center">审核状态</th>
          <th width="160" align="center">操作</th> -->
          </TR>
          <c:forEach items="${user}" var="user">
        <TR>
          <TD align="center"><input type="checkbox" name="checkbox2" id="checkbox2"></TD>
          <TD align="center">${user.userName}</TD>
          <TD align="center">${user.usersex}</TD>
          <TD align="center">${user.userState}</TD>
       </TR>
       </c:forEach>
       
      </table>
      <!--<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20%" height="25"><table border="0" cellspacing="0" cellpadding="3">
            <tr>
              <td><a href="#"><img src="../../images/prev_top.gif" width="16" height="16" border="0"></a></td>
              <td><a href="#"><img src="../../images/prev.gif" width="16" height="16" border="0"></a></td>
              <td><a href="#"><img src="../../images/next.gif" width="16" height="16" border="0"></a></td>
              <td><a href="#"><img src="../../images/prev_end.gif" width="16" height="16" border="0"></a></td>
            </tr>
          </table></td>
          <td width="20%" align="center"><table border="0" cellspacing="0" cellpadding="3">
            <tr>
              <td><a href="#"><img src="../../images/next.gif" width="16" height="16" border="0"></a></td>
              <td><input name="textfield23" type="text" size="3" style="width:25;height:18">
                /页</td>
            </tr>
          </table></td>
          <td width="20%" align="right">共10条记录显示到1/1</td>
        </tr>
      </table>-->
    </div>
  </td>
  </tr>
</table>

</body>
</html>