<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%@ include file="common.jsp" %>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body >
		  <div style="color: red; text-align: center;">${error}</div>
		  <pre style="padding-bottom: 50px">${log}</pre>	
		
	<script>  
		layui.use('code', function(){ 	
  			layui.code({
  			  about: false,
  			  encode: true,
  			  elem: 'pre'
  			});		   
		});		
	</script>			
	</body>
</html>