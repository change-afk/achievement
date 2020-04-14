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
				<label class="layui-form-label">导师工号</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor tid" lay-verify="required" placeholder="请输入工号" type="text">
				</div>
				<button class="layui-btn layui-btn-small layui-btn-normal" id="find" style="margin-top:5px">
					<i class="layui-icon">&#xe615;</i><em>校验</em>
				</button>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">学生姓名</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor sname" lay-verify="required" placeholder="请输入姓名" type="text">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">学生性别</label>
				<div class="layui-input-inline">
					<select name="browseLook"  class="sex" lay-filter="browseLook">
				        <option value="男">男</option>
				        <option value="女">女</option> 
				    </select>
				</div>
			</div> 
			<div class="layui-inline">		
				<label class="layui-form-label">学生学历</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor sedu" lay-verify="required" placeholder="请输入学历" type="text">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">头像</label>
			<div class="layui-upload">
			  <button type="button" class="layui-btn" id="choseImg">选择图片</button> 
			  <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;margin-left: 20px;">
			    预览图：
			    <div class="layui-upload-list" id="showImg"></div>
			    <p id="timg"></p>
			 </blockquote>
			</div>
		</div>
		<div class="layui-form-item" style="padding-bottom:50px;"> 
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addTeacher">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div> 
	</form>
	

<script type="text/javascript" src="../common/layui/layui.all.js"></script>
<script>
layui.use(['form','layer','jquery','upload'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		upload = layui.upload, 
		$ = layui.jquery;
 
	$(document).ready(function() {
		var url = parent.parent.location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
		 var theRequest = new Object()
		 if (url.indexOf('?') != -1) {
		 var str = url.substr(1) //substr()方法返回从参数值开始到结束的字符串；
		 var strs = str.split('&')
		 for (var i = 0; i < strs.length; i++) {
		    theRequest[strs[i].split('=')[0]] = strs[i].split('=')[1]
		 	}
		 } 
	    var id=theRequest.id;
	    var type=theRequest.type;
		if(type=="teacher"){
			$(".tid").val(id); 
			$(".tid").attr("disabled", true);
		}
	})
	
	$("#find").click(function(){//校验
		var tid = $(".tid").val();
		var url = "../../teacher/selectTeacherByTid";
		$.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
			data:{"tid":tid}, 
			success:function(data){		
				if(data.teacher!=null){ 
					layer.alert("工号："+data.teacher.tid+"<br>姓名："+data.teacher.tname+"<br>性别："+data.teacher.tsex+"<br>专业："+data.teacher.tmajor);
				}else{
					layer.msg("检验失败，请检查工号",{icon:2});	
				}
			} 
		});
		return false;
	})
	
		//图片上传
	  upload.render({ 
	    elem: '#choseImg',
	    url:"../../teacher/toBase64",
	    multiple: true,
	    //auto: false,
	    before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	    	  $('#showImg').html("");
	    	  $('#showImg').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width:240px;height:320px">');
	      });
	    },
	    done: function(res){
	      if(res.flag==1){
	    	  $("#timg").hide(); 
	    	  $("#timg").text(res.str);
	      }else{
	    	  alert(res.msg);
	      }
	    }, 
	    error: function(){
	    	alert("图片过大上传失败");
	     }
	  });
		
 	var addNewsArray = [],addNews;
 	form.on("submit(addTeacher)",function(){
 		/* var tid,tname,tsex,telephone,tprofession,tunit,tintime,tdegree,tmajor,tschool,tmail,tplace,timg,tgroup,tpersonal; */
 		var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
 		var url = "../../student/addStudent";
 		var jsonStr="";
 		jsonStr = '{"tid":"'+$(".tid").val()+'",';  
 		jsonStr += '"sname":"'+$(".sname").val()+'",'; 
 		jsonStr += '"sex":"'+$(".sex option:selected").text()+'",'; 
 		jsonStr += '"sedu":"'+$(".sedu").val()+'",'; 
 		jsonStr += '"simg":"'+$("#timg").text()+'"}'; //data:image/jpg;base64,
 		$.ajax({
 			url:url,
			type:"post", 
			dataType:"json",
			async:false,
		    data:{"jsonStr":jsonStr},
	        success:function(data){
	        	if(data.flag=="1"){
	        		top.layer.close(index);
	        		top.layer.msg("添加成功！", {icon: 1});
	        		layer.closeAll("iframe");
	        		parent.location.reload();
	        	}else if(data.flag=="-2"){
	        		top.layer.close(index);
	        		top.layer.msg("添加失败！"+$(".tid").val()+"不存在", {icon: 2});
	        	}
	        },
	        error:function(){ 
	        	top.layer.close(index);
	        	top.layer.msg("访问后端接口异常！");
	        	return false;
	        }
	     });  
 		return false;
 	})
	
})

</script>
</body>
</html>