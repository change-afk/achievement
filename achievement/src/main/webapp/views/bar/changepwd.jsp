<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>修改密码</title>
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
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>修改密码</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix changepwd">
			<form class="layui-form col-lg-4" method="post" action="">
			 	<div class="layui-form-item">
					<label class="layui-form-label">用户id</label>
					<div class="layui-input-block">  
					  	<input type="text" autocomplete="off"  class="layui-input layui-disabled tid" disabled="disabled" >
					</div>
				</div> 
				<div class="layui-form-item">
					<label class="layui-form-label">新密码</label>
					<div class="layui-input-block">  
					  	<input type="password" autocomplete="off" lay-verify="required" class="layui-input pass1" placeholder="请输入新密码">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">  
					  	<input type="password" autocomplete="off" lay-verify="required" class="layui-input pass2" placeholder="请输入确认新密码">
					</div>
				</div>
				<div class="layui-form-item change-submit">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="savePass">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
	<script type="text/javascript" src="../common/layui/layui.js"></script> 
	<script type="text/javascript" src="../js/larry.js"></script>
	<script type="text/javascript" src="../js/index.js"></script>
</body>
<script type="text/javascript">
layui.use(['form','layer','jquery'],function(){ 
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		$ = layui.jquery;
         
         $(document).ready(function() {
    		 var url = parent.location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
    		 var theRequest = new Object()
    		 if (url.indexOf('?') != -1) {
    		 var str = url.substr(1) //substr()方法返回从参数值开始到结束的字符串；
    		 var strs = str.split('&')
    		 for (var i = 0; i < strs.length; i++) {
    		    theRequest[strs[i].split('=')[0]] = strs[i].split('=')[1]
    		 	}
    		 } 
    	    var tid=theRequest.id;
    	    $(".tid").val(tid);
         }) 
         
         form.on("submit(savePass)",function(data){
        	var id = $(".tid").val();
        	if(tid=""){
        		top.layer.msg("未获取id，请刷新重试"); 
     			return false;
        	}
     		var pass1 = $(".pass1").val();
     		var pass2 = $(".pass2").val();
     		if(pass1!=pass2){
     			top.layer.msg("两次密码不一致");
     			return false;
     		}
     		var url = "../../password/changepwd";
     		$.ajax({
     			url:url,
     			type:"post", 
     			dataType:"json",
     			async:false,
     		    data:{"tid":id,"password":pass1}, 
     	        success:function(data){ 
     	        	if(data.flag!="-1"){
     	        		top.layer.msg("修改成功！", {icon: 1});
     	        		layer.closeAll("iframe");
     	        		parent.location.reload(); 
     	        	}else {
     	        		top.layer.msg("修改失败！", {icon: 2});
     	        	}
     	        },
     	        error:function(){ 
     	        	top.layer.msg("访问接口失败！");
     	        }
     	     });  
     		})
      		return false;
	});
</script>
</html>