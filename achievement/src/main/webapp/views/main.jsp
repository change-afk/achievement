<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>LarryBlogCMS-Home</title>
    <meta name="renderer" content="webkit"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
    <meta name="apple-mobile-web-app-capable" content="yes">  
    <meta name="format-detection" content="telephone=no"> 
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css">
	<link rel="stylesheet" type="text/css" href="css/main.css" media="all">
</head>
<body>
<section class="larry-wrapper">
    <!-- overview -->
	<div class="row state-overview">
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol userblue layui-anim layui-anim-rotate"> <i class="iconpx-users"></i>
				</div>
				<div class="value">
					<a href="#">
						<h1 id="count1"></h1>
					</a>
					<p>教师总量</p>
				</div>
			</section>
		</div>
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol commred layui-anim layui-anim-rotate"> <i class="iconpx-user-add"></i>
				</div>
				<div class="value">
					<a href="#">
						<h1 id="count2"></h1>
					</a>
					<p>学生总量</p>
				</div>
			</section>
		</div>
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol articlegreen layui-anim layui-anim-rotate">
					<i class="iconpx-file-word-o"></i>
				</div>
				<div class="value">
					<a href="#">
						<h1 id="count3"></h1>
					</a>
					<p>课题组总量</p>
				</div>
			</section>
		</div>
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol rsswet layui-anim layui-anim-rotate">
					<i class="iconpx-check-circle"></i>
				</div>
				<div class="value">
					<a href="#">
						<h1 id="count4"></h1>
					</a>
					<p>记录成果数</p>
				</div>
			</section>
		</div>
	</div>
	<!-- overview end -->
	<div class="row">
		<div class="col-lg-6">
			<section class="panel">
				<header class="panel-heading bm0">
					<span class='span-title'>系统概览</span>
					<span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
				</header>
				<div class="panel-body" >
					<table class="table table-hover personal-task">
                         <tbody>
                         	<tr>
                         		<td>
                         			<strong>网站名称</strong>： 研究中心管理系统
                         		</td>
                         		<td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>当前登录用户</strong>： <span class="current_user user"></span>
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>当前权限</strong>： <span class="current_user power"></span>
                                </td>
                                <td></td>
                         	</tr>
                         </tbody>
					</table>
				</div>
			</section>
      <!-- 网站信息统计｛SEO数据统计｝ -->
		</div>
		<div class="col-lg-6">
		     <!-- 快捷操作 -->
          <!-- 系统公告 -->
             <section class="panel">
                 <header class="panel-heading bm0">
                        <span class='span-title'>系统公告</span>
                        <span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
                  </header>
                  <div class="panel-body">
                        <table class="table table-hover personal-task shortcut">
                            <tr>
                              <td>
                                <div class="c1">公告1</div>
                                <div class="c2">公告2</div>
                                <br>
                              </td>
                            </tr>
                        </table>
                  </div>
             </section>
		</div>
	</div>

</section>

<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['jquery','layer','element'],function(){
		window.jQuery = window.$ = layui.jquery;
		window.layer = layui.layer;
        window.element = layui.element();

       $('.panel .tools .iconpx-chevron-down').click(function(){
       	   var el = $(this).parents(".panel").children(".panel-body");
       	   if($(this).hasClass("iconpx-chevron-down")){
       	   	   $(this).removeClass("iconpx-chevron-down").addClass("iconpx-chevron-up");
       	   	   el.slideUp(200);
       	   }else{
       	   	   $(this).removeClass("iconpx-chevron-up").addClass("iconpx-chevron-down");
       	   	   el.slideDown(200);
       	   }
       })

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
  	    var id=theRequest.id;
	    var ty=theRequest.type;
	    $(".user").text(id);
	    $(".power").text(ty);
	    getTeacher();getStudent();getGroup();getCourse();
       });
       
});
	function getTeacher(){
		var url = "../teacher/selectNum";
  		$.ajax({
  			url:url,
  			type:"post", 
  			dataType:"json",
  			async:false, 
  		    data:{}, 
  		    success:function(data){
                $("#count1").text(data.num);
  		    },
  		    error:function(){ 
  		    	top.layer.msg("数据查询失败！");
  		    }
  		 });  
	}
	function getStudent(){
		var url = "../student/selectNum";
  		$.ajax({
  			url:url,
  			type:"post", 
  			dataType:"json",
  			async:false, 
  		    data:{}, 
  		    success:function(data){
                $("#count2").text(data.num);
  		    },
  		    error:function(){ 
  		    	top.layer.msg("数据查询失败！");
  		    }
  		 });  
	}
	function getGroup(){
		var url = "../group/selectNum";
  		$.ajax({
  			url:url,
  			type:"post", 
  			dataType:"json",
  			async:false, 
  		    data:{}, 
  		    success:function(data){
                $("#count3").text(data.num);
  		    },
  		    error:function(){ 
  		    	top.layer.msg("数据查询失败！");
  		    }
  		 });  
	}
	function getCourse(){
		var url = "../course/selectNum";
  		$.ajax({
  			url:url,
  			type:"post", 
  			dataType:"json",
  			async:false, 
  		    data:{}, 
  		    success:function(data){
                $("#count4").text(data.num);
  		    },
  		    error:function(){ 
  		    	top.layer.msg("数据查询失败！");
  		    }
  		 });  
	}
</script>
<script type="text/javascript" src="jsplug/echarts.min.js"></script>
</body>
</html>