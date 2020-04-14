<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>请登录</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/login.css" media="all">
</head>
<body>
<div class="layui-canvs"></div>
<div class="layui-layout layui-layout-login">
	<h1>
		 <strong>研究中心管理系统</strong>
		 <em>Management System</em>
	</h1>
	<div class="layui-user-icon larry-login">
		 <input id="username" type="text" placeholder="账号" class="login_txtbx"/>
	</div>
	<div class="layui-pwd-icon larry-login">
		 <input id="password" type="password" placeholder="密码" class="login_txtbx"/>
	</div>
    <div class="layui-submit larry-login">
    	<input type="button" value="立即登陆" class="submit_btn"/>
    </div>
    <div class="layui-login-text">
    	<p>© 2016-2020  陈孝滋  毕业设计</p>
    </div>
</div>
<script type="text/javascript" src="common/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="jsplug/jparticle.jquery.js"></script>
<script type="text/javascript">
$(function(){
	$(".layui-canvs").jParticle({
		background: "#141414",
		color: "#E6E6E6"
	});
	//登录链接测试，使用时可删除
	$(".submit_btn").click(function(){
		var username = $("#username").val();
		var password = $("#password").val();
		url = "../password/login";
	    $.ajax({ 
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
		    data:{"username":username,"password":password},
	        success:function(data){
	        	if(data.flag){
	        		if(data.pass.tpower=="admin"){
	        			location.href="backindex.jsp?id="+username+"&&type="+data.pass.tpower;
	        		}else if(data.pass.tpower=="teacher"){
	        			location.href="backindex2.jsp?id="+username+"&&type="+data.pass.tpower;
	        		}
	        	}else 
	        		layer.alert(data.message);
	           // layer.alert(data.pass);
	        },
	        error:function(){ 
	       	 layer.alert("访问后端接口出错！");
	        }
	     });  
	  	
	});
});
</script>
</body>
</html>