<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="../css/personal.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/layui/css/modules/laydate/laydate.css" media="all">
</head>
<body class="childrenBody">
	<form class="layui-form">
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">列表名称</label>
				<div class="layui-input-inline">
					<input class="layui-input cname" lay-verify="required" placeholder="请输入名称" type="text">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">创建时间</label> 
				<div class="layui-input-inline">
					<!-- <input class="layui-input creatTime" placeholder="请输入时间" lay-verify="required" type="text"> -->
					<input type="text" class="layui-input creatTime" id="creatTime" placeholder="yyyy-MM-dd">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
		    <label class="layui-form-label">信息概要</label>
		    <div class="layui-input-block">
		      <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
		    </div>
	   </div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="savePass">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="../common/layui/layui.all.js"></script>

</body>
<script type="text/javascript">
layui.use(['form','layer','laydate','jquery'],function(){ 
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		laydate = layui.laydate,
		$ = layui.jquery;
	 
	laydate.render({ 
	    elem: '#creatTime'
	  });
	
	$(document).ready(function() {
		var myDate = new Date();
		$(".cname").val("");
		$(".layui-textarea").val("");
		$(".creatTime").val("");
		
	});
	
	form.on("submit(savePass)",function(data){
		var cname = $(".cname").val();
		var creatTime = $(".creatTime").val();
		var content = $(".layui-textarea").val(); 
		var url = "../../course/addCourse";
		$.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
		    data:{"cname":cname,"creatTime":creatTime,"content":content}, 
	        success:function(data){
	        	if(data.flag=="1"){
	        		top.layer.msg("添加成功！", {icon: 1});
	        		layer.closeAll("iframe");
	        		parent.location.reload(); 
	        	}else {
	        		top.layer.msg("添加失败！", {icon: 2});
	        	}
	        },
	        error:function(){ 
	        	top.layer.msg("访问接口失败！");
	        }
	     });  
		})
 		return false;
 	
})
</script>
</html>