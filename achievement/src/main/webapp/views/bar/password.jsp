<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>账号信息</title>
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
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input value="" placeholder="请输入关键字" class="layui-input search_input" type="text">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal passAdd_btn">添加账号</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
		<div class="layui-inline">
			<a class="layui-btn reset_btn">重置密码</a>
		</div>
		<div class="layui-inline">
			<div class="layui-form-mid layui-word-aux">可检索内容包括（工号、姓名、权限）</div>
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
                       <td>姓名</td>
                       <td>工号</td>
                       <td>权限</td>
                       <td>操作</td>
                   </tr>
               </thead>
               <tbody id="passTable"></tbody>
            </table>
            <div class="larry-table-page clearfix">
     		<div id="page" class="page"></div>
     		<div id="page2" class="page"></div>
	    </div>
	    </div>
    </div>
</div>
</div>
</section>
<script type="text/javascript" src="../common/layui/layui.js"></script>
<script type="text/javascript" src="../jslib/password.js"></script>
<script type="text/javascript">

</script>
</body>
</html>