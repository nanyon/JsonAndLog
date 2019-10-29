<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript">

		 function doclick(){
			 $("#myform1").submit();
			 var index=parent.layer.getFrameIndex(window.name);
			 parent.layer.close(index);		
		  }
	
		</script>
	</head>
	<body>
	<div id="main">
			<form action="MainServlet" method="post" id="myform1">
				<input type="hidden" name="method" value="addDevice" >
				<div>
					<label>WAN口状态</label>
					<hr style="height:1px;border:none;border-top:1px solid #555555;" />
					<div>
						<a style="font-size:80%">MAC地址：</a>&nbsp;&nbsp;&nbsp;<input type="text" value="${section.name}" name="name" placeholder="请输入" autocomplete="off" ><br/>	
						<a style="font-size:80%">IP地址：</a>&nbsp;&nbsp;&nbsp;<input type="text" value="${section.name}" name="name" placeholder="请输入" autocomplete="off" ><br/>					
						<a style="font-size:80%">子网掩码：</a>&nbsp;&nbsp;&nbsp;<input type="text" value="${section.name}" name="name" placeholder="请输入" autocomplete="off" ><br/>								
					</div>
				</div>
				<br/>
				<div>
					<label>LAN口状态</label>
					<hr style="height:1px;border:none;border-top:1px solid #555555;" />
					<div>
						<a style="font-size:80%">MAC地址：</a>&nbsp;&nbsp;&nbsp;<input type="text" value="${section.name}" name="name" placeholder="请输入" autocomplete="off" ><br/>	
						<a style="font-size:80%">IP地址：</a>&nbsp;&nbsp;&nbsp;<input type="text" value="${section.name}" name="name" placeholder="请输入" autocomplete="off" ><br/>					
						<a style="font-size:80%">子网掩码：</a>&nbsp;&nbsp;&nbsp;<input type="text" value="${section.name}" name="name" placeholder="请输入" autocomplete="off" ><br/>								
					</div>
				</div>
				<div >
					<button onclick="doclick()" style="width: 150px; margin-left: 30%; margin-top: 15%" >确定</button>
				</div>
			</form>
		</div>
	</body>
</html>