<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%@ include file="common.jsp" %>
<head>
<meta charset="UTF-8">
<title>配置设备</title>
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
<body>
<h1><span style="color: #033; margin-left: 45%">我的设备</span></h1>
<table width="70%" border="0">
  <tr>
    <td width="30%" valign="top" class="MenuItem">
    </td>
    <td width="10%" valign="top">&nbsp;</td>
  
    <td width="60%" valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="0">
      <tr>
        <td colspan="3" class="ContentTitle">WAN口状态 </td>
      </tr>
      <tr class="ContentBody">
        <td width="11%">&nbsp;</td>
        <td width="36%">MAC地址：</td>
        <td width="53%"><input type="text" value="${dev.WAN.MAC}" name="name" placeholder="${dev.WAN.MAC}" autocomplete="off" ></td>
      </tr>
      <tr class="ContentBody">
        <td>&nbsp;</td>
        <td>IP地址：</td>
          <td width="53%"><input type="text" value="${dev.WAN.IP}" name="name" placeholder="${dev.WAN.IP}" autocomplete="off" ></td>
      </tr>
      <tr class="ContentBody">
        <td>&nbsp;</td>
        <td>子网掩码：</td>
          <td width="53%"><input type="text" value="${dev.WAN.subnetMask}" name="name" placeholder="${dev.WAN.subnetMask}" autocomplete="off" ></td>
      </tr>
      <tr>
        <td colspan="3" class="ContentTitle">LAN口状态 </td>
      </tr>
      <tr class="ContentBody">
        <td>&nbsp;</td>
        <td>MAC地址：</td>
        <td><input type="text" value="${dev.LAN.subnetMask}" name="name" placeholder="${dev.LAN.MAC}" autocomplete="off" ></td>
      </tr>
      <tr class="ContentBody">
        <td>&nbsp;</td>
        <td>IP地址：</td>
     	<td><input type="text" value="${dev.LAN.subnetMask}" name="name" placeholder="${dev.LAN.IP}" autocomplete="off" ></td>
      </tr>
      <tr class="ContentBody">
        <td>&nbsp;</td>
        <td>子网掩码：</td>
       <td><input type="text" value="${dev.LAN.subnetMask}" name="name" placeholder="${dev.LAN.subnetMask}" autocomplete="off" ></td>
      </tr>
  
    </table>
   
    <div style="margin-left: 85%; margin-top: 5%"> <button type="button" onclick="doClick()" >保存配置</button></div>
    </td>
  </tr>
</table>

</body>
</html>
