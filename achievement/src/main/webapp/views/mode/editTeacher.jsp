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
				<label class="layui-form-label">工号</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" lay-verify="required" id="tid" placeholder="请输入工号" type="text" disabled="disabled">
				</div>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" lay-verify="required" id="tname" placeholder="请输入姓名" type="text" disabled="disabled">
				</div>
			</div> 
			<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" lay-verify="required" id="tsex" placeholder="请输入性别" type="text" disabled="disabled">
				</div>
			</div> 
			<div class="layui-inline">		
				<label class="layui-form-label">联系电话</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" lay-verify="required" id="telephone" placeholder="请输入电话" type="number">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">职称</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" lay-verify="required" id="tprofession" placeholder="请输入职称" type="text">
				</div>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">单位</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" lay-verify="required" id="tunit" placeholder="请输入单位" type="text">
				</div>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">入职时间</label> 
				<div class="layui-input-inline">
					<input type="text" class="layui-input" id="tintime" placeholder="yyyy-MM-dd">
				</div>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">学位</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" lay-verify="required" id="tdegree" placeholder="请输入学位" type="text">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">专业</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" lay-verify="required" id="tmajor" placeholder="请输入专业" type="text">
				</div>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">毕业院校</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" lay-verify="required" id="tschool" placeholder="请输入毕业院校" type="text">
				</div>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">电子邮件</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" id="tmail" placeholder="请输入电子邮件" type="mail">
				</div>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">办公地址</label>
				<div class="layui-input-inline">
					<input class="layui-input newsAuthor" id="tplace" placeholder="请输入办公地址" type="text">
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
		<div class="layui-form-item" style="display:none">
			<label class="layui-form-label">课题组名称</label>
			<div class="layui-input-block">
				<input class="layui-input" id="tgroup" placeholder="请输入课题组名称" type="text"style="width:99%">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">个人简介</label>
			<div class="layui-input-block"> 
				<textarea class="layui-textarea" name="content" lay-verify="content" id="tpersonal" style="width:99%;height:320px"></textarea>
			</div>
		</div>
		<div class="layui-form-item"> 
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="uptTeacher">提交更改</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		</div> 
	</form>
	

<script type="text/javascript" src="../common/layui/layui.all.js"></script>
<script>
layui.use(['form','layer','jquery','laydate','upload'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		laydate = layui.laydate,
		upload = layui.upload, 
		$ = layui.jquery;
 
	laydate.render({
	    elem: '#tintime'
	  });
	
	$(function(){
		var url = parent.location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
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
			$.ajax({
				url:"../../teacher/selectTeacherByTid",
				type:"post", 
				dataType:"json",
				async:false,
				data:{"tid":id},  
				success:function(data){		
					$("#tid").val(data.teacher.tid); $("#tname").val(data.teacher.tname);  
					$("#tsex").val(data.teacher.tsex);  
					$("#telephone").val(data.teacher.telephone);  $("#tprofession").val(data.teacher.tprofession);  
					$("#tunit").val(data.teacher.tunit);  $("#tintime").val(data.teacher.tintime);  
					$("#tdegree").val(data.teacher.tdegree);  $("#tmajor").val(data.teacher.tmajor);  
					$("#tschool").val(data.teacher.tschool);  $("#tmail").val(data.teacher.tmail);  
					$("#text").val(data.teacher.text);  $("#tplace").val(data.teacher.tplace);   
					$("#tpersonal").val(data.teacher.tpersonal); $('#timg').text(data.teacher.timg);
					$('#showImg').append('<img src="'+ "data:image/jpg;base64,"+data.teacher.timg +'" class="layui-upload-img" style="width:240px;height:320px">');
				},
				error:function(){
					layer.msg('查询接口异常', {icon: 2});
				}
			});
		}
		$("#tid").attr("class","layui-input newsAuthor layui-disabled");
		$("#timg").hide(); 
		//$("#tid").attr("readOnly","true");
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
 	form.on("submit(uptTeacher)",function(){
 		/* var tid,tname,tsex,telephone,tprofession,tunit,tintime,tdegree,tmajor,tschool,tmail,tplace,timg,tgroup,tpersonal; */
 		var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
 		var url = "../../teacher/uptTeacher";
 		var jsonStr="";
 		jsonStr = '{"tid":"'+$("#tid").val()+'",';  
 		jsonStr += '"tname":"'+$("#tname").val()+'",'; 
 		jsonStr += '"tsex":"'+$("#tsex").val()+'",'; 
 		jsonStr += '"telephone":"'+$("#telephone").val()+'",'; 
 		jsonStr += '"tprofession":"'+$("#tprofession").val()+'",'; 
 		jsonStr += '"tunit":"'+$("#tunit").val()+'",'; 
 		jsonStr += '"tintime":"'+$("#tintime").val()+'",'; 
 		jsonStr += '"tdegree":"'+$("#tdegree").val()+'",'; 
 		jsonStr += '"tmajor":"'+$("#tmajor").val()+'",'; 
 		jsonStr += '"tschool":"'+$("#tschool").val()+'",'; 
 		jsonStr += '"tmail":"'+$("#tmail").val()+'",'; 
 		jsonStr += '"tplace":"'+$("#tplace").val()+'",'; 
 		jsonStr += '"timg":"'+$("#timg").text()+'",'; //data:image/jpg;base64,
 		jsonStr += '"tgroup":"'+$("#tgroup").val()+'",'; 
 		jsonStr += '"tpersonal":"'+ $("#tpersonal").val() +'"}';
 		$.ajax({
 			url:url,
			type:"post", 
			dataType:"json",
			async:false,
		    data:{"jsonStr":jsonStr},
	        success:function(data){
	        	if(data.flag=="1"){
	        		top.layer.close(index);
	        		top.layer.msg("修改成功！", {icon: 1});
	        		layer.closeAll("iframe");
	        		parent.location.reload();
	        	}else {
	        		top.layer.close(index);
	        		top.layer.msg("修改失败，后端接口异常！"+data.msg, {icon: 2});
	        	}
	        },
	        error:function(){ 
	        	top.layer.close(index);
	        	top.layer.msg("访问后端接口异常！");
	        	return false;
	        } 
	     });  
 	})
	
})

</script>
</body>
</html>