<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
	<script src="${ctx}/resources/js/jquery-3.4.0.min.js" type="text/javascript" ></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/layui/css/layui.css"/>
	<script src="${ctx}/resources/layui/layui.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	layui.use('element', function() {
	var element = layui.element;
	});
	layui.use('form', function() {
	var form = layui.form;
	});
	var layer = null;
	layui.use('layer', function(){
	   layer = layui.layer;
	});  
	</script>