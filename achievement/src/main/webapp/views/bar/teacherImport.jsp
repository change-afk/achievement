<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="../common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="../common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="../css/personal.css" media="all">
</head>
<body class="childrenBody">
	<form class="layui-form">
		<div class="layui-upload"> 
		  <button type="button" class="layui-btn layui-btn-normal" id="cfile" style="margin-left:30px">选择文件</button> 
		  <div class="layui-upload-list">
		    <table class="layui-table">
		      <thead>
		        <tr>
			        <th>文件名</th>
			        <th>大小</th>
			        <th>状态</th>
			        <th>操作</th>
		       </tr> 
		      </thead>
		      <tbody id="demoList"></tbody> 
		    </table>
		  </div>
		  <button type="button" class="layui-btn" id="uploadBegin" style="margin-left:30px">开始上传</button>
		  <a type="button" class="layui-btn layui-btn-danger" href="../../teacher/download"  style="margin-left:30px">模板下载</a>
		 <div class="layui-upload-list" style="height:25px;"></div>
		</div> 
	</form>
	<script type="text/javascript" src="../common/layui/layui.all.js"></script>
	<script type="text/javascript" src="../jslib/teacherImport.js"></script>
</body>
</html>