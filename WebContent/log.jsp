<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%@ include file="common.jsp" %>
	<head>		
		<meta charset="utf-8">
		<title>日志</title>	
		<script type="text/javascript">
			function download(path){				
				var src = '/log/' + path;			
				var iframe = document.createElement('iframe');
				iframe.style.display = 'none';
				iframe.src = "javascript: '<script>location.href=\"" + src + "\"<\/script>'";
				document.getElementsByTagName('body')[0].appendChild(iframe);
			}
		</script>
		
	</head>
	<body>
	<div class="layui-form" id="main">
		<h2 style="text-align: center;">日志 [${list.size()}条]</h2>
		<button type="button" class="layui-btn layui-btn-normal"  onclick="window.location.reload()">刷新</button>
			  <table class="layui-table">
			    <colgroup>
			      <col width="20">
			      <col width="300">
			      <col width="100">
			      <col width="50">
			    </colgroup>
			    <thead>
			   	  <tr>
			   	  		<th>序号</th>
						<th>文件名</th>
						<th>文件路径</th>
						<th>操作</th>
					</tr>
			    </thead>
			    <tbody>
			      <c:forEach items="${list}" var="obj" varStatus="status" >					
						<tr>
							<td>${status.count}</td>
							<td>${obj.name}</td>
							<td>${obj.path}</td>						
							<td id="btn">
							<a href="/log/${obj.name}" rel="external nofollow"  rel="external nofollow"  rel="external nofollow"  download=""><button class="layui-btn layui-btn-normal">下载</button></a>
							<button class="layui-btn layui-btn-normal" onclick="doclick1('${obj.name}')">删除</button></td>				
						</tr>
					</c:forEach>
			    </tbody>
			  </table>
			</div>
		</body>
</html>
