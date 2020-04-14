<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>研究中心</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	 
    <link rel="stylesheet" href="/achievement/views/layuiadmin/layui/css/layui.css" media="all">
  	<link rel="stylesheet" href="/achievement/views/layuiadmin/style/admin.css" media="all">
  	<link rel="stylesheet" href="/achievement/views/layuiadmin/style/template.css" media="all">
</head>
<body>

<ul class="layui-nav">
  <li class="layui-nav-item"><a href="#">研究中心主页</a></li>
  <li class="layui-nav-item"><a href="#">成员列表</a></li>
  <li class="layui-nav-item"><a href="/achievement/views/forejsp/groupDetail.jsp">课题组列表</a></li>
  <li class="layui-nav-item">
    <a href="javascript:;">成果展示</a>
    <dl class="layui-nav-child" id="showCourse">
      <!-- <dd><a href="#">教师</a></dd>
      <dd><a href="/achievement/views/forejsp/groupDetail.jsp">课题组</a></dd> -->
    </dl>
  </li>
  <li class="layui-nav-item"><a href="/achievement/views/forejsp/news.jsp">新闻动态</a></li>
  <li class="layui-nav-item"><a href="/achievement/views/login.jsp">登录</a></li>
</ul>
<div class="layui-fluid layadmin-cmdlist-fluid">
  <div class="layui-row layui-col-space30" id="showMsg" style="margin-bottom:5px;">
  </div> 
 	<div class="larry-table-page clearfix"> 
        <div id="demo0"></div>    
    </div>  
</div> 
<script src="/achievement/views/common/layui/layui.js"></script>  
</body> 
<script>
layui.use(['jquery','layer','element','laypage'],function(){
    window.jQuery = window.$ = layui.jquery;
    window.layer = layui.layer; 
var element = layui.element,laypage = layui.laypage;
   
  $(document).ready(function() {
		var url = "/achievement/teacher/selectTeacher2"; 
		$.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false, 
		    data:{},  
		    success:function(data){
	    	  pages = data.page.totalPage; 
	    	  //$('#showMsg').html("");
            var str = '';var j=1;
            for(var i=0;i<data.list.length;i++){
            	str+= '<div class="layui-col-md2 layui-col-sm4">'+
                      	'<div class="cmdlist-container">'+
                			'<a href="/achievement/views/forejsp/teacherDetail.jsp?id='+data.list[i].tid+'">'+'<img style="width:287px;height:300px" src="data:image/jpg;base64,'+data.list[i].timg+'">'+'</a>'+
	                		'<a href="/achievement/views/forejsp/teacherDetail.jsp?id='+data.list[i].tid+'">'+'<div class="cmdlist-text">'+'<div class="price">'+
		                    		'<p style="display:none">'+data.list[i].tid+'</p>'+
		                        	'<b>'+data.list[i].tschool+'</b>'+
		                        	'<span class="flow">'+data.list[i].tname+'/'+data.list[i].tprofession+'</span>'+
		                    '</div>'+'</div>'+'</a>'+ 
            			'</div>'+
        			  '</div>'
            }
            $('#showMsg').append(str);
		    },
		    error:function(){ 
		    	top.layer.msg("后端查询接口异常！");
		    } 
		 });  
		$.ajax({
			url:"/achievement/course/selectAllCourse",
			type:"post", 
			dataType:"json",
			async:false, 
		    data:{},  
		    success:function(data){
		    	var str=''; 
	            for(var i=0;i<data.list.length;i++){
	            	str+= '<dd><a href="/achievement/views/forejsp/course.jsp?cid='+data.list[i].cid+'&&cname='+data.list[i].cname+'">'+data.list[i].cname+'</a></dd>';
	            }
            	$('#showCourse').append(str);
		    },
		    error:function(){ 
		    	top.layer.msg("后端查询接口异常！");
		    } 
		 });  
	});
	 pageFind();//调用分页方法 
  
  //总页数低于页码总数 
 /*  laypage.render({
    elem: 'demo0',
    count: 50 //数据总数 
  });  */
});

function pageFind(){
	layui.use(['jquery','layer','element','laypage'],function(){
	      window.jQuery = window.$ = layui.jquery;
	      window.layer = layui.layer;
      var element = layui.element,laypage = layui.laypage;
      
	 laypage({ 
		  cont: 'demo0',
		  pages: pages ,//总页数
		  groups: 3 ,//连续显示分页数 
		  jump: function(obj, first) {
			  //得到了当前页，用于向服务端请求对应数据
			  var curr = obj.curr;
			  var url = "/achievement/teacher/selectTeacher2";
			  if(!first) { 
				  $.ajax({
					  url:url,
					  type:"post", 
					  dataType:"json",
					  async:false,
					  data:{"currPage":curr}, 
					  success:function(data){ 
						  $('#showMsg').html("");
						  var str = '';var j=1; 
						  for(var i=0;i<data.list.length;i++){
			            	str+= '<div class="layui-col-md2 layui-col-sm4">'+
			                      	'<div class="cmdlist-container">'+
			                      	'<a href="/achievement/views/forejsp/teacherDetail.jsp?id='+data.list[i].tid+'">'+'<img style="width:287px;height:300px" src="data:image/jpg;base64,'+data.list[i].timg+'">'+'</a>'+
			                      	'<a href="/achievement/views/forejsp/teacherDetail.jsp?id='+data.list[i].tid+'">'+'<div class="cmdlist-text">'+'<div class="price">'+
					                    		'<p style="display:none">'+data.list[i].tid+'</p>'+
					                        	'<b>'+data.list[i].tschool+'</b>'+
					                        	'<span class="flow">'+data.list[i].tname+'/'+data.list[i].tprofession+'</span>'+
					                    '</div>'+'</div>'+'</a>'+
			            			'</div>'+
			        			  '</div>'
			            } 
						  $('#showMsg').append(str);
					  },
					  error:function(){ 
						  top.layer.msg("后端查询接口异常！");
					  }
				  });  
			  }
		  }
	  }); 
	});
} 
</script>
</html>