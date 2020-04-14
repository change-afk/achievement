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
</head>
<body class="childrenBody">
	<form class="layui-form">
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">工号(账号)</label>
				<div class="layui-input-inline">
					<input class="layui-input username" lay-verify="required" placeholder="请输入工号" type="text">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">权限</label>
				<div class="layui-input-inline">
					<select name="browseLook" class="power" lay-filter="browseLook">
				        <option value="admin">管理员</option>
				        <option value="teacher">教师</option>
				    </select>
				</div>
			</div> 
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline"> 
					<input class="layui-input password" lay-verify="required" placeholder="请输入密码" type="password">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="savePass">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="../common/layui/layui.js"></script>

</body>
<script type="text/javascript">
layui.use(['form','layer','jquery'],function(){ 
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;
	 
	$(document).ready(function() {
		$(".username").val("");
		$(".password").val("");
	});
	
	form.on("submit(savePass)",function(data){
		var username = $(".username").val();
		var password = $(".password").val();
		var power = $(".power").val(); 
		var url = "../../password/addPass";
		$.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
		    data:{"tid":username,"tpassword":password,"tpower":power}, 
	        success:function(data){
	        	if(data.flag=="1"){
	        		top.layer.msg("添加成功！", {icon: 1});
	        		layer.closeAll("iframe");
	        		parent.location.reload(); 
	        	}else {
	        		top.layer.msg("添加失败，该账号已存在！", {icon: 2});
	        	}
	        },
	        error:function(){ 
	        	top.layer.msg("添加失败，请检查工号是否正确！");
	        }
	     });  
		})
            /* top.layer.close(index);
			top.layer.msg("文章添加成功！"); */
 			//layer.closeAll("iframe");
	 		//刷新父页面
	 		//parent.location.reload(); 
 		return false;
 	
})
</script>
</html>