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
			<label class="layui-form-label">课题名称</label>
			<div class="layui-input-block">
				<input class="layui-input gname" lay-verify="required" placeholder="请输入课题" type="text">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">课题组长</label>
				<div class="layui-input-inline">
					<input class="layui-input tid" lay-verify="required" placeholder="请输入工号" type="number">
				</div>
				<button class="layui-btn layui-btn-small layui-btn-normal" id="find" style="margin-top:5px">
					<i class="layui-icon">&#xe615;</i><em>校验</em>
				</button>
			</div>
		</div>
		<blockquote class="layui-elem-quote layui-quote-nm"> 课题成员：
			<a class="layui-btn group_add_btn">添加</a>
		</blockquote>
		<div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
               <div class="layui-tab-item layui-field-box layui-show">
                    <table class="layui-table table-hover" lay-even="" lay-skin="row">
                         <thead>
                             <tr>
                             	 <th></th>
                                 <th style="width:300px">姓名</th>
                                 <th>性别</th>
                                 <th>学历</th>
                                 <th>操作</th>
                             </tr>
                         </thead>
                         <tbody id="groupTable">
                         </tbody>
                    </table>
		    </div>
	    </div>
		<div class="layui-form-item" style="padding-bottom:50px;"> 
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addGroup">立即提交</button>
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
	
		$(".group_add_btn").click(function(){//添加课题组成员
		var gname = $(".gname").val();
		var tid = $(".tid").val();
		var index = layui.layer.open({
			title : "添加课题组成员",
			type : 2, 
			area:["1000px","600px"],
			content : "../mode/addGroupmem.jsp",  
			success : function(layero, index){
				setTimeout(function(){ 
					layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
						tips: 3
					});
				},1000)
			}
		})			
	});
	
	form.on("submit(addGroup)",function(data){
		var tid=$(".tid").val()+""; 
		var gname=$(".gname").val();
		var ids = new Array();
		var gflag=1;
		$('tr').each(function(n){ //这里的n可有可无
			//开始遍历每一行的每一列
			for(var i=0;i<1;i++){
			var id=$(this).children('td').eq(i).text(); //这里就拿到了第n行第i列的文字，你可以赋值给其他变量
				ids.push(id);
			}
		})
		if(isRepeat(ids)){
			layer.msg("有重复数据");
			return false;
		}
		for(var i=1;i<ids.length;i++){
			var url="../../group/addMember";
			gflag=1;
		    $.ajax({ 
		    	url:url,
				type:"post", 
				dataType:"json",
				async:false,
				data:{"tid":tid,"gname":gname,"sid":ids[i]},
		        success:function(data){
		        	if(data.flag==-2){
		        		top.layer.msg("课题组长不存在");
		        		gflag=2;
		        		return false;
		        	}
		        },
		        error:function(){ 
		        	top.layer.close(index);
		        	top.layer.msg("访问后端接口异常！");
		        	flag=false;
		        	return false;
		        }
		     });
		    if(gflag==1){
		   		top.layer.msg("添加成功！", {icon: 1});
		   		layer.closeAll("iframe");
		   		parent.location.reload();
		    }else{
		    	return false;
		    }
		}
		 
	});
	
	function isRepeat(ary) {
		for (var i = ary.length-1; i >= 0; i--) {
		     if (ary.indexOf(ary[i]) != ary.lastIndexOf(ary[i])) {
		         return true;
		     }
		 } 
		return false;
	}
})
function delMember(obj){
	var tr = obj.parentNode.parentNode;
    tr.parentNode.removeChild(tr);
}
</script>
</body>
</html>