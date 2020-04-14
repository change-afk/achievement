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
	<form class="layui-form" id="myForm">
		<div class="layui-form-item">
			<label class="layui-form-label">成果标题</label>
			<div class="layui-input-block">
				<input class="layui-input tcname" lay-verify="required" placeholder="请输入成果标题" type="text">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">		
				<label class="layui-form-label">成果归属</label>
				<div class="layui-input-inline">
					<input class="layui-input tid" lay-verify="required" placeholder="请输入工号" type="text">
				</div>
				<button class="layui-btn layui-btn-small layui-btn-normal" id="find" style="margin-top:5px">
					<i class="layui-icon">&#xe615;</i><em>校验</em>
				</button>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">成果类型</label>
				<div class="layui-input-inline" id="type">
				</div>
			</div>
		</div>
		<div class="layui-form-item" id="kycg">
			<div class="layui-inline">
				<label class="layui-form-label">立项时间</label>
				<div class="layui-input-inline">
					<input class="layui-input creatime" placeholder="请输入立项时间" type="text">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">项目来源</label>
				<div class="layui-input-inline">
					<input class="layui-input comefrom" placeholder="请输入项目来源" type="text">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">项目经费</label>
				<div class="layui-input-inline">
					<input class="layui-input money" placeholder="请输入(万元)" type="number">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">其中校外经费</label>
				<div class="layui-input-inline">
					<input class="layui-input outschool" placeholder="请输入(万元)" type="number">
				</div>
			</div>
		</div>
		<div class="layui-form-item" id="lwcg">
			<div class="layui-inline">
				<label class="layui-form-label">刊物名称</label>
				<div class="layui-input-inline">
					<input class="layui-input sendname" placeholder="请输入刊物名称" type="text">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">刊物级别</label>
				<div class="layui-input-inline">
					<input class="layui-input sendtype" placeholder="请输入刊物级别" type="text">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">发表时间</label>
				<div class="layui-input-inline">
					<input class="layui-input sendtime" placeholder="发表时间" type="text">
				</div>
			</div>
		</div>
		<div class="layui-form-item" id="zlcg">
			<div class="layui-inline">
				<label class="layui-form-label">所属单位</label>
				<div class="layui-input-inline">
					<input class="layui-input belongunit" placeholder="请输入所属单位" type="text">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">专利类型</label>
				<div class="layui-input-inline">
					<input class="layui-input belongtype" placeholder="请输入专利类型" type="text">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">授权号</label>
				<div class="layui-input-inline">
					<input class="layui-input belongnum" placeholder="请输入授权号" type="text">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">授权日期</label>
				<div class="layui-input-inline">
					<input class="layui-input belongtime" placeholder="请输入授权日期" type="text">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">成果内容</label>
			<div class="layui-input-block">
				<textarea lay-verify="required" placeholder="请输入成果内容" class="layui-textarea tcontent" style="height:550px"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="addContent">立即提交</button>
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
		 $("#kycg").hide();
		 $("#lwcg").hide();
		 $("#zlcg").hide();
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
  	    	$('.tid').attr("value", id);
  	    	$(".tid").attr("disabled", true); 
  	    }
		var url = "../../course/selectAllCourse";
		$.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
			data:{}, 
			success:function(data){		
				var str='<select name="type" lay-filter="type"><option value="">请选择</option>';
				for(var i=0;i<data.list.length;i++){
					str+='<option value="'+data.list[i].cid+'">'+data.list[i].cname+'</option>';
				}
				str+='</select>';
				$('#type').append(str);
				document.getElementById("myForm").reset()
			} 
		});
	}); 
	
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
	
	form.on('select(type)', function(data){
			var type=data.elem[data.elem.selectedIndex].text;
			if(type=="科研成果"){
				$("#kycg").show();
				$("#lwcg").hide();
				$("#zlcg").hide();
			}else if(type=="论文成果"){
				$("#lwcg").show();
				$("#kycg").hide();
				$("#zlcg").hide();
			}else if(type=="专利成果"){
				$("#zlcg").show();
				$("#kycg").hide();
				$("#lwcg").hide();
			}else{
				$("#kycg").hide();
				$("#lwcg").hide();
				$("#zlcg").hide();
			}
        }); 
	
	form.on("submit(addContent)",function(data){
		var cid = data.field.type;
		if(cid==""){
			layer.msg("请选择类型");
			return false;
		}
		var tcname = $(".tcname").val();
		var tid = $(".tid").val(); 
		var tcontent = $(".tcontent").val(); 
		var creatime = $(".creatime").val(); 
		var comefrom = $(".comefrom").val(); 
		var money = $(".money").val(); 
		var outschool = $(".outschool").val(); 
		var sendtime = $(".sendtime").val(); 
		var sendname = $(".sendname").val(); 
		var sendtype = $(".sendtype").val(); 
		var belongunit = $(".belongunit").val(); 
		var belongtype = $(".belongtype").val(); 
		var belongnum = $(".belongnum").val(); 
		var belongtime = $(".belongtime").val(); 
		var url = "../../content/addContent";
		 $.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false,
		    data:{
		    		"tcname":tcname,"tid":tid,"cid":cid,"tcontent":tcontent,"creatime":creatime,"comefrom":comefrom,"money":money,"outschool":outschool
		    		,"sendtime":sendtime,"sendname":sendname,"sendtype":sendtype,"belongunit":belongunit,"belongtype":belongtype,"belongnum":belongnum,"belongtime":belongtime
		    	}, 
	        success:function(data){
	        	if(data.flag=="1"){
	        		top.layer.msg("添加成功！", {icon: 1});
	        		layer.closeAll("iframe");
	        		parent.location.reload(); 
	        	}else if(data.flag=="-2"){
	        		top.layer.msg("添加失败"+tid+"不存在，请校验成果归属", {icon: 2});
	        	} 
	        },
	        error:function(){ 
	        	top.layer.msg("添加失败，请检查标题(名称不可重复)！"); 
	        }
	     });   
 		return false;
		})
 	
})
</script>
</html>