<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>项目成果后台管理</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/adminstyle.css" media="all">
</head>
<body>
<div class="layui-layout layui-layout-admin" id="layui_layout">
	<!-- 顶部区域 -->
	<div class="layui-header header header-demo">
		<div class="layui-main">
		    <!-- logo区域 -->
			<div class="admin-logo-box"> 
				<a class="logo" href="#" title="logo">项目成果管理</a>
				<div class="larry-side-menu">
					<i class="fa fa-bars" aria-hidden="true" style="margin-top:6px"></i>
				</div>
			</div>
            <!-- 右侧导航 -->
            <ul class="layui-nav larry-header-item">
            		<li class="layui-nav-item" readonly>
            			工号：<em class="tid"></em>
					</li>
					<li class="layui-nav-item">
						<a href="login.jsp">
                        <i class="iconfont icon-exit"></i>
						退出</a>
					</li>
            </ul>
		</div>
	</div>
	<!-- 左侧侧边导航开始 -->
	<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
		
		<!-- 左侧菜单 -->
		<ul class="layui-nav layui-nav-tree">
			<li class="layui-nav-item layui-this">
				<a href="javascript:;" data-url="main.jsp">
				    <i class="iconfont icon-home1" data-icon='icon-home1'></i>
					<span>后台首页</span>
				</a>
			</li>
			<!-- 个人信息 -->
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-jiaoseguanli" ></i>
					<span>账号</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-url="bar/changepwd.jsp">
                            <i class="iconfont icon-lanmuguanli" data-icon='icon-lanmuguanli'></i>
                            <span>修改密码</span>
                        </a>
                    </dd>
                </dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">
				   <i class="iconfont icon-jiaoseguanli2" ></i>
				   <span>教师</span>
				   <em class="layui-nav-more"></em>
				</a>
				    <dl class="layui-nav-child">
				    	<dd>
				    		<a href="javascript:;" data-url="mode/editTeacher.jsp">
				    		   <i class="iconfont icon-yonghu1" data-icon='icon-yonghu1'></i>
				    		   <span>修改信息</span>
				    		</a>
				    	</dd>
				    </dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">
				   <i class="iconfont icon-m-members" ></i>
				   <span>课题组</span>
				   <em class="layui-nav-more"></em>
				</a>
				    <dl class="layui-nav-child">
				    	<dd>
				    		<a href="javascript:;" data-url="bar/student.jsp">
				    		   <i class="iconfont icon-zhuti" data-icon='icon-zhuti'></i>
				    		   <span>我的学生</span>
				    		</a>
				    	</dd>
				    	<dd>
				    		<a href="javascript:;" data-url="bar/group.jsp">
				    		   <i class="iconfont icon-wenzhang2" data-icon='icon-wenzhang2'></i>
				    		   <span>我的课题组</span>
				    		</a>
				    	</dd>
				    </dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-jiaoseguanli4" ></i>
					<span>显示信息</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-url="mode/addResume.jsp">
                            <i class="iconfont icon-quanxian2" data-icon='icon-quanxian2'></i>
                            <span>我的履历</span>
                        </a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="bar/showCourse.jsp">
                            <i class="iconfont icon-lanmuguanli" data-icon='icon-lanmuguanli'></i>
                            <span>我的展示列表</span>
                        </a>
                    </dd>
                    <dd>
                        <a href="javascript:;" data-url="bar/content.jsp">
                            <i class="iconfont icon-word" data-icon='icon-quanxian2'></i>
                            <span>我的成果</span>
                        </a>
                    </dd>
                </dl>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;">
					<i class="iconfont icon-piliangicon" ></i>
					<span>数据字典</span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
                    <dd>
                        <a href="javascript:;" data-url="bar/course.jsp">
                            <i class="iconfont icon-wenzhang1" data-icon='icon-wenzhang1'></i>
                            <span>展示信息</span>
                        </a>
                    </dd>
                </dl>
			</li>
			</ul>
	    </div>
	</div>
 
	<!-- 左侧侧边导航结束 -->
	<!-- 右侧主体内容 -->
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
		<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
			<div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i> </div>
			<ul class="layui-tab-title">
				<li class="layui-this" id="admin-home"><i class="iconfont icon-diannao1"></i><em>后台首页</em></li>
			</ul>
			<div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div> 
			<div class="layui-tab-content" style="min-height: 150px; ">
				<div class="layui-tab-item layui-show">
					<iframe class="larry-iframe" data-id='0' src="main.jsp"></iframe>
				</div>
			</div> 
		</div>
	</div>
	<!-- 底部区域 -->
	<div class="layui-footer layui-larry-foot" id="larry-footer">
		<div class="layui-mian">  
		    <p class="p-admin">
		    	<span>2020 &copy;</span>
		    	 陈孝滋 毕业设计
		    </p>
		</div>
	</div>
</div>
<!-- 加载js文件-->                                                                                                                                                                                           
	<script type="text/javascript" src="common/layui/layui.js"></script> 
	<script type="text/javascript" src="js/larry.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
</body>
<script>
layui.use(['form','layer','jquery'],function(){ 
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;
	 
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
	    $(".tid").text(tid);		
	    var url = "../password/selectByTid";
	    $.ajax({	//查找信息数据回填
			  url:url,  
			  type:"post", 
			  dataType:"json", 
			  async:false,
			  data:{"tid":tid}, 
			  success:function(data){ 
				  if(data.flag==1){
					  $(".tid").text(tid+"   "+data.pass.tpower+",您好");
				  }else{
					  top.layer.msg("后端查询接口异常！");
				  }
			  },
			  error:function(){ 
				  top.layer.msg("后端查询接口异常！");
			  }
		});  
	}); 
})
</script>
</html>