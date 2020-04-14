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
  <li class="layui-nav-item"><a href="/achievement/views/foreindex.jsp">研究中心主页</a></li>
  <li class="layui-nav-item"><a href="/achievement/views/foreindex.jsp">成员列表</a></li>
  <li class="layui-nav-item"><a href="/achievement/views/forejsp/groupDetail.jsp">课题组列表</a></li>
  <li class="layui-nav-item">
    <a href="javascript:;">成果展示</a>
    <dl class="layui-nav-child" id="showCourse">
    </dl>
  </li>
  <li class="layui-nav-item"><a href="/achievement/views/forejsp/news.jsp">新闻动态</a></li>
  <li class="layui-nav-item"><a href="/achievement/views/login.jsp">登录</a></li>
</ul>
<div class="layui-fluid layadmin-homepage-fluid">
  <div class="layui-row layui-col-space8 ">
    <div class="layui-col-md6" style="margin-left:400px;font-size:20px;">
      <div class="layadmin-homepage-panel layadmin-homepage-shadow" id="groupDetail">
      </div>
    </div>
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
	  var url = location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
		 var theRequest = new Object()
		 if (url.indexOf('?') != -1) {
		 var str = url.substr(1) //substr()方法返回从参数值开始到结束的字符串；
		 var strs = str.split('&')
		 for (var i = 0; i < strs.length; i++) {
		    theRequest[strs[i].split('=')[0]] = strs[i].split('=')[1]
		 	}
		 } 
	    var gname=theRequest.gname;
	    var tname=theRequest.tname;
	    getMsg(gname,tname);
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
  
});
function getMsg(gname,tname){
	gname=decodeURI(gname);
	tname=decodeURI(tname);
	$.ajax({//课题组详细信息
		url:"../../group/selectGroupByGname",
		type:"post", 
		dataType:"json",
		async:false, 
	    data:{"gname":gname,"tname":tname},  
	    success:function(data){
	    	var countMap = eval(data.list[0]);
	    	var stu = new Array(); //定义一数组
	    	stu = countMap.sname.split(",");
	    	 var str='<div class="layui-card text-center"><div class="layui-card-body"><div class="layadmin-homepage-pad-ver">'+
              '<img class="layadmin-homepage-pad-img" src="data:image/jpg;base64,'+countMap.timg+'" width="96" height="96">'+
              '</div><h4 class="layadmin-homepage-font">'+countMap.tname+'(负责人)</h4><p class="layadmin-homepage-min-font">'+countMap.tprofession+'</p>'+
              '</div></div><p class="layadmin-homepage-about text-center">课题名称：'+countMap.gname+'</p><ul class="layadmin-homepage-list-group text-center">'+
              '<li class="list-group-item"><i class="layui-icon layui-icon-location"></i>'+countMap.tschool+'----'+countMap.tplace+'</li>'+
              '<li class="list-group-item"><a href="javascript:;" class="color"><span style="word-wrap:break-word;">学院：'+countMap.tunit+'</span></a></li>'+
              '<li class="list-group-item"><a href="javascript:;" class="color"><span style="word-wrap:break-word;">专业：'+countMap.tmajor+'</span></a></li>'+
              '<li class="list-group-item"><a href="javascript:;" class="color"><span style="word-wrap:break-word;">邮箱：'+countMap.tmail+'</span></a></li>'+
              '<li class="list-group-item"><a href="javascript:;" class="color"><span style="word-wrap:break-word;">电话：'+countMap.telephone+'</span></a></li>'+
              '<li class="list-group-item"><a href="javascript:;" class="color"><span style="word-wrap:break-word;">入职时间：'+countMap.tintime+'</span></a></li>'+
              '</ul><div class="layadmin-homepage-pad-hor text-center"><mdall>'+countMap.tpersonal+'</mdall></div><p class="layadmin-homepage-about text-center">课题组成员</p>'+
        	  '<ul class="layadmin-homepage-list-inline text-center">';
	    	 for(var i=0;i<stu.length;i++){
	    		 str+='<a href="javascript:;" class="layui-btn layui-btn-primary">'+stu[i]+'</a>';
		    }
	    	 str+=' </ul>';
        	$('#groupDetail').append(str);   
	    }, 
	    error:function(){ 
	    	top.layer.msg("后端查询接口异常！"); 
	    } 
	 });  
} 
</script>
</html>