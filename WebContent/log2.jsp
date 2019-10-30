<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<!DOCTYPE html>
<html>
<%@ include file="common.jsp"%>
<head>
<meta charset="utf-8">
<title>日志</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=yes">
<link rel="shortcut icon" href="#" />
</head>
<body>
	<div class="layui-layout layui-layout-admin">
		<div id="head" class="layui-header">
			<div class="layui-logo" style="color: white;">日志</div>
			<ul class="layui-nav" style="text-align: right;">
				<li class="layui-nav-item"><a href="/WebServer">配置</a></li>

				<li class="layui-nav-item" style="padding-right: 20px"><a
					href="">日志<span class="layui-badge" id="listSize">${list.size()}</span></a>
				</li>
			</ul>
		</div>
	</div>

	<div class="layui-form" id="main" style="margin: 15px">
		<div class="layui-btn-group demoTable">
			<button class="layui-btn layui-btn-sm "
				onclick="window.location.reload()">
				<i class="layui-icon layui-icon-refresh"></i>刷新
			</button>
			<button class="layui-btn layui-btn-sm " data-type="moreDel">多选删除</button>
			<button class="layui-btn layui-btn-sm " data-type="moreDown">多选下载</button>			
		</div>
		<input style="height:27px; float: right;" value="键入即搜索">

		
		<table id="demo" lay-filter="test"></table>
				<span id=showTime style="float: right; padding-right: 20px; font-size:12px;">正在获取服务器时间</span>
		<script type="text/html" id="barDemo">
 				<a class="layui-btn layui-btn-xs" lay-event="look">预览</a>
  				<a class="layui-btn layui-btn-xs" lay-event="down">下载</a>
  				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			  </script>
	</div>

	<script type="text/javascript">
		
	//导航角标的获取
	var listSize = document.getElementById("listSize");
	
	//获取系统时间显示在页面
	var show = document.getElementById("showTime");
	var now = new Date(<%=new java.util.Date().getTime()%>);
	function run() {       
   		now.setSeconds(now.getSeconds() + 1);
   		show.innerHTML = "服务器时间：" + now.getFullYear() + "-" + (now.getMonth()+1) + "-" + now.getDate() + "  " + now.getHours() + ":" +  now.getMinutes() + ":" + now.getSeconds();
   	}  
	//计1S一次刷新方法
   	setInterval("run();", 1000);
   	
   	//表格渲染
	layui.use('table', function(){
	  var table = layui.table;

	  //表格实例	
	  table.render({
	    elem: '#demo'
	    ,data: ${json}//数据接口
	    ,page: true 
	    ,id:'idTest'
	    ,height: 'full-150'
	    ,cellMinWidth: 80 
	    ,limits:[30,100,500,1000,5000]
	    ,limit: 30
	    ,initSort: {field:'lastModified', type:'desc'}
	    ,cols: [[ //表头 
	       {type:'checkbox', fixed: 'left'}    
	   //   ,{field: 'id', title: '序号', width:90 , sort: true}	      
	      ,{field: 'name', title: '文件名'}
	      ,{field: 'lastModified', title: '最后修改',sort: true} 
	      ,{field: 'path', title: '路径'}
	      ,{field: 'length', title: '大小'} 	    
	      ,{width:250, title: '操作' , align:'center', toolbar: '#barDemo'} 	    
	    ]]
	    ,text:{
	    	none:'暂无相关数据'
	    }
	  });
	   	
	  //表头区域内操作条按下响应
	  table.on('tool(test)', function(obj){ //tool是工具条事件名，test是 table原始容器的属性 lay-filter="对应的值"
	      var data = obj.data //获得当前行数据
	      ,layEvent = obj.event; //获得 lay-event对应的值
	      if(layEvent === 'down'){
	    	  downFile(data.name);
	      } else if(layEvent === 'del'){
	          //向服务端发送删除指令  
	         	doDelFile(data.name , obj);
	        // });
	      } else if(layEvent === 'look'){
	    	  var arr = data.length.split(/\s+/);
	 		//文件大于9200KB弹出警告
	    	  if(arr[0] > 9200){
	    		  var index = layer.confirm('【' + data.name + '】文件较大，可能会造成页面卡顿等，建议下载后打开', {
	    			  btn: ['继续浏览','下载文件'] //按钮
	    			}, function(){
	    				layerOpen(2,'/log/'+ data.name); 
	    				layer.close(index);
	    			}, function(){
	    			    downFile(data.name);
	    			});
	    	  }else if(arr[0] == 0){
	    		  layerOpen(1,"文件无数据");	  
	    	  }else{
	    		  layerOpen(2,'/log/'+ data.name); 
	    	  }   
	      	}
	    });  
   	
  
	  //监听表格复选框选择
	  table.on('checkbox(test)', function(obj){
		   console.log(obj)
		});  
	  
	  //多选删除 多选下载
	  var $ = layui.$, active = {			
			    moreDel: function(){ //多选删除按钮  	  
			    	var checkStatus = table.checkStatus('idTest')
		  		      ,data = checkStatus.data; 
				     if(!data.length == 0){
				    	 layer.confirm('确认删除' + data.length + '个文件？', {
					  			title: '多选删除',
					  			  btn: ['确认','取消'] //按钮
					  			},  function(){     
								    $.each((data), function (n, value) {	
								    	
								    $.post("${ctx}/LogServlet", {pathName:value.name,method:"del"},function(){		
								    	 layer.msg('删除成功',{
								    		  time: 800,
								    		  end: function(){
								    			  window.location.reload();
								    		  }
								    	  });										
										});													    	
							  		 });
					 	    	 });
				     }else{
				    	 layer.msg("请先勾选");
				     }			    	 
			    }			   
			    ,moreDown: function(){ //多选下载按钮
			    	 var checkStatus = table.checkStatus('idTest')
		  		      ,data = checkStatus.data; 
			     if(!data.length == 0){
			    	 layer.confirm('确认下载' + data.length + '个文件？', {
				  			title: '多选下载',
				  			  btn: ['确认','取消'] //按钮
				  			},  function(){    				  			  
							      $.each((data), function (n, value) {
							    	  layer.msg('请选择保存路径,多个文件下载可能会造成浏览器拦截,请允许',{
							    		  time: 3000,
							    		  end: function(){
							    			  downFile(value.name);
							    		  }
							    	  });						    	
						  		});
				     		});
			     }else{
			    	 layer.msg("请先勾选");
			     }
			    }
			  };
			  
			  $('.demoTable .layui-btn').on('click', function(){
			    var type = $(this).data('type');
			    active[type] ? active[type].call(this) : '';
			  });	  
	});
	
	//删除文件弹窗
	function doDelFile(pathName , obj) {
		layer.confirm('确认删除？', {
			title: pathName,
			 skin: 'layui-layer-lan',
			  btn: ['确认','取消'] //按钮
			},  function(){
				$.post("${ctx}/LogServlet", {pathName:pathName,method:"del"},function(data){
					layer.msg('删除成功', {
						icon: 1,
						time: 500 
					});	
					//删除文件的同时 将导航日志角标文件数量-1
					listSize.innerHTML=listSize.innerText-1;					
				});
				obj.del();//表格列表内容动态-1
		});
	}
	
	//下载文件
	//pathName:文件名
	 function downFile(pathName){
		 var link = document.createElement('a');
   	 	 link.setAttribute("download", pathName);
   	  	 link.href = '/log/' +  pathName;
   	 	 link.click();	 
	 }

	//读取log文件显示在iframe弹窗
	//flag = 1:文本  2:iframe; pathaName = /log/文件名
	 function layerOpen(flag,pathName){
		 var index = layer.open({
   		  type: flag,
   		  shadeClose: true,
   		  content: pathName,
   		  area: ['900px', '950px'],
   		  title: pathName,
   		  maxmin: true, 
   		  shade: false
   		});
   	//layer.full(index);  //是否弹窗即全屏   
	}
	
</script>
</body>
</html>