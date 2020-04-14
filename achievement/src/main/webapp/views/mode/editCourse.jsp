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
	<form class="layui-form" id="myForm">
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">工号</label>
				<label class="layui-form-label tid"></label>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">姓名</label>
				<label class="layui-form-label tname"></label>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">当前内容</label>
				<label class="layui-form-label course" style="width:600px;text-align:left;"></label>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">复选框</label>
			<div class="layui-input-block" id="chooseCourse">
			</div>
		</div>
		<br><br><br><br> 
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="savePass">添加</button>
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
		$ = layui.jquery;
	 
	$(document).ready(function() {
		setTimeout(function(){
			var arr_str = [];
	    	arr_str = $('.course').text().split(",");
			var url = "../../course/selectAllCourse";
			$.ajax({
				url:url,
				type:"post", 
				dataType:"json",
				async:false, 
			    data:{}, 
			    success:function(data){
			    	var str='';
	            	for(var i=0;i<data.list.length;i++){ 
	             		if(arr_str.indexOf(data.list[i].cname)>-1){
	             			str+='<input type="checkbox" title='+data.list[i].cname+' value="'+data.list[i].cid+'" checked>'; 
	             		}else {
	             			str+='<input type="checkbox" title='+data.list[i].cname+' value="'+data.list[i].cid+'">'; 
	             		}
	            	}
	              $('#chooseCourse').append(str);
	              document.getElementById("myForm").reset()
			    },
			    error:function(){ 
			    	top.layer.msg("后端查询接口异常！");
			    }
			 });  
		},100)
	});
	
	form.on("submit(savePass)",function(data){//添加
		var rdesc = $("#rdesc").val();
		var tid = parent.layui.$('.tid').text();
		var url = "../../TeacherCourse/addTC";
		var arr_box = [];arr_box.push($(".tid").text());
	    $('input[type=checkbox]:checked').each(function() {
	      arr_box.push($(this).val());
	    });
	    if(arr_box.length>7){
	    	layer.msg("展示个数不能超过6个");
	    	return false;
	    }
	 	 $.ajax({
	 		url:url,
	        type:"post", 
		    dataType:"json",
		    contentType : "application/json" ,
		    async:false,
		    data:JSON.stringify(arr_box), 
	        success:function(data){
	        	if(data.flag=="1"){
	        		top.layer.msg("添加成功！", {icon: 1});
	        		//layer.closeAll("iframe");
	        		layer.close(layer.index);//关闭当前弹出层
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
 	
})
</script>
</html>