<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>展示信息</title>
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
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
        <blockquote class="layui-elem-quote news_search">
			<div class="layui-inline" style="height:30px;"></div> 
			<div class="layui-inline">
				<div class="layui-form-mid layui-word-aux">此页面为可新闻动态内容页</div>
			</div>
		</blockquote>
            
    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
    	<div class="layui-tab-item layui-field-box layui-show">
        	<table class="layui-table table-hover" lay-even="" lay-skin="nob">
               <thead>
                   <tr>
                       <td></td>
                       <td style="display:none">ID</td>
                       <td>ID</td>
                       <td>新闻标题</td>
                       <td>创建时间</td>
                       <td>操作</td>
                   </tr>
               </thead>
               <tbody id="newsTable"></tbody>
            </table>
           <div class="larry-table-page clearfix">
           	<a class="layui-btn layui-btn-small passAdd_btn">添加</a>
     		<div id="page" class="page"></div>
	    </div>
	    </div>
    </div>
</div>
</div>
</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript" src="../jslib/news.js"></script>

</body>
</html>