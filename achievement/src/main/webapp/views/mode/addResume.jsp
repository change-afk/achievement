<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加履历</title>
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
				<label class="layui-form-label tid"></label>
			</div>
			<div class="layui-inline">		
				<label class="layui-form-label">姓名</label>
				<label class="layui-form-label tname"></label>
			</div>
		</div>
		<blockquote class="layui-elem-quote layui-quote-nm"> 教育经历：
			<a class="layui-btn edu_add_btn">添加</a>
		</blockquote>
		<div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
               <div class="layui-tab-item layui-field-box layui-show">
                    <table class="layui-table table-hover" lay-even="" lay-skin="row">
                         <thead>
                             <tr>
                             	 <th></th>
                             	 <th style="display:none"></th> 
                                 <th style="width:300px">时间</th>
                                 <th>概述</th>
                                 <th style="width:150px">操作</th>
                             </tr>
                         </thead>
                         <tbody id="educationTable">
                         </tbody>
                    </table>
		    </div>
	    </div>
		<blockquote class="layui-elem-quote layui-quote-nm"> 工作经历：
			<a class="layui-btn work_add_btn">添加</a>
		</blockquote>
		<div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
               <div class="layui-tab-item layui-field-box layui-show">
                    <table class="layui-table table-hover" lay-even="" lay-skin="row">
                         <thead>
                             <tr>
                             	 <th></th>
                             	 <th style="display:none"></th> 
                                 <th style="width:300px">时间</th>
                                 <th>概述</th>
                                 <th style="width:150px">操作</th>
                             </tr>
                         </thead>
                         <tbody id="workTable">
                         </tbody>
                    </table>
		    </div>
	    </div>
		<blockquote class="layui-elem-quote layui-quote-nm"> 社会兼职：
			<a class="layui-btn social_add_btn">添加</a>
		</blockquote>
		<div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
               <div class="layui-tab-item layui-field-box layui-show">
                    <table class="layui-table table-hover" lay-even="" lay-skin="row">
                         <thead>
                             <tr>
                             	 <th></th>
                             	 <th style="display:none"></th> 
                                 <th>社会兼职内容</th>
                                 <th style="width:150px">操作</th>
                             </tr>
                         </thead>
                         <tbody id="socialTable">
                         </tbody>
                    </table>
		    </div>
	    </div>
		<blockquote class="layui-elem-quote layui-quote-nm"> 研究方向：
			<a class="layui-btn research_add_btn">添加</a>
		</blockquote>
		<div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
               <div class="layui-tab-item layui-field-box layui-show">
                    <table class="layui-table table-hover" lay-even="" lay-skin="row">
                         <thead>
                             <tr>
                             	 <th></th>
                             	 <th style="display:none"></th> 
                                 <th>研究方向概述</th>
                                 <th style="width:150px">操作</th>
                             </tr>
                         </thead>
                         <tbody id="researchTable">
                         </tbody>
                    </table>
		    </div>
	    </div>
	</form>
	

<script type="text/javascript" src="../common/layui/layui.all.js"></script>
<script type="text/javascript" src="../jslib/addResume.js"></script>
</body>
<script>
layui.use(['form','layer','jquery'],function(){ 
	var form = layui.form,
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
	    var type=theRequest.type;
	    $(".tid").text(tid);		
	    if(type==teacher){
	    var url = "../../teacher/selectTeacherByTid";
	    $.ajax({	//查找信息数据回填
			  url:url,  
			  type:"post", 
			  dataType:"json", 
			  async:false,
			  data:{"tid":tid}, 
			  success:function(data){ 
				  if(data.flag==1){
					  $(".tid").text(data.teacher.tid);
					  $(".tname").text(data.teacher.tname);
				  }else{
					  top.layer.msg("后端查询接口异常！");
				  }
			  },
			  error:function(){ 
				  top.layer.msg("后端查询接口异常！");
			  }
		}); 
	    }
	}); 
})
</script>
</html>