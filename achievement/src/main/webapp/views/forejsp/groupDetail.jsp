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
<div class="layui-fluid layadmin-maillist-fluid">
  <div class="layui-row layui-col-space15" id="groupDetail" style="margin-bottom:5px;">
  <!--   <div class="layui-col-md4 layui-col-sm6">
      <div class="layadmin-contact-box" id="groupDetail"> 
          <div class="layui-col-md4 layui-col-sm6">
            <a href="javascript:;">
              <div class="layadmin-text-center">
                <img src="../layuiadmin/style/res/template/character.jpg">
                <div class="layadmin-maillist-img layadmin-font-blod">教授</div>
              </div>
            </a>
          </div> 
    	<div class="layui-col-md8 layadmin-padding-left20 layui-col-sm6">
          <a href="javascript:;">
            <h3 class="layadmin-title">
              <strong>人工智能</strong>
            </h3>
            <p class="layadmin-textimg">
              <i class="layui-icon layui-icon-location"></i>
              	办公地址
            </p>
          </a>
          <div class="layadmin-address">
            <a href="javascript:;">
              <strong>负责人：张三</strong>
              <br>
                            电话:18859147000
              <br>
                            邮箱:xxx@baidu.com
              <br>
                            课题组成员: https://weibo.com/hu_ge 
            </a>
          </div>
        </div>
      </div>
    </div> -->
 
  </div>
  <div class="larry-table-page clearfix">  
     <div style="text-align:center" id="demo0"></div>    
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
	  var url = "../../group/selectForFore";
	  $.ajax({
			url:url,
			type:"post", 
			dataType:"json",
			async:false, 
		    data:{}, 
		    success:function(data){
	    	  pages = data.page.totalPage; 
            var str = '';
            var countMap = eval(data.list);
        	for (var i=0;i<countMap.length;i++){ 
            	str+='<div class="layui-col-md4 layui-col-sm6"><div class="layadmin-contact-box"><div class="layui-col-md4 layui-col-sm6">'+
            			'<a href="/achievement/views/forejsp/groupDetail2.jsp?gname='+countMap[i].gname+'&&tname='+countMap[i].tname+'">'+
                  		'<div class="layadmin-text-center"><img style="width:152px;height:152px" src="data:image/jpg;base64,'+countMap[i].timg+'">'+
                  		'<div class="layadmin-maillist-img layadmin-font-blod">'+countMap[i].tprofession+'</div></div></a></div>' +
            			'<div class="layui-col-md8 layadmin-padding-left20 layui-col-sm6"><h3 class="layadmin-title"><strong>'+countMap[i].gname+
                       '</strong></h3><p class="layadmin-textimg"></br>'+'</p>'+
                  		'<div class="layadmin-address">'+'<a href="/achievement/views/forejsp/groupDetail2.jsp?gname='+countMap[i].gname+'&&tname='+countMap[i].tname+'">'+
                  		'负责人：'+countMap[i].tname+'</br></br>课题组成员:'+countMap[i].sname+'</a></div></div></div></div>';  
            } 
            $('#groupDetail').append(str);
		    },
		    error:function(){ 
		    	top.layer.msg("后端查询接口异常！");
		    } 
		 });   
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
  pageFind();//调用分页方法 
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
			  var url = "../../group/selectForFore";
			  if(!first) { 
				  $.ajax({
					  url:url,
					  type:"post", 
					  dataType:"json",
					  async:false,
					  data:{"currPage":curr}, 
					  success:function(data){ 
						  $('#groupDetail').html("");
						  var str = '';
						  var countMap = eval(data.list);
				          for (var i=0;i<countMap.length;i++){ 
							  /* str+='<div class="layui-col-md4 layui-col-sm6"><div class="layadmin-contact-box"><div class="layui-col-md4 layui-col-sm6">'+
		                  		'<div class="layadmin-text-center"><img style="width:152px;height:152px" src="data:image/jpg;base64,'+countMap[i].timg+'">'+
		                  		'<div class="layadmin-maillist-img layadmin-font-blod">'+countMap[i].tprofession+'</div></div></div>' +
		            			'<div class="layui-col-md8 layadmin-padding-left20 layui-col-sm6"><h3 class="layadmin-title"><strong>'+countMap[i].gname+
		                       '</strong></h3><p class="layadmin-textimg"><i class="layui-icon layui-icon-location"></i>'+countMap[i].tplace+'</p>'+
		                  		'<div class="layadmin-address"><strong>负责人：'+countMap[i].tname+'</strong><br>电话:'+countMap[i].telephone+
		                      	'<br>邮箱:'+countMap[i].tmail+'<br>课题组成员:'+countMap[i].sname+'</div></div></div></div>'; */
				        	  str+='<div class="layui-col-md4 layui-col-sm6"><div class="layadmin-contact-box"><div class="layui-col-md4 layui-col-sm6">'+
		            			'<a href="/achievement/views/forejsp/groupDetail2.jsp?gname='+countMap[i].gname+'&&tname='+countMap[i].tname+'">'+
		                  		'<div class="layadmin-text-center"><img style="width:152px;height:152px" src="data:image/jpg;base64,'+countMap[i].timg+'">'+
		                  		'<div class="layadmin-maillist-img layadmin-font-blod">'+countMap[i].tprofession+'</div></div></a></div>' +
		            			'<div class="layui-col-md8 layadmin-padding-left20 layui-col-sm6"><h3 class="layadmin-title"><strong>'+countMap[i].gname+
		                       '</strong></h3><p class="layadmin-textimg"></br>'+'</p>'+
		                  		'<div class="layadmin-address">'+'<a href="/achievement/views/forejsp/groupDetail2.jsp?gname='+countMap[i].gname+'&&tname='+countMap[i].tname+'">'+
		                  		'负责人：'+countMap[i].tname+'</br></br>课题组成员:'+countMap[i].sname+'</a></div></div></div></div>';  
		            	}
						  $('#groupDetail').append(str);
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