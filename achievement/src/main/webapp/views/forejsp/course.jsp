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
    <div class="layui-col-md13">
        <div class="layui-card layadmin-serach-main">
          <div class="layui-card-body">
            
            <ul class="layadmin-serach-list layui-text" id="title">
              <!-- <li>
                <div class="layui-serachlist-text">
                  <h3><a href="">心姐是男是女？</a></h3>
                </div>
              </li> -->
            </ul>
            <div class="larry-table-page clearfix" style="text-align: center;"><div id="demo0"></div>  </div>
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
	    var cid=theRequest.cid;
	    getTitle(cid);
	  	pageFind(cid);
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
function  getTitle(cid){
	var url = "../../content/selectAll"; 
	var tid=''; 
	$.ajax({
		url:url,
		type:"post", 
		dataType:"json",
		async:false, 
	    data:{"tid":tid,"cid":cid},  
	    success:function(data){
    	pages = data.page.totalPage; 
        var title = '';
        for(var i=0;i<data.list.length;i++){
        	title+= '<li>'+'<div class="layui-serachlist-text">'+
            			'<h3><a href="javascript:;" onclick="showCourse('+data.list[i].tcoid+')">'+data.list[i].tcname+'</a></h3>'+
          			'</div>'+'</li>';
        }
        $('#title').append(title);
	    },
	    error:function(){ 
	    	top.layer.msg("后端查询接口异常！");
	    } 
	 });  
}
function pageFind(cid){
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
			  var curr = obj.curr;var tid='';
			  var url = "../../content/selectAll";
			  if(!first) { 
				  $.ajax({
					  url:url,
					  type:"post", 
					  dataType:"json",
					  async:false,
					  data:{"currPage":curr,"cid":cid,"tid":tid}, 
					  success:function(data){ 
						  $('#title').html("");
						  var title = '';
					        for(var i=0;i<data.list.length;i++){
					        	title+= '<li>'+'<div class="layui-serachlist-text">'+
					        	'<h3><a href="javascript:;" onclick="showCourse('+data.list[i].tcoid+')">'+data.list[i].tcname+'</a></h3>'+
					          			'</div>'+'</li>';
					        }
					        $('#title').append(title);
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
function showCourse(tcoid){
	var url = parent.location.search //获取url中"?"符后的字串 ('?modFlag=business&role=1')
	 var theRequest = new Object()
	 if (url.indexOf('?') != -1) {
	 var str = url.substr(1) //substr()方法返回从参数值开始到结束的字符串；
	 var strs = str.split('&')
	 for (var i = 0; i < strs.length; i++) {
	    theRequest[strs[i].split('=')[0]] = strs[i].split('=')[1]
	 	}
	 } 
	var cname=theRequest.cname;
	cname=getMsg(cname);
	var index = layui.layer.open({
		title : "详情",
		type : 2,
		content : "../mode/detail.jsp", 
		success : function(layero, index){
			var body = layer.getChildFrame('body', index);
		    var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
		    var url = "../../content/selContentById";
		    $.ajax({	//查找信息数据回填
				  url:url,
				  type:"post", 
				  dataType:"json",
				  async:false, 
				  data:{"tcoid":tcoid}, 
				  success:function(data){
					  if(data.flag==1){
						  body.find('.tcname').text(data.content.tcname);
						  body.find('.tcontent').text(data.content.tcontent); 
						  if(cname=="论文成果") {
							  	body.find('.sendname').text("发表刊物:"+data.content.sendname); 
							  	body.find('.sendtype').text("刊物级别:"+data.content.sendtype); 
							  	body.find('.sendtime').text("发表时间:"+data.content.sendtime); 
							  	body.find('.teaname').text("专利归属:"+data.content.tname); 
							  	body.find('#lwcg').show();
							  }else if(cname=="科研成果") {
							  	body.find('.creatime').text("立项时间:"+data.content.creatime); 
							  	body.find('.comefrom').text("项目来源:"+data.content.comefrom); 
							  	body.find('.money').text("项目经费(万元):"+data.content.money); 
							  	body.find('.outschool').text("其中校外经费(万元):"+data.content.outschool);  
							  	body.find('.teaname').text("专利归属:"+data.content.tname); 
							  	body.find('#kycg').show(); 
							  }else if(cname=="专利成果") {
							  	body.find('.belongunit').text("所属单位:"+data.content.belongunit); 
							  	body.find('.belongtype').text("专利类型:"+data.content.belongtype); 
							  	body.find('.belongnum').text("授权号:"+data.content.belongnum); 
							  	body.find('.belongtime').text("授权日期:"+data.content.belongtime); 
							  	body.find('.teaname').text("专利归属:"+data.content.tname); 
							  	body.find('#zlcg').show();
							  }
					  }else
						  top.layer.msg(data.msg);
					  
				  },
				  error:function(){ 
					  top.layer.msg("后端查询接口异常！");
				  }
			  });  
		    
			setTimeout(function(){
				layui.layer.tips('点击此处返回账号列表', '.layui-layer-setwin .layui-layer-close', {
					tips: 3
				});
			},1000)
		}
	})			
	layui.layer.full(index);
}
function getMsg(cname){
	gname=decodeURI(cname);
	return gname;
}
</script>
</html>