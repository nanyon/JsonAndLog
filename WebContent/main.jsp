<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%@ include file="common.jsp" %>
<head>
<meta charset="UTF-8">
<title>我的设备</title>
<style type="text/css">
.MenuItem {
	font-size: small;
	color: #005555;
	line-height: 15pt;
}

.MenuItem a:link, a:visited { 
	color: #005555; 
	text-decoration: none; 
} 

.MenuItem a:hover, a:active { 
	color: #00bbbb; 
	text-decoration: none; 
} 

.MenuGroup {
	color: #009999;
	font-size: medium;
	line-height: 25pt;
}
.ContentBody {
	font-size: small;
	background-color: #EEEEEE;
}
.ContentTitle {
	color: #009999;
	background-color: #c7dec6;
	font-size: medium;
}

</style>
<script type="text/javascript">
	window.onload=function(){		
		myJson = "LAN":{"name":"12565","password":"31654","meid":"126456"};

		for(var p in myJson){//遍历json对象的每个key/value对,p为key

		   alert(p + " " + myJson[p]);

		}
	}
	
	function doClick() {	
		 $("#tableOne").toggle();
		 $("#tableTwo").toggle();
	}
	
</script>
<body>
<h1><span style="color: #033; margin-left: 45%">我的设备</span></h1>



<table width="70%" border="0" id="tableOne">
  <tr>
    <td width="30%" valign="top" class="MenuItem">
    </td>
    <td width="10%" valign="top">&nbsp;</td>
  
    <td width="60%" valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="0">
      <tr>
        <td colspan="3" class="ContentTitle">LAN口状态 </td>
      </tr>
      <tr class="ContentBody">
        <td width="11%">&nbsp;</td>
        <td width="36%">SSID:</td>
        <td width="53%">${dev.LAN.name}</td>
      </tr>
      <tr class="ContentBody">
        <td>&nbsp;</td>
        <td>Password:</td>
        <td>${dev.LAN.password}</td>
      </tr>
      <tr class="ContentBody">
        <td>&nbsp;</td>
        <td>MEID:</td>
        <td>${dev.LAN.meid}</td>
      </tr>
  
    </table>
   
    <div style="margin-left: 85%; margin-top: 5%"> 
		<button type="button" onclick="doClick()">配置设备</button>
	</div>
    </td>
  </tr>
</table>

<form action="${ctx}/MainServlet"  id="myform1">
<input type="hidden" name="method" value="setDevice" >
<table width="70%" border="0"  id="tableTwo" style="display:none;";>
  <tr>
    <td width="30%" valign="top" class="MenuItem">
    </td>
    <td width="10%" valign="top">&nbsp;</td>
  
    <td width="60%" valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="0">
      <tr>
        <td colspan="3" class="ContentTitle">LAN口状态 </td>
      </tr>
      <tr class="ContentBody">
        <td width="11%">&nbsp;</td>
        <td width="36%">SSID:</td>
        <td width="53%"><input type="text" value="${dev.LAN.name}" name="Lan_Name" placeholder="${dev.LAN.name}" autocomplete="off" ></td>
      </tr>
      <tr class="ContentBody">
        <td>&nbsp;</td>
        <td>Password:</td>
          <td width="53%"><input type="text" value="${dev.LAN.password}" name="Lan_Password" placeholder="${dev.LAN.password}" autocomplete="off" ></td>
      </tr>
      <tr class="ContentBody">
        <td>&nbsp;</td>
        <td>MEID:</td>
          <td width="53%"><input type="text" value="${dev.LAN.meid}" name="Lan_Meid" placeholder="${dev.LAN.meid}" autocomplete="off" ></td>
      </tr>     
  
    </table>
    <div style="margin-left: 75%; margin-top: 5%"> <button type="button" onclick="doClick()" >取消配置</button><button class="buttom" onclick="tips1()" style="margin-left: 20px;">保存配置</button></div>    
    </td>
    
  </tr>
</table>
</form>
		<a href="${ctx}/LogServlet" class="layui-btn layui-btn-lg layui-btn-normal">查看日志</a>

</body>
</html>
