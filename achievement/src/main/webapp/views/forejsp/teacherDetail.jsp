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
  <div class="layui-row layui-col-space8">
    <div class="layui-col-md2">
      <div class="layadmin-homepage-panel layadmin-homepage-shadow">
        <div class="layui-card text-center"><div class="layui-card-body" id="teacher_1"></div></div>
        <p class="layadmin-homepage-about">关于我</p>
        <ul class="layadmin-homepage-list-group" id="teacher_2"></ul>
        <div class="layadmin-homepage-pad-hor" id="teacher_3"></div>
        <p class="layadmin-homepage-about">展示列表（点击查看详情）</p>
        <ul class="layadmin-homepage-list-inline" id="teacher_5"></ul>
      </div>
    </div>
    <div class="layui-col-md10">
      <div class="layui-fluid layadmin-homepage-content">
        <div class="layui-row layui-col-space20 layadmin-homepage-list-imgtxt">
          <div class="layui-col-md9">
            <div class="grid-demo">
              <div class="panel-body layadmin-homepage-shadow">
                  <a href="javascript:;" class="media-left">
                    <div class="media-body"><p id="teacher_4" style="font-size:20px"></p></div>
                  </div>
              <div class="panel-body layadmin-homepage-shadow">
                  <div class="media-body" style="font-size:20px" id="teacher_6"></div>
                </div>
              <div class="panel-body layadmin-homepage-shadow">
                  <div class="media-body" style="font-size:20px" id="teacher_7"></div>
                </div>
                <div class="panel-body layadmin-homepage-shadow">
                    <div class="media-body" style="font-size:20px" id="teacher_8"></div>
                  </div>
                  <div class="panel-body layadmin-homepage-shadow">
                      <div class="media-body" style="font-size:20px" id="teacher_9"></div>
                    </div>
            </div>
          </div>
          <div class="layui-col-md3">
            <div class="grid-demo">
              <div class="layui-card homepage-top">
                <div class="layui-card-header">
                  <h3 class="panel-title"><i class="layui-icon layui-icon-user"></i>学生</h3>
                </div>
                <div class="layui-card-body">
                  <div class="layui-row layui-col-space15" id="teacher_10"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
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
	    var tid=theRequest.id;
	    get1to4(tid);
	    get5(tid);
	    get6to9(tid);
	    get10(tid);
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
function get1to4(tid){
	$.ajax({//教师信息
		url:"../../teacher/selectTeacherByTid",
		type:"post", 
		dataType:"json",
		async:false, 
	    data:{"tid":tid},  
	    success:function(data){
    	  var str1='<div class="layadmin-homepage-pad-ver">'+
              			'<img class="layadmin-homepage-pad-img" src="data:image/jpg;base64,'+data.teacher.timg+'" width="96" height="96">'+
            		'</div>'+
		            '<h4 class="layadmin-homepage-font">'+data.teacher.tname+'</h4>'+
		            '<p class="layadmin-homepage-min-font">'+data.teacher.tprofession+'</p>';
		  var str2='<li class="list-group-item"><i class="layui-icon layui-icon-location"></i>'+data.teacher.tplace+'</li>'+
	          '<li class="list-group-item"><a href="javascript:;" class="color"><span class="color" style="word-wrap:break-word;">学院：'+data.teacher.tunit+'</span></a></li>'+
	          '<li class="list-group-item"><a href="javascript:;" class="color"><span class="color" style="word-wrap:break-word;">专业：'+data.teacher.tmajor+'</span></a></li>'+
	          '<li class="list-group-item"><a href="javascript:;" class="color"><span class="color" style="word-wrap:break-word;">邮箱：'+data.teacher.tmail+'</span></a></li>'+
	          '<li class="list-group-item"><a href="javascript:;" class="color"><span class="color" style="word-wrap:break-word;">电话：'+data.teacher.telephone+'</span></a></li>';
          var str3='<mdall>'+data.teacher.tpersonal+'</mdall>';
	      var str4=data.teacher.tname+'，性别，'+data.teacher.tsex+',毕业于'+data.teacher.tschool+',在校期间获得'+data.teacher.tdegree+'学位，主修'+
	      data.teacher.tmajor+'专业。于'+data.teacher.tintime+'入职，当前办公地址位于：'+data.teacher.tplace+'。'+data.teacher.tpersonal;
          	$('#teacher_1').append(str1);
        	$('#teacher_2').append(str2);
        	$('#teacher_3').append(str3);
        	$('#teacher_4').append(str4);
	    }, 
	    error:function(){ 
	    	top.layer.msg("后端查询接口异常！"); 
	    } 
	 });  
} 
function get5(tid){//展示列表
	$.ajax({
		url:"../../course/selectCourseById",
		type:"post", 
		dataType:"json",
		async:false, 
	    data:{"tid":tid},  
	    success:function(data){
	    	var str5='';
	    	for(var i=0;i<data.list.length;i++){
	    		str5+='<a href="courseDetail.jsp?tid='+tid+'&cid='+data.list[i].cid+'&&cname='+data.list[i].cname+'" class="layui-btn layui-btn-primary">'+data.list[i].cname+'</a>';
	    	}
          	$('#teacher_5').append(str5);
	    }, 
	    error:function(){ 
	    	top.layer.msg("后端查询接口异常！"); 
	    } 
	 });  
}
function get10(tid){//学生信息
		$.ajax({
			url:"../../student/selectStudentByTeacherTid", 
			type:"post", 
			dataType:"json",
			async:false, 
		    data:{"tid":tid}, 
		    success:function(data){
              var str10 = '';
              for(var i=0;i<data.list.length;i++){
              	str10+= '<div class="layui-col-md4">'+'<img style="width:103px;height:103px" src="data:image/jpg;base64,'+data.list[i].simg+'">'+
              	'<p>'+data.list[i].sname+'/'+data.list[i].sedu+'</p>'+'</div>';
              }
              $('#teacher_10').append(str10);
		    }, 
		    error:function(){ 
		    	top.layer.msg("后端查询接口异常！");
		    }
		 });  
}
function get6to9(tid){
	$.ajax({//查询教育经历
		url:"../../education/selectEducation",
		type:"post", 
		dataType:"json", 
		async:false,
		data:{"tid":tid}, 
		success:function(data){		
			if(data.flag==-1){
				layer.msg('教育经历查询失败', {icon: 2});
			}else{
				var str6 = '<div class="pad-btm"><p class="fontColor"><span>教育经历</span></p></div>'; 
				for(var i=0;i<data.list.length;i++){
					str6+= '<p>'+data.list[i].etime+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data.list[i].edesc+'</p>';
				}
				$('#teacher_6').append(str6);
			}
		}
	});
	$.ajax({//查询工作经历
		url:"../../work/selectWork",
		type:"post", 
		dataType:"json",  
		async:false,
		data:{"tid":tid}, 
		success:function(data){		
			if(data.flag==-1){
				layer.msg('工作经历查询失败', {icon: 2});
			}else{
				var str7 = '<div class="pad-btm"><p class="fontColor"><span>工作经历</span></p></div>'; 
				for(var i=0;i<data.list.length;i++){
					str7+= '<p>'+data.list[i].wtime+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data.list[i].wdesc+'</p>';
				}
				$('#teacher_7').append(str7);
			}
		}
	});
	$.ajax({//查询社会兼职
		url:"../../social/selectSocial",
		type:"post", 
		dataType:"json",  
		async:false,
		data:{"tid":tid}, 
		success:function(data){		
			if(data.flag==-1){
				layer.msg('社会兼职查询失败', {icon: 2});
			}else{
				var str8 = '<div class="pad-btm"><p class="fontColor"><span>社会兼职</span></p></div>'; 
				for(var i=0;i<data.list.length;i++){
					str8+= '<p>'+data.list[i].sdesc+'</p>';
				}
				$('#teacher_8').append(str8);
			}
		}
	});
	$.ajax({//查询研究方向
		url:"../../research/selectResearch",
		type:"post", 
		dataType:"json",  
		async:false,
		data:{"tid":tid}, 
		success:function(data){		
			if(data.flag==-1){
				layer.msg('研究方向查询失败', {icon: 2});
			}else{
				var str9 = '<div class="pad-btm"><p class="fontColor"><span>研究方向</span></p></div>'; 
				for(var i=0;i<data.list.length;i++){
					str9+= '<p>'+data.list[i].rdesc+'</p>';;
				}
				$('#teacher_9').append(str9);
			}
		}
	});
}

</script>
</html>